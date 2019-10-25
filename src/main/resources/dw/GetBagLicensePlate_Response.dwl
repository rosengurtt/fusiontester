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
			CarrierBookingClass: passenger.ns02#CarrierBookingClass,
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
			Baggage: (passenger.*ns02#Baggage map (baggage, baggageIndex) -> {
				BaggageAllowance: if (baggage.ns02#BaggageAllowance.ns02#InitialWeight != '0'
						or baggage.ns02#BaggageAllowance.ns02#RemainingWeight != '0'
						or baggage.ns02#BaggageAllowance.ns02#PoolItems == 'true'
						or baggage.ns02#BaggageAllowance.ns02#PoolWeight == 'true') 
					(baggage.*ns02#BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) ->   {
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
					BaggageAllowance: (baggage.ns02#BaggageAllowances.*ns02#BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) -> {
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
					BaggageItem: (baggage.ns02#BaggageItems.*ns02#BaggageItem map (baggageItem, baggageIndex) -> {
						Id: baggageItem.ns02#Id,
						BaggageAllowanceId: baggageItem.ns02#BaggageAllowanceId,
						PassengerId: baggageItem.ns02#PassengerId,
						SessionId: baggageItem.ns02#SessionId,
						TagNumber: baggageItem.ns02#TagNumber,
						Weight: baggageItem.ns02#Weight,
						InitialWeight: baggageItem.ns02#InitialWeight,
						BaggageItemType: baggageItem.ns02#BaggageItemType,
						BaggageItemTypeId: baggageItem.ns02#BaggageItemTypeId,
						BaggageItemTypeName: baggageItem.ns02#BaggageItemTypeName,
						BaggageItemSubTypeId: baggageItem.ns02#BaggageItemSubTypeId,
						BaggageItemSubTypeName: baggageItem.ns02#BaggageItemSubTypeName,
						HasNotionalWeight: baggageItem.ns02#HasNotionalWeight,
						OutOfGauge: baggageItem.ns02#OutOfGauge,
						ConsumeAllowance: baggageItem.ns02#ConsumeAllowance,
						Registered: baggageItem.ns02#Registered,
						Printed: baggageItem.ns02#Printed,
						Dropped: baggageItem.ns02#Dropped,
						RegisteredTime: baggageItem.ns02#RegisteredTime,
						PrintedTime: baggageItem.ns02#PrintedTime,
						DroppedTime: baggageItem.ns02#DroppedTime,
						CreatedOn: baggageItem.ns02#CreatedOn					
					})
				},			
				MaxSingleItemWeight: baggage.ns02#MaxSingleItemWeight
			}),
			Infant: (passenger.*ns02#Infant map (infant, infantIndex) -> {
				InfantId: infant.ns02#InfantId,
				AdultPassengerId: infant.ns02#AdultPassengerId,
				FirstName: infant.ns02#FirstName,
				LastName: infant.ns02#LastName,
				NativePassengerId: infant.ns02#NativePassengerId,
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
					FlightNumber: ssr.ns02#FlightNumber,
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
				Id: flight.ns02#Id,
				Origin: flight.ns02#Origin,
				Destination: flight.ns02#Destination,
				DepartureTime: flight.ns02#DepartureTime,
				ArrivalTime: flight.ns02#ArrivalTime,
				UTCDepartureTime: flight.ns02#UTCDepartureTime,
				UTCArrivalTime: flight.ns02#UTCArrivalTime,
				OperatingCarrier: flight.ns02#OperatingCarrier,
				MarketingCarrier: flight.ns02#MarketingCarrier,
				FlightNumber: flight.ns02#FlightNumber,
				NativeFlightId: flight.ns02#NativeFlightId,
				FlightRPH: flight.ns02#FlightRPH,
				ApisRequired: flight.ns02#ApisRequired,
				RequireMultipleAPISDocuments: flight.ns02#RequireMultipleAPISDocuments,
				OpenForCheckIn: flight.ns02#OpenForCheckIn,
				OpenForBoarding: flight.ns02#OpenForBoarding,
				BaggageAcceptanceStatus: flight.ns02#BaggageAcceptanceStatus,
				ConnectingFlight: flight.ns02#ConnectingFlight,
				JourneyRPH: flight.JourneyRPH,
				CustomProperties: {	
					 string: flight.ns02#CustomProperties.*ns03#string					
				},
			})
		}
	})
}