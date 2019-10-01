ALTER proc [dbo].[GetTestResults]
	@TestId int,
	@PageSize int = 10,
	@Page int = 1
as
begin

	declare @firstRecord int
	
	if (@Page is null)
		set @Page = 1

	if (@PageSize is null)
		set @PageSize = 20

	set @firstRecord = (@Page - 1) * @PageSize 

	declare @sql nvarchar(max) 
	
	set @sql = '
	select 
			TestResultId,
			fr.FusionRequestId as FusionRequestId,
			RequestType as FusionRequestType,
			TestResult,
			TestTime,
			NumberOfDifferences,
			DCScallsMatch,
			Airline,
			Airport,
			RequestTime as EventTime

	from 
		TestResults tr inner join
		FusionRequests fr on tr.FusionRequestId = fr.FusionRequestId
	where TestId = ' + cast(@TestId as nvarchar(40)) + '
	order by RequestTime offset ' + cast(@firstRecord as nvarchar(20)) + ' rows fetch next ' + cast(@PageSize as nvarchar(20)) + ' rows only
	'
	exec sp_executesql @sql
end
