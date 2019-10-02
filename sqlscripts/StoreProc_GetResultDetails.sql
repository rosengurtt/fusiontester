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


	-- Get Expected DCS calls

	set @sql2 = '
	declare req cursor for
	select  dbo.RenderXMLToString(cast(DcsRequestXml as nvarchar(max))) + char(10) + char(13)
	from 
			DcsRequests
	where 
			FusionRequestId = '''+ @FusionRequestId + '''
	order by 
			RequestTime

	declare @reqXml nvarchar(max)
	set @ExpectedDCScalls = ''''

	open req
	fetch next from req into @reqXml
	while (@@FETCH_STATUS=0)
	begin
		select @ExpectedDCScalls =  @ExpectedDCScalls + @reqXml
		fetch next from req into @reqXml
	end
	deallocate req'
	
	exec sp_executesql @sql2, N'@ExpectedDCScalls nvarchar(max) output', @ExpectedDCScalls = @ExpectedDCScalls output
	
	-- Get data to send back
	set @sql3 = '
	select 
			TestResultId,
			fr.FusionRequestId as FusionRequestId,
			ExpectedResponse,
			ActualResponse,
			@ExpectedDCScalls as ExpectedDCScalls,
			tr.ActualDCScalls as ActualDCScalls
	from 
		TestResults tr inner join
		FusionRequests fr on tr.FusionRequestId = fr.FusionRequestId
	where TestResultId = ' + cast(@TestResultId as nvarchar(40)) + ' and tr.FusionRequestId = ''' +  @FusionRequestId  + ''''
	
	exec sp_executesql @sql3, N'@ExpectedDCScalls nvarchar(max)', @ExpectedDCScalls


end
