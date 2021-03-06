ALTER procedure [dbo].[GetFusionRequestsToTest]
	@TestId integer
as
begin
	set nocount on;

	declare 
		@sql nvarchar(max), 
		@where nvarchar(max), 
		@IncludeAirports nvarchar(max), 
		@IncludeAirlines nvarchar(max),
		@IncludeFusionRequestType nvarchar(max),
		@FromDate nvarchar(50),
		@ToDate nvarchar(50)

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

		
	set @where = ' 1=1 '

	if (@IncludeAirports <> '%')
		set @where = @where + ' and Airport in (' + @IncludeAirports + ') '		

	if (@IncludeAirlines <> '%')
		set @where = @where + ' and Airline in (' + @IncludeAirlines + ') '
		
	if (@IncludeFusionRequestType <> '%')
		set @where = @where + ' and RequestType in (' + @IncludeFusionRequestType + ') '
		
	set @where = @where + ' and RequestTime >= ''' + @FromDate + ''' '
		
	set @where = @where + ' and RequestTime <= ''' + @ToDate + '''  '

	set @sql = '
	select FusionRequestId
	from FusionRequests
	where ' + @where

	exec (@sql)

end
