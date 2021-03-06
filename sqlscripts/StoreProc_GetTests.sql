USE [FusionRequest]
GO
/****** Object:  StoredProcedure [dbo].[GetTests]    Script Date: 03/10/2019 10:09:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
		t.TestId,
		TestName,
		TestDescription,
		CreationDateTime,
		StartDateTime,
		LastActiveDateTime,
		EndDateTime,
		TotalRecords,
		RecordsProcessed,
		NumberOfErrors,
		TestCreator,
		IncludeAirports,
		IncludeAirlines,
		FromDate,
		ToDate,
		TestIsRunning,
		IncludeFusionRequestTypes, 
		case
			when TestIsRunning = 1 then ''Running''
			when not tq.TestId is null then ''Queued''
			when not StartDateTime is null and EndDateTime is null then ''Stopped''
			when not EndDateTime is null then ''Finished''
			else ''Never Started''
		end as Status
	from Tests t left outer join TestsQueue tq on t.TestId=tq.TestId
	where
			CreationDateTime >= cast(''' + @DateFrom + ''' as datetime) and 
			CreationDateTime <= cast(''' + @DateTo + '''  as datetime) 
	order by 
			CreationDateTime desc 
	offset ' + cast(@firstRecord as nvarchar(20)) + ' rows fetch next ' + cast(@PageSize as nvarchar(20)) + ' rows only
	'
	exec sp_executesql @sql


end