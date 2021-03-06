ALTER proc [dbo].[StartTest]
	@TestId int
as
begin

	if ((select count(*) from Tests where TestId=@TestId) = 0)
	begin
		select 'Test does not exist' as Result
		return
	end

	if ((select count(*) from Tests where TestId <> @TestId and TestIsRunning = 1 and DateDiff(minute, LastActiveDateTime, GetDate()) < 5) > 0)
	begin
		insert into TestsQueue(TestId)
		values (@TestId)
		
		select 'Test queued' as Result
		return
	end
	if ((select count(*) from Tests where TestId = @TestId and not EndDateTime is null) > 0)
	begin
		select 'The test has already completed' as Result
		return
	end

	begin try

		truncate table DCSrequestsUnderTest

		update	Tests
		set TestIsRunning = 0
		
		update	Tests
		set		
			LastActiveDateTime = DATEADD(second, -20, GetDate()),
			StartDateTime = GetDate(),
			EndDateTime = null,
			TestIsRunning = 1
		where	TestId = @TestId 

		-- Insert records to TestsRecords table
		declare 
			@sql nvarchar(max), 
			@where nvarchar(max), 
			@IncludeAirports nvarchar(max), 
			@IncludeAirlines nvarchar(max),
			@IncludeFusionRequestTypes nvarchar(max),
			@FromDate nvarchar(50),
			@ToDate nvarchar(50)

		select
				@IncludeAirports = IncludeAirports,
				@IncludeAirlines = IncludeAirlines,
				@FromDate = convert(varchar, FromDate, 121),
				@ToDate= convert(varchar, ToDate, 121),
				@IncludeFusionRequestTypes = IncludeFusionRequestTypes
		from
				Tests
		where
				TestId = @TestId

		delete from TestsRecords
		where TestId = @TestId
		
		set @where = ' not FusionRequestId in (
				select FusionRequestId
				from TestResults
				where TestId = ''' + cast(@TestId as nvarchar(9)) + ''')
				'

		if (@IncludeAirports <> '%')
			set @where = @where + ' and 
								Airport in (' + @IncludeAirports + ') '		

		if (@IncludeAirlines <> '%')
			set @where = @where + ' and 
								Airline in (' + @IncludeAirlines + ') '
		
		if (@IncludeFusionRequestTypes <> '%')
			set @where = @where + ' and 
								RequestType in (' + @IncludeFusionRequestTypes + ') '
		
		set @where = @where + ' and 
								RequestTime >= ''' + @FromDate + ''' '
		
		set @where = @where + ' and 
								RequestTime <= ''' + @ToDate + '''  '

		set @sql = '
			insert into TestsRecords(TestId, FusionRequestId)
			select @TestId, FusionRequestId
			from FusionRequests
			where ' + @where + '
		'
		exec sp_executesql @sql, N'@TestId int', @TestId

		select 'Test started' as Result
	end try
	begin catch
		select 'An error happened, test was not started' as Result
	end catch

end