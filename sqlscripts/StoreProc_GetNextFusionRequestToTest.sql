ALTER procedure [dbo].[GetNextFusionRequestToTest]
	@TestId integer
as
begin
	set nocount on;

	-- Sanity checks
	if ((select count(*) from Tests where TestId <> @TestId and TestIsRunning = 1) > 0)
	begin
		select 'There is another test running' as error
		return
	end	

	if ((select count(*) from Tests where TestId = @TestId and TestIsRunning = 1) = 0)
	begin
		select 'Test is not supposed to be running' as error
		return
	end

	-- Clean up 
	delete from FusionRequestsTests
	where TestId = @TestId and TestStatus = 0

	delete from DCSrequestsUnderTest
	
	-- Get next record

	declare @FusionRequestId nvarchar(50)

	set @FusionRequestId = (
		select top 1 fr.FusionRequestId
		from 
			FusionRequests fr inner join
			TestsRecords tr on fr.FusionRequestId = tr.FusionRequestId
		where 
			tr.TestId = @TestId and
			not fr.FusionRequestId in 
			(select FusionRequestId from FusionRequestsTests where TestId =  @TestId)
		order by fr.RequestTime)

	-- Create record in FusionRequestsTests
		
	insert into FusionRequestsTests (FusionRequestId, TestTime, TestStatus, TestId)
	values  (@FusionRequestId, GetDate(), 0,  cast(@TestId as nvarchar(10))) 


	-- Return data
	select 
			FusionRequestId,
			FusionRequestXml,
			FusionResponseXml,
			RequestType,
			cast(RequestTime as nvarchar(50)) + 'Z' as RequestTime
	from 
		FusionRequests
	where FusionRequestId = @FusionRequestId	

end