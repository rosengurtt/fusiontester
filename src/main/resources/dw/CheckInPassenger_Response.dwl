%dw 2.0
output application/xml skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
	CheckInPassenger_Response: (payload.ns0#Envelope.ns0#Body.ns01#CheckInPassengerResponse.*ns01#CheckInPassengerResult map (i, ind) -> {
		RequestId: i.ns02#RequestId,
		ResponseId: i.ns02#ResponseId,
		Errors: (i.ns02#Errors.*ns02#FusionError map (err, errIndex) ->
		{
			FusionError: {
				Code: err.ns02#Code,
				Critical: err.ns02#Critical,
				Description: err.ns02#Description,
				Method: err.ns02#Method,
				Source: err.ns02#Source
			}
		}),
		Passengers: {
			Passenger: (i.ns01#Passengers.*ns02#Passenger map (passenger, passengerIndex) -> {
				PassengerId: passenger.ns02#PassengerId,
				Title: passenger.ns02#Title,
				FirstName: passenger.ns02#FirstName,
				MiddleName: passenger.ns02#MiddleName,
				LastName: passenger.ns02#LastName,
				NativePassengerId: passenger.ns02#NativePassengerId,
				MarketingCarrierCode: passenger.ns02#MarketingCarrierCode,
				Gender: passenger.ns02#Gender,
				DateOfBirth: passenger.ns02#DateOfBirth,
				PassengerSequenceNumber: passenger.ns02#PassengerSequenceNumber as String default null,
				SeatNumber: passenger.ns02#SeatNumber,
				PaxType: passenger.ns02#PaxType,
				PassengerRPH: passenger.ns02#PassengerRPH as String default null,
				ConnectingFlightNumber: passenger.ns02#ConnectingFlightNumber as String default null,
				ConfirmedDga: passenger.ns02#ConfirmedDga as String default null,
				ConfirmedIdentity: passenger.ns02#ConfirmedIdentity as String default null,
				AllowanceRetrieved: passenger.ns02#AllowanceRetrieved as String default null,
				IsSelected: passenger.ns02#IsSelected as String default null,
				IsSelectableForBoardingPass: passenger.ns02#IsSelectableForBoardingPass as String default null,
				ClearanceRequired: passenger.ns02#ClearanceRequired as String default null,
				ClearanceStatus: passenger.ns02#ClearanceStatus,
				CheckedIn: passenger.ns02#CheckedIn as String default null,
				RequiresCheckin: passenger.ns02#RequiresCheckin as String default null,
				SupportsCheckin: passenger.ns02#SupportsCheckin as String default null,
				Boarded: passenger.ns02#Boarded as String default null,
				Active: passenger.ns02#Active as String default null,
				DocumentCheckRequired: passenger.ns02#DocumentCheckRequired as String default null,
				Identity: {
					ObtainedAPIS: {
						ApisData: ( passenger.ns02#Identity.ns02#ObtainedAPIS.*ns02#ApisData map (apisData, apisDataIndex) -> {
							Surname: apisData.ns02#Surname,
							Firstname: apisData.ns02#Firstname,
							Forenames: apisData.ns02#Forenames,
							Gender: apisData.ns02#Gender,
							DateOfBirth: apisData.ns02#DateOfBirth,
							Nationality: apisData.ns02#Nationality,
							DocumentType: apisData.ns02#DocumentType,
							DocumentNumber: apisData.ns02#DocumentNumber,
							DocumentIssueDate: apisData.ns02#DocumentIssueDate,
							DocumentExpiryDate: apisData.ns02#DocumentExpiryDate,
							CountryOfIssue: apisData.ns02#CountryOfIssue,
							ContactInformation: (apisData.*ns02#ContactInformation map (contactInfo, contactInfoIndex) -> {
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
								NotificationPreference: contactInfo.ns02#NotificationPreference								
							})							
						})
					},
					LastAPIS: ( passenger.ns02#Identity.*ns02#LastAPIS map (lastApis, lastApisIndex) -> {
						Surname: lastApis.ns02#Surname,
						Firstname: lastApis.ns02#Firstname,
						Forenames: lastApis.ns02#Forenames,
						Gender: lastApis.ns02#Gender,
						DateOfBirth: lastApis.ns02#DateOfBirth,						
						Nationality: lastApis.ns02#Nationality,
						DocumentType: lastApis.ns02#DocumentType,
						DocumentNumber: lastApis.ns02#DocumentNumber,
						DocumentIssueDate: lastApis.ns02#DocumentIssueDate,
						DocumentExpiryDate: lastApis.ns02#DocumentExpiryDate,
						CountryOfIssue: lastApis.ns02#CountryOfIssue,
						ContactInformation: (lastApis.ns02#ContactInformation map (contactInfo, contactInfoIndex) -> {
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
								NotificationPreference: contactInfo.ns02#NotificationPreference		
						})
					}),
					ValidDocuments: {
						APISDocumentSet: (passenger.ns02#Identity.ns01#ValidDocuments.*ns01#APISDocumentSet map (apisDocSet, apisDocSetIndex) ->   {
							MainDocumentType: apisDocSet.ns01#MainDocumentType,
							MainDocumentIssuerCountryCode: apisDocSet.ns01#MainDocumentIssuerCountryCode,
							APISDocuments:  {
								DocumentDetail:(apisDocSet.ns01#APISDocuments.*ns01#DocumentDetail map (docDetail, docDetailIndex) ->  {
									Type: docDetail.ns01#Type,
									IssuerCountryCode: docDetail.ns01#IssuerCountryCode,
									Fields:  {
										DocumentField:(docDetail.ns01#Fields.*ns01#DocumentField map (docField, docFieldIndex) ->  {
											Name: docField.ns01#Name,
											Required: docField.ns01#Required
										})
									},
									Scannable: docDetail.ns01#Scannable,
									Complete: docDetail.ns01#Complete,
									Required: docDetail.ns01#Required,
									Active: docDetail.ns01#Active,
									Order: docDetail.ns01#Order
								})
							},
							IsSelected: apisDocSet.ns01#IsSelected
						})
					}
				},
				Baggage: {
					BaggageAllowance: (passenger.ns02#Baggage.*ns02#BaggageAllowance map (bagaggeAllowance, bagaggeAllowanceIndex) -> {
						Id: bagaggeAllowance.ns02#Id,
						BaggageAllowanceTypeId: bagaggeAllowance.ns02#BaggageAllowanceTypeId,
						BaggageItemTypeId: bagaggeAllowance.ns02#BaggageItemTypeId,
						BagDropId: bagaggeAllowance.ns02#BagDropId,
						FlightId: bagaggeAllowance.ns02#FlightId,
						PassengerId: bagaggeAllowance.ns02#PassengerId,
						PoolItems: bagaggeAllowance.ns02#PoolItems,
						PoolWeight: bagaggeAllowance.ns02#PoolWeight,
						ConsumeItemWeight: bagaggeAllowance.ns02#ConsumeItemWeight,
						UpdateInitialAllowance: bagaggeAllowance.ns02#UpdateInitialAllowance,
						MaxSingleItemWeight: bagaggeAllowance.ns02#MaxSingleItemWeight,
						InitialBags: bagaggeAllowance.ns02#InitialBags,
						InitialWeight: bagaggeAllowance.ns02#InitialWeight,
						PurchasedBags: bagaggeAllowance.ns02#PurchasedBags,
						PurchasedWeight: bagaggeAllowance.ns02#PurchasedWeight,
						RemainingBags: bagaggeAllowance.ns02#RemainingBags,
						RemainingWeight: bagaggeAllowance.ns02#RemainingWeight,
						CreatedOn: bagaggeAllowance.ns02#CreatedOn						
					}),
					MaxSingleItemWeight: passenger.ns02#Baggage.ns02#MaxSingleItemWeight,
				},
				SSRs: {
					SSR: (passenger.ns02#SSRs.*ns02#SSR  map (ssr, ssrIndex) -> {
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
				SeatPreference: {
					Name: passenger.ns02#SeatPreference.ns02#Name,
				},
			}),
		}
	})
}