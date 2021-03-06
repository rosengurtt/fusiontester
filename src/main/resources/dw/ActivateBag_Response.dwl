%dw 2.0
output application/xml skipNullOn="everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
	ActivateBag_Response: (payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.*ns01#ActivateBagResult map (i, ind) ->{
		RequestId: i.ns02#RequestId,
		ResponseId: i.ns02#ResponseId,
		DcsRequestsIds: i.ns02#DcsRequestsIds.ns03#guid,
		Errors: (i.ns02#Errors.*ns02#FusionError map (err, errInd) -> {
			FusionError: {
				Critical: err.ns01#Critical,
				Code: err.ns01#Code,
				Description: err.ns01#Description,
				Method: err.ns01#Method,
				Source: err.ns01#Source
			}
		}),
		Status: i.ns01#Status,
		BagDetails: (i.*ns01#BagDetails map (bagDetails, bagDetailsIndex) -> {
			BaggageItemId: bagDetails.ns02#BaggageItemId,
			BagTagNumber: bagDetails.ns02#BagTagNumber,
			BagWeight: bagDetails.ns02#BagWeight,
			BagRegistrationTime: bagDetails.ns02#BagRegistrationTime,
			Active: bagDetails.ns02#Active,
			Dropped: bagDetails.ns02#Dropped,
			FlightId: bagDetails.ns02#FlightId,
			DepartureAirportCode: bagDetails.ns02#DepartureAirportCode,
			ArrivalAirportCode: bagDetails.ns02#ArrivalAirportCode,
			ScheduledDepartureDateTime: bagDetails.ns02#ScheduledDepartureDateTime,
			PassengerId: bagDetails.ns02#PassengerId,
			LastName: bagDetails.ns02#LastName,
			FirstName: bagDetails.ns02#FirstName,
			Title: bagDetails.ns02#Title,			
			SessionId: bagDetails.ns02#SessionId,
			PNR: bagDetails.ns02#PNR,
		})
	})
}