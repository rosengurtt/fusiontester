ALTER procedure [dbo].[GetNextFusionRequestToTest]
	@TestId integer
as
begin
	set nocount on;
	
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