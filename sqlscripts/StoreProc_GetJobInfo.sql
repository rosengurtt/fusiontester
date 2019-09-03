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
		@IsTestRecordIncomplete bit
	
	-- Get the status (active or not) of the test job and the time the test batch started
	select 
			@LastActiveDateTime = LastActiveDateTime,
			@StartDateTime = convert(varchar, StartDateTime, 121)
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
	/*
	-- Get the number of records still to process
	declare 
		@sql nvarchar(max), 
		@where nvarchar(max), 
		@IncludeAirports nvarchar(max), 
		@IncludeAirlines nvarchar(max),
		@IncludeFusionRequestType nvarchar(max),
		@FromDate nvarchar(50),
		@ToDate nvarchar(50),
		@RemainingRecords int

	select
			@IncludeAirports = IncludeAirports,
			@IncludeAirlines = IncludeAirlines,
			@FromDate = convert(varchar, FromDate, 121),
			@ToDate= convert(varchar, ToDate, 121),
			@IncludeFusionRequestType = IncludeFusionRequestType
	from
			Tests
	where
			TestId = @TestId

		
	set @where = ' not FusionRequestId in (
			select FusionRequestId
			from FusionRequestsTests
			where TestId = ''' + cast(@TestId as nvarchar(9)) + ''')
			'

	if (@IncludeAirports <> '%')
		set @where = @where + ' and 
							Airport in (' + @IncludeAirports + ') '		

	if (@IncludeAirlines <> '%')
		set @where = @where + ' and 
							Airline in (' + @IncludeAirlines + ') '
		
	if (@IncludeFusionRequestType <> '%')
		set @where = @where + ' and 
							RequestType in (' + @IncludeFusionRequestType + ') '
		
	set @where = @where + ' and 
							RequestTime >= ''' + @FromDate + ''' '
		
	set @where = @where + ' and 
							RequestTime <= ''' + @ToDate + '''  '

	set @sql = '
	select @RemainingRecords = count(*)
	from FusionRequests
	where ' + @where 
	exec sp_executesql @sql, N'@RemainingRecords int output', @RemainingRecords = @RemainingRecords output
	*/

	select @RemainingRecords = count(*)
	from
		TestsRecords 
	where 
		not FusionRequestId in
		(select FusionRequestId from FusionRequestsTests where TestId = @TestId)

	select 
		@IsTestJobActive as IsTestJobActive,
		@StartDateTime as StartDateTime,
		@RemainingRecords as RemainingRecords
end