ALTER proc [dbo].[GetTests]
	@DateFrom nvarchar(50) = '1970-01-01',
	@DateTo nvarchar(50) = '3000-01-01',
	@PageSize int = 10,
	@Page int = 1
as
begin
	
	declare @firstRecord int = (@Page - 1) * @PageSize

	if (@DateFrom  is null)
		set @DateFrom = '1970-01-01'

	if (@DateTo  is null)
		set @DateTo = '3000-01-01'

	declare @sql nvarchar(max) 
	
	set @sql = '
	select 
		TestId
		,TestName
		,TestDescription
		,CreationDateTime
		,StartDateTime
		,LastActiveDateTime
		,EndDateTime
		,TotalRecords
		,RecordsProcessed
		,NumberOfErrors
		,TestCreator
		,IncludeAirports
		,IncludeAirlines
		,FromDate
		,ToDate
		,IncludeFusionRequestTypes
		,TestIsRunning
	from Tests
	where
			CreationDateTime >= cast(''' + @DateFrom + ''' as datetime) and 
			CreationDateTime <= cast(''' + @DateTo + '''  as datetime) 
	order by CreationDateTime offset ' + cast(@firstRecord as nvarchar(20)) + ' rows fetch next ' + cast(@PageSize as nvarchar(20)) + ' rows only
	'
	exec sp_executesql @sql


end