ALTER proc [dbo].[GetFusionRequestTypes]
as
begin

	select distinct RequestType
	from FusionRequests
	where not RequestType like 'IATA%'
	order by RequestType

end
