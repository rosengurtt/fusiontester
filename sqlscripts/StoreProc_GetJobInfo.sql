USE [FusionTester]
GO
/****** Object:  StoredProcedure [dbo].[GetJobInfo]    Script Date: 11/10/2019 12:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[GetJobInfo]
	@TestId int,
	@TimeoutInMilliSeconds bigint
as
begin

	declare 
		@LastActiveDateTime datetime, 
		@CurrentDateTime datetime, 
		@StartDateTime nvarchar(30), 
		@IsTestJobActive nvarchar(5),
		@RemainingRecords int,
		@IsTestRecordIncomplete bit,
		@TestIsRunning nvarchar(10)
	
	-- We use a transaction, to avoid a racing condition
	begin transaction tran1
		begin try
			-- Get the status (active or not) of the test job and the time the test batch started
			select 
					@LastActiveDateTime = LastActiveDateTime,
					@StartDateTime = convert(varchar, StartDateTime, 121),
					@TestIsRunning = case TestIsRunning 
										when  1 then 'TRUE' 
										else 'FALSE'
									 end
			from Tests
			where TestId = @TestId

			-- Any test result record with a status of 0, is a record not completed yet, so there is probably a Mulesoft thread processing it
			if ((select count(*) from TestResults where TestId = @TestId and TestStatus = 0) > 0)
				set @IsTestRecordIncomplete = 1
			else
				set @IsTestRecordIncomplete = 0	

			-- If current time is older than start time, it means the app has changed the system time to the event time, so the app is busy.
			if (@LastActiveDateTime > GetDate() and @IsTestRecordIncomplete = 1)
				set @IsTestJobActive = 'TRUE'
			else
			begin
				-- If there is a test record being processed, but the processing started too long ago, we asume the thread is dead and we return @IsTestJobActive = false
				-- We also do clean up, we remove the record from TestResults
				-- Otherwise it is alive and we return @IsTestJobActive = true
				if ( (@IsTestRecordIncomplete = 1) and abs(datediff(second, @LastActiveDateTime,  GetDate())) < @TimeoutInMilliSeconds / 1000 )
					set @IsTestJobActive = 'TRUE'
				else
				begin
					delete from TestResults
					where 
						TestId = @TestId and
						TestStatus = 0

					set @IsTestJobActive = 'FALSE'
				end
			end	

			-- @RemainingRecords is the number of records of the test that have not been processed yet
			select @RemainingRecords = count(*)
			from
				TestsRecords 
			where 
				TestId = @TestId and
				not FusionRequestId in
				(select FusionRequestId from TestResults where TestId = @TestId)

			select 
				@IsTestJobActive as IsTestJobActive,
				@StartDateTime as StartDateTime,
				@RemainingRecords as RemainingRecords,
				@TestIsRunning as TestIsRunning
		end try

		begin catch

			  rollback transaction tran1
			  select 
					1 as IsTestJobActive,
					'' as StartDateTime,
					1 as RemainingRecords,
					1 as TestIsRunning
		end catch  
	commit transaction
end
