ALTER procedure [dbo].[GetNextFusionRequestToTest]
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
		@ToDate nvarchar(50),
		@FusionRequestId nvarchar(50)

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
			where TestId = ' + cast(@TestId as nvarchar(9)) + ')'

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
	update Tests
	set LastActiveDateTime = GetDate()
	where TestId = ' + cast(@TestId as varchar(10)) + '
	truncate table DCSrequestsUnderTest

	set @FusionRequestId = (select top 1 FusionRequestId
	from FusionRequests
	where ' + @where + '
	order by RequestTime)

	insert into FusionRequestsTests (FusionRequestId, TestTime, TestStatus, TestId)
	values  (@FusionRequestId, GetDate(), 0, ' + cast(@TestId as nvarchar(10)) + ')
	
	select 
		FusionRequestId,
		FusionRequestXml,
		FusionResponseXml,
		RequestType,
		cast(RequestTime as nvarchar(50)) as RequestTime
	from 
		FusionRequests
	where FusionRequestId = @FusionRequestId	
	'
	exec sp_executesql @sql, N'@FusionRequestId nvarchar(50)', @FusionRequestId

end