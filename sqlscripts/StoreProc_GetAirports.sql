ALTER proc [dbo].[GetAirports]
as
begin

	select distinct airport
	from FusionRequests

end