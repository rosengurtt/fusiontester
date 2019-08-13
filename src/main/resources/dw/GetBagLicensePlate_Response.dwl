%dw 2.0
output application/xml skipNullOn="everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
	GetBagLicensePlate_Response: {
		RequestId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns02#RequestId,
		ResponseId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns02#ResponseId,
		DcsRequestsIds: {
			guid: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns02#DcsRequestsIds.ns03#guid
		},
		Errors: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns02#Errors.*ns02#FusionError map
		{
			FusionError: {
				Code: $.ns02#Code,
				Critical: $.ns02#Critical,
				Description: $.ns02#Description,
				Method: $.ns02#Method,
				Source: $.ns02#Source
			}
		}),
		LicensePlate: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#LicensePlate as Number default null,
		RoundedWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#RoundedWeight as Number default null,
		Passenger: {
			PassengerId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PassengerId,
			Title: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Title,
			FirstName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#FirstName,
			LastName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#LastName,
			NativePassengerId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#NativePassengerId as Number default null,
			MarketingCarrierCode: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#MarketingCarrierCode,
			Gender: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Gender,
			DateOfBirth: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#DateOfBirth,
			PassengerSequenceNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PassengerSequenceNumber,
			SeatNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#SeatNumber,
			PaxType: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PaxType,
			PassengerRPH: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PassengerRPH as Number default null,
			Barcode: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Barcode,
			ConnectingFlightNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ConnectingFlightNumber as Number default null,
			ConfirmedDga: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ConfirmedDga as Boolean default null,
			ConfirmedIdentity: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ConfirmedIdentity as Boolean default null,
			AllowanceRetrieved: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#AllowanceRetrieved as Boolean default null,
			IsSelected: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#IsSelected as Boolean default null,
			IsSelectableForBoardingPass: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#IsSelectableForBoardingPass as Boolean default null,
			ClearanceRequired: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ClearanceRequired as Boolean default null,
			ClearanceStatus: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ClearanceStatus,
			CheckedIn: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#CheckedIn as Boolean default null,
			RequiresCheckin: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#RequiresCheckin as Boolean default null,
			SupportsCheckin: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#SupportsCheckin as Boolean default null,
			Boarded: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Boarded as Boolean default null,
			Active: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Active as Boolean default null,
			DocumentCheckRequired: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#DocumentCheckRequired as Boolean default null,
			Identity: {
				LastAPIS: {
					Surname: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Surname,
					Firstname: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Firstname,
					DateOfBirth: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DateOfBirth as String default null,
					Nationality: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Nationality,
					DocumentType: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentType,
					DocumentNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentNumber,
					DocumentIssueDate: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentIssueDate as String default null,
					DocumentExpiryDate: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentExpiryDate as String default null,
					CountryOfIssue: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#CountryOfIssue
				}
			},
			Baggage: {
				BaggageAllowance: {
					Id: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#Id,
					BaggageAllowanceTypeId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageAllowanceTypeId,
					BaggageItemTypeId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageItemTypeId,
					BagDropId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BagDropId,
					FlightId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#FlightId,
					PassengerId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PassengerId,
					PoolItems: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolItems as Boolean default null,
					PoolWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolWeight as Boolean default null,
					ConsumeItemWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#ConsumeItemWeight as Boolean default null,
					UpdateInitialAllowance: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#UpdateInitialAllowance as Boolean default null,
					MaxSingleItemWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#MaxSingleItemWeight as Number default null,
					InitialBags: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialBags as Number default null,
					InitialWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialWeight as Number default null,
					PurchasedBags: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedBags as Number default null,
					PurchasedWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedWeight as Number default null,
					RemainingBags: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingBags as Number default null,
					RemainingWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingWeight as Number default null,
					CreatedOn: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#CreatedOn as String default null
				},
				MaxSingleItemWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#MaxSingleItemWeight as Number default null
			},
			BaggageItems: {
				BaggageItem: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageItems.*ns02#BaggageItem map {
					Id: $.ns01#Id,
					BaggageAllowanceId: $.ns01#BaggageAllowanceId,
					PassengerId: $.ns01#PassengerId,
					SessionId: $.ns01#SessionId,
					TagNumber: $.ns01#TagNumber,
					Weight: $.ns01#Weight,
					InitialWeight: $.ns01#InitialWeight,
					BaggageItemType: $.ns01#BaggageItemType,
					BaggageItemTypeId: $.ns01#BaggageItemTypeId,
					BaggageItemTypeName: $.ns01#BaggageItemTypeName,
					BaggageItemSubTypeId: $.ns01#BaggageItemSubTypeId,
					BaggageItemSubTypeName: $.ns01#BaggageItemSubTypeName,
					HasNotionalWeight: $.ns01#HasNotionalWeight,
					OutOfGauge: $.ns01#OutOfGauge,
					ConsumeAllowance: $.ns01#ConsumeAllowance,
					Registered: $.ns01#Registered,
					Printed: $.ns01#Printed,
					Dropped: $.ns01#BaggageAllowanceId,
					CreatedOn: $.ns01#CreatedOn					
				})
			},
			CustomProperties: {
				string: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#CustomProperties.*ns03#string
			}
		}
	}
}