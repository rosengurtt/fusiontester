ALTER proc [dbo].[GetAirlines]
as
begin

	select distinct airline
	from FusionRequests

end