%dw 2.0
output application/xml
skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
---
{
	CheckInPassenger_Response: {
		RequestId: payload.ns0#Envelope.ns0#Body.ns01#CheckInPassengerResponse.ns01#CheckInPassengerResult.ns02#RequestId,
		ResponseId: payload.ns0#Envelope.ns0#Body.ns01#CheckInPassengerResponse.ns01#CheckInPassengerResult.ns02#ResponseId,
		Errors: (payload.ns0#Envelope.ns0#Body.ns01#CheckInPassengerResponse.ns01#CheckInPassengerResult.ns02#Errors.*ns02#FusionError map
		{
			FusionError: {
				Code: $.ns02#Code,
				Critical: $.ns02#Critical,
				Description: $.ns02#Description,
				Method: $.ns02#Method,
				Source: $.ns02#Source
			}
		}),
		Passengers: {
			Passenger: (payload.ns0#Envelope.ns0#Body.ns01#CheckInPassengerResponse.ns01#CheckInPassengerResult.ns01#Passengers.*ns02#Passenger map {
				PassengerId: $.ns02#PassengerId,
				FirstName: $.ns02#FirstName,
				LastName: $.ns02#LastName,
				NativePassengerId: $.ns02#NativePassengerId as String default null,
				DateOfBirth: $.ns02#DateOfBirth,
				PassengerSequenceNumber: $.ns02#PassengerSequenceNumber as String default null,
				SeatNumber: $.ns02#SeatNumber,
				PaxType: $.ns02#PaxType,
				PassengerRPH: $.ns02#PassengerRPH as String default null,
				ConnectingFlightNumber: $.ns02#ConnectingFlightNumber as String default null,
				ConfirmedDga: $.ns02#ConfirmedDga as String default null,
				ConfirmedIdentity: $.ns02#ConfirmedIdentity as String default null,
				AllowanceRetrieved: $.ns02#AllowanceRetrieved as String default null,
				IsSelected: $.ns02#IsSelected as String default null,
				IsSelectableForBoardingPass: $.ns02#IsSelectableForBoardingPass as String default null,
				ClearanceRequired: $.ns02#ClearanceRequired as String default null,
				ClearanceStatus: $.ns02#ClearanceStatus,
				CheckedIn: $.ns02#CheckedIn as String default null,
				RequiresCheckin: $.ns02#RequiresCheckin as String default null,
				SupportsCheckin: $.ns02#SupportsCheckin as String default null,
				Boarded: $.ns02#Boarded as String default null,
				Active: $.ns02#Active as String default null,
				DocumentCheckRequired: $.ns02#DocumentCheckRequired as String default null,
				CustomProperties: {	
						 string: $.ns02#CustomProperties.*string					
					},
			})
		}
	}
}