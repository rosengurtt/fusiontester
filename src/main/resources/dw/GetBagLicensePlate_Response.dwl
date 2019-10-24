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
		Errors: (i.ns02#Errors.*ns02#FusionError map (err, errIndex) -> {
			FusionError: {
				Code: err.ns02#Code,
				Critical: err.ns02#Critical,
				Description: err.ns02#Description,
				Method: err.ns02#Method,
				Source: err.ns02#Source
			}
		}),
		LicensePlate: i.ns01#LicensePlate,
		RoundedWeight: i.ns01#RoundedWeight,
		Passenger: (i.*ns01#Passenger map (passenger, passengerIndex) -> {
			PassengerId: passenger.ns02#PassengerId,
			Title: passenger.ns02#Title,
			FirstName: passenger.ns02#FirstName,
			LastName: passenger.ns02#LastName,
			NativePassengerId: passenger.ns02#NativePassengerId,
			MarketingCarrierCode: passenger.ns02#MarketingCarrierCode,
			Gender: passenger.ns02#Gender,
			DateOfBirth: passenger.ns02#DateOfBirth,
			PassengerSequenceNumber: passenger.ns02#PassengerSequenceNumber,
			SeatNumber: passenger.ns02#SeatNumber,
			PaxType: passenger.ns02#PaxType,
			PassengerRPH: passenger.ns02#PassengerRPH,
			Barcode: passenger.ns02#Barcode,
			ConnectingFlightNumber: passenger.ns02#ConnectingFlightNumber,
			ConfirmedDga: passenger.ns02#ConfirmedDga,
			ConfirmedIdentity: passenger.ns02#ConfirmedIdentity,
			AllowanceRetrieved: passenger.ns02#AllowanceRetrieved,
			IsSelected: passenger.ns02#IsSelected,
			IsSelectableForBoardingPass: passenger.ns02#IsSelectableForBoardingPass,
			ClearanceRequired: passenger.ns02#ClearanceRequired,
			ClearanceStatus: passenger.ns02#ClearanceStatus,
			CheckedIn: passenger.ns02#CheckedIn,
			RequiresCheckin: passenger.ns02#RequiresCheckin,
			SupportsCheckin: passenger.ns02#SupportsCheckin,
			Boarded: passenger.ns02#Boarded,
			Active: passenger.ns02#Active,
			DocumentCheckRequired: passenger.ns02#DocumentCheckRequired,
			Identity: (passenger.*ns02#Identity map (identity, identityIndex) -> {
				LastAPIS: (identity.*ns02#LastAPIS map (lastApis, lastApisIndex) -> {
					Surname: lastApis.ns02#Surname,
					Firstname: lastApis.ns02#Firstname,
					DateOfBirth: lastApis.ns02#DateOfBirth,
					Nationality: lastApis.ns02#Nationality,
					DocumentType: lastApis.ns02#DocumentType,
					DocumentNumber: lastApis.ns02#DocumentNumber,
					DocumentIssueDate: lastApis.ns02#DocumentIssueDate,
					DocumentExpiryDate: lastApis.ns02#DocumentExpiryDate,
					CountryOfIssue: lastApis.ns02#CountryOfIssue,
					ContactInformation: (lastApis.*ns02#ContactInformation map (contactInfo, contactInfoIndex) -> {
						ContactTitle: contactInfo.ns02#ContactTitle,
						ContactFirstName: contactInfo.ns02#ContactFirstName,
						ContactLastName: contactInfo.ns02#ContactLastName,
						TelephoneNumber: contactInfo.ns02#TelephoneNumber,
						EmailAddress: contactInfo.ns02#EmailAddress,
						AddressLine: contactInfo.ns02#AddressLine,
						City: contactInfo.ns02#City,
						Country: contactInfo.ns02#Country,
						PostalCode: contactInfo.ns02#PostalCode,
						CompanyName: contactInfo.ns02#CompanyName,
						NotificationPreference: 
							if (contactInfo.ns02#NotificationPreference != '') 
							contactInfo.ns02#NotificationPreference
							else null								
					}),
				})
			}),
			Baggage: (passenger.*ns02#Baggage map (bagagge, bagaggeIndex) -> {
				BaggageAllowance: if (bagagge.ns02#BaggageAllowance.ns02#InitialWeight != '0'
						or bagagge.ns02#BaggageAllowance.ns02#RemainingWeight != '0'
						or bagagge.ns02#BaggageAllowance.ns02#PoolItems == 'true'
						or bagagge.ns02#BaggageAllowance.ns02#PoolWeight == 'true') 
					(bagagge.*s02#BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) ->   {
					Id: baggageAllowance.ns02#Id,
					BaggageAllowanceTypeId: baggageAllowance.ns02#BaggageAllowanceTypeId,
					BaggageItemTypeId: baggageAllowance.ns02#BaggageItemTypeId,
					BagDropId: baggageAllowance.ns02#BagDropId,
					FlightId: baggageAllowance.ns02#FlightId,
					PassengerId: baggageAllowance.ns02#PassengerId,
					PoolItems: baggageAllowance.ns02#PoolItems,
					PoolWeight: baggageAllowance.ns02#PoolWeight,
					ConsumeItemWeight: baggageAllowance.ns02#ConsumeItemWeight,
					UpdateInitialAllowance: baggageAllowance.ns02#UpdateInitialAllowance,
					MaxSingleItemWeight: baggageAllowance.ns02#MaxSingleItemWeight,
					InitialBags: baggageAllowance.ns02#InitialBags,
					InitialWeight: baggageAllowance.ns02#InitialWeight,
					PurchasedBags: baggageAllowance.ns02#PurchasedBags,
					PurchasedWeight: baggageAllowance.ns02#PurchasedWeight,
					RemainingBags: baggageAllowance.ns02#RemainingBags,
					RemainingWeight: baggageAllowance.ns02#RemainingWeight,
					CreatedOn: baggageAllowance.ns02#CreatedOn
				}) else null,
				BaggageAllowances: {
					BaggageAllowance: (bagagge.ns02#BaggageAllowances.*ns02#BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) -> {
						Id: baggageAllowance.ns02#Id,
						BaggageAllowanceTypeId: baggageAllowance.ns02#BaggageAllowanceTypeId,
						BaggageItemTypeId: baggageAllowance.ns02#BaggageItemTypeId,
						BagDropId: baggageAllowance.ns02#BagDropId,
						FlightId: baggageAllowance.ns02#FlightId,
						PassengerId: baggageAllowance.ns02#PassengerId,
						PoolItems: baggageAllowance.ns02#PoolItems,
						PoolWeight: baggageAllowance.ns02#PoolWeight,
						ConsumeItemWeight: baggageAllowance.ns02#ConsumeItemWeight,
						UpdateInitialAllowance: baggageAllowance.ns02#UpdateInitialAllowance,
						MaxSingleItemWeight: baggageAllowance.ns02#MaxSingleItemWeight,
						InitialBags: baggageAllowance.ns02#InitialBags,
						InitialWeight: baggageAllowance.ns02#InitialWeight,
						PurchasedBags: baggageAllowance.ns02#PurchasedBags,
						PurchasedWeight: baggageAllowance.ns02#PurchasedWeight,
						RemainingBags: baggageAllowance.ns02#RemainingBags,
						RemainingWeight: baggageAllowance.ns02#RemainingWeight,
						CreatedOn: baggageAllowance.ns02#CreatedOn
					})
				},
				BaggageItems: {
					BaggageItem: (bagagge.ns02#BaggageItems.*ns02#BaggageItem map (bagagge, bagaggeIndex) -> {
						Id: bagagge.ns02#Id,
						BaggageAllowanceId: bagagge.ns02#BaggageAllowanceId,
						PassengerId: bagagge.ns02#PassengerId,
						SessionId: bagagge.ns02#SessionId,
						TagNumber: bagagge.ns02#TagNumber,
						Weight: bagagge.ns02#Weight,
						InitialWeight: bagagge.ns02#InitialWeight,
						BaggageItemType: bagagge.ns02#BaggageItemType,
						BaggageItemTypeId: bagagge.ns02#BaggageItemTypeId,
						BaggageItemTypeName: bagagge.ns02#BaggageItemTypeName,
						BaggageItemSubTypeId: bagagge.ns02#BaggageItemSubTypeId,
						BaggageItemSubTypeName: bagagge.ns02#BaggageItemSubTypeName,
						HasNotionalWeight: bagagge.ns02#HasNotionalWeight,
						OutOfGauge: bagagge.ns02#OutOfGauge,
						ConsumeAllowance: bagagge.ns02#ConsumeAllowance,
						Registered: bagagge.ns02#Registered,
						Printed: bagagge.ns02#Printed,
						Dropped: bagagge.ns02#Dropped,
						RegisteredTime: bagagge.ns02#RegisteredTime,
						PrintedTime: bagagge.ns02#PrintedTime,
						DroppedTime: bagagge.ns02#DroppedTime,
						CreatedOn: bagagge.ns02#CreatedOn					
					})
				},			
				MaxSingleItemWeight: bagagge.ns02#MaxSingleItemWeight
			}),
			Infant: (passenger.*ns02#Infant map (infant, infantIndex) -> {
				InfantId: infant.ns02#InfantId,
				AdultPassengerId: infant.ns02#AdultPassengerId,
				FirstName: infant.ns02#FirstName,
				LastName: infant.ns02#LastName,
				DateOfBirth: infant.ns02#DateOfBirth,
				PassengerRPH: infant.ns02#PassengerRPH,
				AdultPassengerRPH: infant.ns02#AdultPassengerRPH,
				ConfirmedIdentity: infant.ns02#ConfirmedIdentity,
				AllowanceRetrieved: infant.ns02#AllowanceRetrieved,
				IsSelected: infant.ns02#IsSelected,
				CheckedIn: infant.ns02#CheckedIn,
				Boarded: infant.ns02#Boarded,
				CustomProperties: {
					string: passenger.ns01#Infant.ns02#CustomProperties.*ns03#string
				},			
			}),
			SSRs:{
				SSR: (passenger.ns02#SSRs.*ns02#SSR map (ssr, ssrIndex) -> {
					SSRCode: ssr.ns02#SSRCode,
					SSRDescription: ssr.ns02#SSRDescription,
					FeeCode: ssr.ns02#FeeCode,
					PaxNumber: ssr.ns02#PaxNumber,
					Price: ssr.ns02#Price
				})
			},
			CustomProperties: {
				string: passenger.ns02#CustomProperties.*ns03#string
			},
			SeatPreference: passenger.ns02#SeatPreference,
		}),
		Flights: {
			Flight: (i.ns01#Flights.*ns02#Flight map (flight, flightIndex) -> {
				Id: flight.Id,
				Origin: flight.Origin,
				Destination: flight.Destination,
				DepartureTime: flight.DepartureTime,
				ArrivalTime: flight.ArrivalTime,
				UTCDepartureTime: flight.UTCDepartureTime,
				UTCArrivalTime: flight.UTCArrivalTime,
				OperatingCarrier: flight.OperatingCarrier,
				MarketingCarrier: flight.MarketingCarrier,
				FlightNumber: flight.FlightNumber,
				NativeFlightId: flight.NativeFlightId,
				FlightRPH: flight.FlightRPH,
				ApisRequired: flight.ApisRequired,
				RequireMultipleAPISDocuments: flight.RequireMultipleAPISDocuments,
				OpenForCheckIn: flight.OpenForCheckIn,
				OpenForBoarding: flight.OpenForBoarding,
				ConnectingFlight: flight.ConnectingFlight,
				JourneyRPH: flight.JourneyRPH
			})
		}
	})
}