ALTER proc  [dbo].[UpdateTest]
	@TestId int,
	@TestName nvarchar(200),
	@TestDescription nvarchar(1000)='',
	@TestCreator nvarchar(50)='',
	@IncludeAirports nvarchar(max)='%',
	@IncludeAirlines nvarchar(max)='%',
	@FromDate nvarchar(50) = '1900-01-01 00:00:00',
	@ToDate nvarchar(50) = '3000-01-01 00:00:00', 
	@IncludeFusionRequestTypes nvarchar(max) = '%'
as
begin

	if (@TestCreator is null)
		set @TestCreator =''

	if (@TestDescription is null)
		set @TestDescription = ''

	if (@IncludeAirports is null or @IncludeAirports = '''ALL''')
		set @IncludeAirports = '%'

	if (@IncludeAirlines is null or @IncludeAirlines = '''ALL''')
		set @IncludeAirlines = '%'

	if (@FromDate is null or isDate(@FromDate) = 0)
		set @FromDate = '1900-01-01 00:00:00'
	
	if (@ToDate is null or isDate(@ToDate) = 0)
		set @ToDate = '3000-01-01 00:00:00'

	if (@IncludeFusionRequestTypes is null or @IncludeFusionRequestTypes = '''ALL''')
		set @IncludeFusionRequestTypes = '%'


	-- Calculate records to process
	declare 
		@sql nvarchar(max), 
		@where nvarchar(max), 
		@RecordsToProcess int
		
	set @where = ''

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
	select @RecordsToProcess = count(*)
		from FusionRequests
		where 
			not RequestType like ''IATA_'' ' + @where 

	exec sp_executesql @sql, N'@RecordsToProcess int output', @RecordsToProcess=@RecordsToProcess output

	update Tests
	set 
			TestName = @TestName,
			TestDescription = @TestDescription,
			TestCreator = @TestCreator,
			IncludeAirports = @IncludeAirports,
			IncludeAirlines = @IncludeAirlines,
			IncludeFusionRequestTypes = @IncludeFusionRequestTypes,
			FromDate = convert(datetime,@FromDate),
			ToDate = convert(datetime,@ToDate),
			TotalRecords = @RecordsToProcess
	where	
			TestId = @TestId

	select @TestId as TestId
end
