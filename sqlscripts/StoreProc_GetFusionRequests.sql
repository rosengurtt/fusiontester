ALTER PROCEDURE [dbo].[GetFusionRequests]
	@airline	nvarchar(max) = null,
	@airport	nvarchar(max) = null,
	@PNR		nvarchar(max) = null,
	@RequestType nvarchar(max) = null,
	@FromDate	nvarchar(50) = null,
	@ToDate		nvarchar(50) = null,
	@PageSize	int			= 10,
	@Page		int			= 1
AS
BEGIN


	declare @firstRecord int
	
	if (@Page is null)
		set @Page = 1

	if (@PageSize is null)
		set @PageSize = 10

	set @firstRecord = (@Page - 1) * @PageSize 

		
	declare @where nvarchar(max) = ' 1=1 '

	if (not @airport is null)
		set @where = @where + ' and Airport in (' + @airport + ') '		

	if (not @airline is null)
		set @where = @where + ' and Airline in (' + @airline + ') '
		
	if (not @RequestType is null)
		set @where = @where + ' and RequestType in (' + @RequestType + ') '

	if (not @RequestType is null)
		set @where = @where + ' and RequestType in (' + @RequestType + ') '

	if (not @FromDate is null)
		set @where = @where + ' and RequestTime >= ''' + @FromDate + ''' '

	if (not @ToDate is null)	
		set @where = @where + ' and RequestTime <= ''' + @ToDate + '''  '

	declare @sql nvarchar(max) = '
	select 
			FusionRequestId
			,RequestSourceId
			,SessionId
			,PNR
			,Airline
			,Airport
			,RequestType
			,left(cast(FusionRequestXml as nvarchar(max)), 200) + ''...'' as FusionRequestXml
			,left(cast(FusionResponseXml as nvarchar(max)), 200) + ''...'' as FusionResponseXml
			,RequestTime
			,ResponseTime
	from FusionRequests
	where ' + @where +  '
	order by RequestTime offset ' + cast(@firstRecord as nvarchar(20)) + ' rows fetch next ' + cast(@PageSize as nvarchar(20)) + ' rows only
	'

	exec (@sql)

END
