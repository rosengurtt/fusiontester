ALTER proc [dbo].[GetResultDetails]
	@TestResultId int
as
begin

	declare 
				@firstRecord int, 
				@ExpectedDCScalls nvarchar(max), 
				@FusionRequestId nvarchar(50),
				@sql1 nvarchar(max), 
				@sql2 nvarchar(max), 
				@sql3 nvarchar(max)
	
	-- Get FusionRequestId
	set @sql1 = '
	select
			@FusionRequestId = FusionRequestId
	from
			TestResults
	where
			TestResultId = ' + cast(@TestResultId as nvarchar(50))

	exec sp_executesql @sql1, N'@FusionRequestId nvarchar(50) output', @FusionRequestId = @FusionRequestId output



	
	-- Get data to send back
	set @sql3 = '
	select 
			TestResultId,
			fr.FusionRequestId as FusionRequestId,
			ExpectedResponse,
			ActualResponse,
			ExpectedDCScalls,
			ActualDCScalls
	from 
		TestResults tr inner join
		FusionRequests fr on tr.FusionRequestId = fr.FusionRequestId
	where TestResultId = ' + cast(@TestResultId as nvarchar(40)) + ' and tr.FusionRequestId = ''' +  @FusionRequestId  + ''''
	
	exec sp_executesql @sql3, N'@ExpectedDCScalls nvarchar(max)', @ExpectedDCScalls


end
