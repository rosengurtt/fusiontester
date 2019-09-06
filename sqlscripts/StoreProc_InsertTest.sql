ALTER proc  [dbo].[InsertTest]
	@TestName nvarchar(200),
	@TestDescription nvarchar(1000)='',
	@TestCreator nvarchar(50)='',
	@IncludeAirports nvarchar(max)='%',
	@IncludeAirlines nvarchar(max)='%',
	@FromDate nvarchar(50) = '1900-01-01 00:00:00',
	@ToDate nvarchar(50) = '3000-01-01 00:00:00', 
	@IncludeFusionRequestType nvarchar(max) = '%'
as
begin

	if (@TestDescription is null)
		set @TestDescription = ''

	if (@IncludeAirports is null)
		set @IncludeAirports = '%'

	if (@IncludeAirlines is null)
		set @IncludeAirlines = '%'

	if (@FromDate is null)
		set @FromDate = '1900-01-01 00:00:00'
	
	if (@ToDate is null)
		set @ToDate = '3000-01-01 00:00:00'

	if (@IncludeFusionRequestType is null)
		set @IncludeFusionRequestType = '%'


	-- Calculate records to process
	declare 
		@sql nvarchar(max), 
		@where nvarchar(max), 
		@RecordsToProcess int
		
	set @where = ' 1 = 1 '

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
	select @RecordsToProcess = count(*)
		from FusionRequests
		where ' + @where 

	exec sp_executesql @sql, N'@RecordsToProcess int output', @RecordsToProcess=@RecordsToProcess output

 insert into Tests (
				TestName
				,TestDescription
				,TestCreator
				,IncludeAirports
				,IncludeAirlines
				,FromDate
				,ToDate
				,IncludeFusionRequestType
				,TotalRecords
				)
	values	(
				@TestName
				,@TestDescription
				,@TestCreator
				,@IncludeAirports
				,@IncludeAirlines
				,convert(datetime,@FromDate)
				,convert(datetime,@ToDate)
				,@IncludeFusionRequestType
				,@RecordsToProcess
				)

	select @@identity as TestId
end