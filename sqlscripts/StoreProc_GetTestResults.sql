USE [FusionRequest]
GO
/****** Object:  StoredProcedure [dbo].[GetTestResults]    Script Date: 12/09/2019 16:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
			fr.FusionRequestId,
			RequestType as FusionRequestType,
			TestResult,
			TestTime,
			ExpectedResponse,
			ActualResponse,
			ActualDCScalls,
			NumberOfDifferences,
			DCScallsMatch,
			RequestTime,
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
