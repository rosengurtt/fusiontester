
ALTER procedure [dbo].[GetFusionRequestDetails]
	@FusionRequestId nvarchar(100)
as
begin

	truncate table DCSrequestsUnderTest

	delete from FusionRequestsTests 
	where  FusionRequestId = @FusionRequestId 

	insert into FusionRequestsTests (FusionRequestId, TestTime, TestStatus)
	values  (@FusionRequestId, GetDate(), 0)
	
	-- Get the data
	select 
		FusionRequestId,
		FusionRequestXml,
		FusionResponseXml,
		RequestType,
		cast(RequestTime as nvarchar(50)) as RequestTime
	from 
		FusionRequests
	where FusionRequestId = @FusionRequestId

end
