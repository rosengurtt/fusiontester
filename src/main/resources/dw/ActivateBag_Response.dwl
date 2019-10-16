%dw 2.0
output application/xml skipNullOn="everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
	ActivateBag_Response: {
		RequestId: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns02#RequestId,
		ResponseId: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns02#ResponseId,
		DcsRequestsIds: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns02#DcsRequestsIds.ns03#guid,
		Errors: (payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns02#Errors.*ns02#FusionError map {
			FusionError: {
				Critical: $.ns01#Critical,
				Code: $.ns01#Code,
				Description: $.ns01#Description,
				Method: $.ns01#Method,
				Source: $.ns01#Source
			}
		}),
		BagDetails: {
			BaggageItemId: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#BaggageItemId,
			BagWeight: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#BagWeight,
			BagRegistrationTime: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#BagRegistrationTime,
			Active: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#Active,
			Dropped: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#Dropped,
			FlightId: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#FlightId,
			ScheduledDepartureDateTime: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#ScheduledDepartureDateTime,
			PassengerId: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#PassengerId,
			SessionId: payload.ns0#Envelope.ns0#Body.ns01#ActivateBagResponse.ns01#ActivateBagResult.ns01#BagDetails.ns02#SessionId
		}
	}
}