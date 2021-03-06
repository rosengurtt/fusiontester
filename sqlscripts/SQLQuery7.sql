ALTER proc [dbo].[InitializeTest]
	@TestId int,
	@Clean bit
as
begin

	truncate table DCSrequestsUnderTest

	update	Tests
	set		
		LastActiveDateTime = DATEADD(second, -20, GetDate()),
		StartDateTime = GetDate(),
		EndDateTime = null
	where	TestId = @TestId 

	if (@Clean = 1)
	begin
		delete from FusionRequestsTests 
		where		TestId = @TestId 	
	end

	-- Insert records to TestsRecords table
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
	delete from TestsRecords
	where TestId = @TestId

	insert into TestsRecords(TestId, FusionRequestId)
	select @TestId, FusionRequestId
	from FusionRequests
	where ' + @where 
	exec sp_executesql @sql, N'@TestId int', @TestId

end