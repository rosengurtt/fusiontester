ALTER proc [dbo].[GetJobInfo]
	@TestId int,
	@TimeoutInMilliSeconds bigint
as
begin

	declare 
		@LastActiveDateTime datetime, 
		@CurrentDateTime datetime, 
		@StartDateTime nvarchar(30), 
		@StartedJobs int, 
		@IsTestJobActive nvarchar(5),
		@RemainingRecords int,
		@IsTestRecordIncomplete bit,
		@TestIsRunning nvarchar(10)
	
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

	select @StartedJobs= count(*)
	from FusionRequestsTests
	where 
			TestId = @TestId and
			TestStatus = 0

	if ((select count(*) from FusionRequestsTests where TestId = @TestId and TestStatus = 0) > 0)
		set @IsTestRecordIncomplete = 1
	else
		set @IsTestRecordIncomplete = 0	

	-- If current time is older than start time, it means the app has changed the system time to the event time, so the app is busy.
	if (@LastActiveDateTime > GetDate() and @IsTestRecordIncomplete = 1)
		set @IsTestJobActive = 'TRUE'
	else
	begin
		if ( (@StartedJobs > 0) and abs(datediff(second, @LastActiveDateTime,  GetDate())) < @TimeoutInMilliSeconds / 1000 )
			set @IsTestJobActive = 'TRUE'
		else
		begin
			delete from FusionRequestsTests
			where 
				TestId = @TestId and
				TestStatus = 0

			set @IsTestJobActive = 'FALSE'
		end
	end	

	select @RemainingRecords = count(*)
	from
		TestsRecords 
	where 
		TestId = @TestId and
		not FusionRequestId in
		(select FusionRequestId from FusionRequestsTests where TestId = @TestId)

	select 
		@IsTestJobActive as IsTestJobActive,
		@StartDateTime as StartDateTime,
		@RemainingRecords as RemainingRecords,
		@TestIsRunning as TestIsRunning
end