ALTER proc [dbo].[GetFusionRequestTypes]
as
begin

	select distinct RequestType
	from FusionRequests

end