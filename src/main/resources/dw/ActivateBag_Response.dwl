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
		BagDetails: {
			BaggageItemId: i.ns01#BagDetails.ns02#BaggageItemId,
			BagWeight: i.ns01#BagDetails.ns02#BagWeight,
			BagRegistrationTime: i.ns01#BagDetails.ns02#BagRegistrationTime,
			Active: i.ns01#BagDetails.ns02#Active,
			Dropped: i.ns01#BagDetails.ns02#Dropped,
			FlightId: i.ns01#BagDetails.ns02#FlightId,
			ScheduledDepartureDateTime: i.ns01#BagDetails.ns02#ScheduledDepartureDateTime,
			PassengerId: i.ns01#BagDetails.ns02#PassengerId,
			SessionId: i.ns01#BagDetails.ns02#SessionId
		}
	})
}