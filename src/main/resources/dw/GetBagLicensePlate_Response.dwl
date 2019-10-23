%dw 2.0
output application/xml skipNullOn="everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
	GetBagLicensePlate_Response: (payload.ns0#Envelope.ns0#Body.ns01#GetBagLicensePlateResponse.*ns01#GetBagLicensePlateResult map (i, ind) -> {
		RequestId: i.ns02#RequestId,
		ResponseId: i.ns02#ResponseId,
		DcsRequestsIds: {
			guid: i.ns02#DcsRequestsIds.ns03#guid
		},
		Errors: (i.ns02#Errors.*ns02#FusionError map (item, index) -> {
			FusionError: {
				Code: item.ns02#Code,
				Critical: item.ns02#Critical,
				Description: item.ns02#Description,
				Method: item.ns02#Method,
				Source: item.ns02#Source
			}
		}),
		LicensePlate: i.ns01#LicensePlate,
		RoundedWeight: i.ns01#RoundedWeight,
		Passenger: {
			PassengerId: i.ns01#Passenger.ns02#PassengerId,
			Title: i.ns01#Passenger.ns02#Title,
			FirstName: i.ns01#Passenger.ns02#FirstName,
			LastName: i.ns01#Passenger.ns02#LastName,
			NativePassengerId: i.ns01#Passenger.ns02#NativePassengerId,
			MarketingCarrierCode: i.ns01#Passenger.ns02#MarketingCarrierCode,
			Gender: i.ns01#Passenger.ns02#Gender,
			DateOfBirth: i.ns01#Passenger.ns02#DateOfBirth,
			PassengerSequenceNumber: i.ns01#Passenger.ns02#PassengerSequenceNumber,
			SeatNumber: i.ns01#Passenger.ns02#SeatNumber,
			PaxType: i.ns01#Passenger.ns02#PaxType,
			PassengerRPH: i.ns01#Passenger.ns02#PassengerRPH,
			Barcode: i.ns01#Passenger.ns02#Barcode,
			ConnectingFlightNumber: i.ns01#Passenger.ns02#ConnectingFlightNumber,
			ConfirmedDga: i.ns01#Passenger.ns02#ConfirmedDga,
			ConfirmedIdentity: i.ns01#Passenger.ns02#ConfirmedIdentity,
			AllowanceRetrieved: i.ns01#Passenger.ns02#AllowanceRetrieved,
			IsSelected: i.ns01#Passenger.ns02#IsSelected,
			IsSelectableForBoardingPass: i.ns01#Passenger.ns02#IsSelectableForBoardingPass,
			ClearanceRequired: i.ns01#Passenger.ns02#ClearanceRequired,
			ClearanceStatus: i.ns01#Passenger.ns02#ClearanceStatus,
			CheckedIn: i.ns01#Passenger.ns02#CheckedIn,
			RequiresCheckin: i.ns01#Passenger.ns02#RequiresCheckin,
			SupportsCheckin: i.ns01#Passenger.ns02#SupportsCheckin,
			Boarded: i.ns01#Passenger.ns02#Boarded,
			Active: i.ns01#Passenger.ns02#Active,
			DocumentCheckRequired: i.ns01#Passenger.ns02#DocumentCheckRequired,
			Identity: {
				LastAPIS: {
					Surname: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Surname,
					Firstname: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Firstname,
					DateOfBirth: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DateOfBirth,
					Nationality: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#Nationality,
					DocumentType: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentType,
					DocumentNumber: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentNumber,
					DocumentIssueDate: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentIssueDate,
					DocumentExpiryDate: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#DocumentExpiryDate,
					CountryOfIssue: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#CountryOfIssue,
					ContactInformation: {
						ContactTitle: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#ContactTitle,
						ContactFirstName: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#ContactFirstName,
						ContactLastName: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#ContactLastName,
						TelephoneNumber: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#TelephoneNumber,
						EmailAddress: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#EmailAddress,
						AddressLine: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#AddressLine,
						City: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#City,
						Country: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#Country,
						PostalCode: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#PostalCode,
						CompanyName: i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#CompanyName,
						NotificationPreference: 
							if (i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#NotificationPreference != '') 
							i.ns01#Passenger.ns02#Identity.ns02#LastAPIS.ns02#ContactInformation.ns02#NotificationPreference
							else null								
					},
				}
			},
			Baggage: {
				BaggageAllowance: if (i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialWeight != '0'
						or i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingWeight != '0'
						or i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolItems == 'true'
						or i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolWeight == 'true') {
					Id: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#Id,
					BaggageAllowanceTypeId: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageAllowanceTypeId,
					BaggageItemTypeId: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageItemTypeId,
					BagDropId: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#BagDropId,
					FlightId: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#FlightId,
					PassengerId: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PassengerId,
					PoolItems: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolItems,
					PoolWeight: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolWeight,
					ConsumeItemWeight: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#ConsumeItemWeight,
					UpdateInitialAllowance: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#UpdateInitialAllowance,
					MaxSingleItemWeight: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#MaxSingleItemWeight,
					InitialBags: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialBags,
					InitialWeight: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialWeight,
					PurchasedBags: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedBags,
					PurchasedWeight: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedWeight,
					RemainingBags: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingBags,
					RemainingWeight: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingWeight,
					CreatedOn: i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowance.ns02#CreatedOn
				} else null,
				BaggageAllowances: {
					BaggageAllowance: (i.ns01#Passenger.ns02#Baggage.ns02#BaggageAllowances.*ns02#BaggageAllowance map (item, index) -> {
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
					BaggageItem: (i.ns01#Passenger.ns02#Baggage.ns02#BaggageItems.*ns02#BaggageItem map (item, index) -> {
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
				MaxSingleItemWeight: i.ns01#Passenger.ns02#Baggage.ns02#MaxSingleItemWeight
			},
			Infant: {
				InfantId: i.ns01#Passenger.ns02#Infant.ns02#InfantId,
				AdultPassengerId: i.ns01#Passenger.ns02#Infant.ns02#AdultPassengerId,
				FirstName: i.ns01#Passenger.ns02#Infant.ns02#FirstName,
				LastName: i.ns01#Passenger.ns02#Infant.ns02#LastName,
				DateOfBirth: i.ns01#Passenger.ns02#Infant.ns02#DateOfBirth,
				PassengerRPH: i.ns01#Passenger.ns02#Infant.ns02#PassengerRPH,
				AdultPassengerRPH: i.ns01#Passenger.ns02#Infant.ns02#AdultPassengerRPH,
				ConfirmedIdentity: i.ns01#Passenger.ns02#Infant.ns02#ConfirmedIdentity,
				AllowanceRetrieved: i.ns01#Passenger.ns02#Infant.ns02#AllowanceRetrieved,
				IsSelected: i.ns01#Passenger.ns02#Infant.ns02#IsSelected,
				CheckedIn: i.ns01#Passenger.ns02#Infant.ns02#CheckedIn,
				Boarded: i.ns01#Passenger.ns02#Infant.ns02#Boarded,
				CustomProperties: {
					string: i.ns01#Passenger.ns01#Infant.ns02#CustomProperties.*ns03#string
				},			
			},
			SSRs:{
				SSR: (i.ns01#Passenger.ns02#SSRs.*ns02#SSR map {
					SSRCode: $.ns02#SSRCode,
					SSRDescription: $.ns02#SSRDescription,
					FeeCode: $.ns02#FeeCode,
					PaxNumber: $.ns02#PaxNumber,
					Price: $.ns02#Price
				})
			},
			CustomProperties: {
				string: i.ns01#Passenger.ns02#CustomProperties.*ns03#string
			},
			SeatPreference: i.ns01#Passenger.ns02#SeatPreference,
		},
		Flights: {
			Flight: (i.ns01#Flights.*ns02#Flight map (item, index) -> {
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
	})
}