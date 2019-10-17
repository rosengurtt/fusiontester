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
		Errors: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns02#Errors.*ns02#FusionError map (item, index) -> {
			FusionError: {
				Code: item.ns02#Code,
				Critical: item.ns02#Critical,
				Description: item.ns02#Description,
				Method: item.ns02#Method,
				Source: item.ns02#Source
			}
		}),
		LicensePlate: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#LicensePlate,
		RoundedWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#RoundedWeight,
		Passenger: {
			PassengerId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PassengerId,
			Title: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Title,
			FirstName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#FirstName,
			LastName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#LastName,
			NativePassengerId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#NativePassengerId,
			MarketingCarrierCode: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#MarketingCarrierCode,
			Gender: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Gender,
			DateOfBirth: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#DateOfBirth,
			PassengerSequenceNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PassengerSequenceNumber,
			SeatNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#SeatNumber,
			PaxType: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PaxType,
			PassengerRPH: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#PassengerRPH,
			Barcode: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Barcode,
			ConnectingFlightNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ConnectingFlightNumber,
			ConfirmedDga: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ConfirmedDga,
			ConfirmedIdentity: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ConfirmedIdentity,
			AllowanceRetrieved: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#AllowanceRetrieved,
			IsSelected: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#IsSelected,
			IsSelectableForBoardingPass: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#IsSelectableForBoardingPass,
			ClearanceRequired: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ClearanceRequired,
			ClearanceStatus: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#ClearanceStatus,
			CheckedIn: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#CheckedIn,
			RequiresCheckin: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#RequiresCheckin,
			SupportsCheckin: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#SupportsCheckin,
			Boarded: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Boarded,
			Active: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Active,
			DocumentCheckRequired: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#DocumentCheckRequired,
			Identity: {
				LastAPIS: {
					Surname: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Surname,
					Firstname: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Firstname,
					DateOfBirth: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DateOfBirth,
					Nationality: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Nationality,
					DocumentType: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentType,
					DocumentNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentNumber,
					DocumentIssueDate: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentIssueDate,
					DocumentExpiryDate: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentExpiryDate,
					CountryOfIssue: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#CountryOfIssue
				}
			},
			Baggage: {
				BaggageAllowance: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.*ns02#BaggageAllowance map (item, index) -> {
					Id: item.ns02#Id,
					BaggageAllowanceTypeId: item.ns02#BaggageAllowanceTypeId,
					BaggageItemTypeId: item.ns02#BaggageItemTypeId,
					BagDropId: item.ns02#BagDropId,
					FlightId: item.ns02#FlightId,
					PassengerId: item.ns02#PassengerId,
					PoolItems: item.ns02#PoolItems,
					PoolWeight: item.ns02#PoolWeight,
					ConsumeItemWeight: item.ns02#ConsumeItemWeight,
					UpdateInitialAllowance: item.ns02#UpdateInitialAllowance,
					MaxSingleItemWeight: item.ns02#MaxSingleItemWeight,
					InitialBags: item.ns02#InitialBags,
					InitialWeight: item.ns02#InitialWeight,
					PurchasedBags: item.ns02#PurchasedBags,
					PurchasedWeight: item.ns02#PurchasedWeight,
					RemainingBags: item.ns02#RemainingBags,
					RemainingWeight: item.ns02#RemainingWeight,
					CreatedOn: item.ns02#CreatedOn
				}),
				BaggageAllowances: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowances.*ns02#BaggageAllowance map (item, index) -> {
					BaggageAllowance: {
						Id: item.ns02#Id,
						BaggageAllowanceTypeId: item.ns02#BaggageAllowanceTypeId,
						BaggageItemTypeId: item.ns02#BaggageItemTypeId,
						BagDropId: item.ns02#BagDropId,
						FlightId: item.ns02#FlightId,
						PassengerId: item.ns02#PassengerId,
						PoolItems: item.ns02#PoolItems,
						PoolWeight: item.ns02#PoolWeight,
						ConsumeItemWeight: item.ns02#ConsumeItemWeight,
						UpdateInitialAllowance: item.ns02#UpdateInitialAllowance,
						MaxSingleItemWeight: item.ns02#MaxSingleItemWeight,
						InitialBags: item.ns02#InitialBags,
						InitialWeight: item.ns02#InitialWeight,
						PurchasedBags: item.ns02#PurchasedBags,
						PurchasedWeight: item.ns02#PurchasedWeight,
						RemainingBags: item.ns02#RemainingBags,
						RemainingWeight: item.ns02#RemainingWeight,
						CreatedOn: item.ns02#CreatedOn
					}
				}),
				MaxSingleItemWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#MaxSingleItemWeight
			},
			BaggageItems: {
				BaggageItem: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageItems.*ns02#BaggageItem map (item, index) -> {
					Id: item.ns01#Id,
					BaggageAllowanceId: item.ns01#BaggageAllowanceId,
					PassengerId: item.ns01#PassengerId,
					SessionId: item.ns01#SessionId,
					TagNumber: item.ns01#TagNumber,
					Weight: item.ns01#Weight,
					InitialWeight: item.ns01#InitialWeight,
					BaggageItemType: item.ns01#BaggageItemType,
					BaggageItemTypeId: item.ns01#BaggageItemTypeId,
					BaggageItemTypeName: item.ns01#BaggageItemTypeName,
					BaggageItemSubTypeId: item.ns01#BaggageItemSubTypeId,
					BaggageItemSubTypeName: item.ns01#BaggageItemSubTypeName,
					HasNotionalWeight: item.ns01#HasNotionalWeight,
					OutOfGauge: item.ns01#OutOfGauge,
					ConsumeAllowance: item.ns01#ConsumeAllowance,
					Registered: item.ns01#Registered,
					Printed: item.ns01#Printed,
					Dropped: item.ns01#BaggageAllowanceId,
					CreatedOn: item.ns01#CreatedOn					
				})
			},
			CustomProperties: {
				string: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#CustomProperties.*ns03#string
			}
		},
		Flights: {
			Flight: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Flights.*ns02#Flight map (item, index) -> {
				Id: item.Id,
				Origin: item.Origin,
				Destination: item.Destination,
				DepartureTime: item.DepartureTime,
				ArrivalTime: item.ArrivalTime,
				UTCDepartureTime: item.UTCDepartureTime,
				UTCArrivalTime: item.UTCArrivalTime,
				OperatingCarrier: item.OperatingCarrier,
				MarketingCarrier: item.MarketingCarrier,
				FlightNumber: item.FlightNumber,
				NativeFlightId: item.NativeFlightId,
				FlightRPH: item.FlightRPH,
				ApisRequired: item.ApisRequired,
				RequireMultipleAPISDocuments: item.RequireMultipleAPISDocuments,
				OpenForCheckIn: item.OpenForCheckIn,
				OpenForBoarding: item.OpenForBoarding,
				ConnectingFlight: item.ConnectingFlight,
				JourneyRPH: item.JourneyRPH
			})
		}
	}
}