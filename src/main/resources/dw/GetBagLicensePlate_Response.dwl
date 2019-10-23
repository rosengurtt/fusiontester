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
					CountryOfIssue: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#CountryOfIssue,
					ContactInformation: {
						ContactTitle: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#ContactTitle,
						ContactFirstName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#ContactFirstName,
						ContactLastName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#ContactLastName,
						TelephoneNumber: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#TelephoneNumber,
						EmailAddress: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#EmailAddress,
						AddressLine: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#AddressLine,
						City: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#City,
						Country: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#Country,
						PostalCode: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#PostalCode,
						CompanyName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#CompanyName,
						NotificationPreference: 
							if (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#NotificationPreference != '') 
							payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#NotificationPreference
							else null								
					},
				}
			},
			Baggage: {
				BaggageAllowance: if (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialWeight != '0'
						or payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingWeight != '0'
						or payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolItems == 'true'
						or payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolWeight == 'true') {
					Id: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#Id,
					BaggageAllowanceTypeId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageAllowanceTypeId,
					BaggageItemTypeId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageItemTypeId,
					BagDropId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BagDropId,
					FlightId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#FlightId,
					PassengerId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PassengerId,
					PoolItems: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolItems,
					PoolWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolWeight,
					ConsumeItemWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#ConsumeItemWeight,
					UpdateInitialAllowance: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#UpdateInitialAllowance,
					MaxSingleItemWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#MaxSingleItemWeight,
					InitialBags: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialBags,
					InitialWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialWeight,
					PurchasedBags: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedBags,
					PurchasedWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedWeight,
					RemainingBags: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingBags,
					RemainingWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingWeight,
					CreatedOn: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#CreatedOn
				} else null,
				BaggageAllowances: {
					BaggageAllowance: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowances.*ns02#BaggageAllowance map (item, index) -> {
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
					})
				},
				BaggageItems: {
					BaggageItem: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#BaggageItems.*ns02#BaggageItem map (item, index) -> {
						Id: item.ns02#Id,
						BaggageAllowanceId: item.ns02#BaggageAllowanceId,
						PassengerId: item.ns02#PassengerId,
						SessionId: item.ns02#SessionId,
						TagNumber: item.ns02#TagNumber,
						Weight: item.ns02#Weight,
						InitialWeight: item.ns02#InitialWeight,
						BaggageItemType: item.ns02#BaggageItemType,
						BaggageItemTypeId: item.ns02#BaggageItemTypeId,
						BaggageItemTypeName: item.ns02#BaggageItemTypeName,
						BaggageItemSubTypeId: item.ns02#BaggageItemSubTypeId,
						BaggageItemSubTypeName: item.ns02#BaggageItemSubTypeName,
						HasNotionalWeight: item.ns02#HasNotionalWeight,
						OutOfGauge: item.ns02#OutOfGauge,
						ConsumeAllowance: item.ns02#ConsumeAllowance,
						Registered: item.ns02#Registered,
						Printed: item.ns02#Printed,
						Dropped: item.ns02#Dropped,
						RegisteredTime: item.ns02#RegisteredTime,
						PrintedTime: item.ns02#PrintedTime,
						DroppedTime: item.ns02#DroppedTime,
						CreatedOn: item.ns02#CreatedOn					
					})
				},			
				MaxSingleItemWeight: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Baggage.ns02#MaxSingleItemWeight
			},
			Infant: {
				InfantId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#InfantId,
				AdultPassengerId: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#AdultPassengerId,
				FirstName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#FirstName,
				LastName: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#LastName,
				DateOfBirth: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#DateOfBirth,
				PassengerRPH: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#PassengerRPH,
				AdultPassengerRPH: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#AdultPassengerRPH,
				ConfirmedIdentity: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#ConfirmedIdentity,
				AllowanceRetrieved: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#AllowanceRetrieved,
				IsSelected: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#IsSelected,
				CheckedIn: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#CheckedIn,
				Boarded: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#Infant.ns02#Boarded,
				CustomProperties: {
					string: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns01#Infant.ns02#CustomProperties.*ns03#string
				},			
			},
			SSRs:{
				SSR: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#SSRs.*ns02#SSR map {
					SSRCode: $.ns02#SSRCode,
					SSRDescription: $.ns02#SSRDescription,
					FeeCode: $.ns02#FeeCode,
					PaxNumber: $.ns02#PaxNumber,
					Price: $.ns02#Price
				})
			},
			CustomProperties: {
				string: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#CustomProperties.*ns03#string
			},
			SeatPreference: payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.ns01#GetBagLicensePlateResult.ns01#Passenger.ns02#SeatPreference,
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