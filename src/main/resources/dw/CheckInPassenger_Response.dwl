%dw 2.0
output application/xml skipNullOn = "everywhere"
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
				Title: $.ns02#Title,
				FirstName: $.ns02#FirstName,
				MiddleName: $.ns02#MiddleName,
				LastName: $.ns02#LastName,
				NativePassengerId: $.ns02#NativePassengerId,
				MarketingCarrierCode: $.ns02#MarketingCarrierCode,
				Gender: $.ns02#Gender,
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
				Identity: {
					ObtainedAPIS: {
						ApisData: ( $.ns02#Identity.ns02#ObtainedAPIS.*ns02#ApisData map (item, index) -> {
							Surname: item.ns02#Surname,
							Firstname: item.ns02#Firstname,
							Forenames: item.ns02#Forenames,
							Gender: item.ns02#Gender,
							DateOfBirth: item.ns02#DateOfBirth,
							Nationality: item.ns02#Nationality,
							DocumentType: item.ns02#DocumentType,
							DocumentNumber: item.ns02#DocumentNumber,
							DocumentIssueDate: item.ns02#DocumentIssueDate,
							DocumentExpiryDate: item.ns02#DocumentExpiryDate,
							CountryOfIssue: item.ns02#CountryOfIssue,
							ContactInformation:{
								ContactTitle: item.ns02#ContactInformation.ns02#ContactTitle,
								ContactFirstName: item.ns02#ContactInformation.ns02#ContactFirstName,
								ContactLastName: item.ns02#ContactInformation.ns02#ContactLastName,
								TelephoneNumber: item.ns02#ContactInformation.ns02#TelephoneNumber,
								EmailAddress: item.ns02#ContactInformation.ns02#EmailAddress,
								AddressLine: item.ns02#ContactInformation.ns02#AddressLine,
								City: item.ns02#ContactInformation.ns02#City,
								Country: item.ns02#ContactInformation.ns02#Country,
								PostalCode: item.ns02#ContactInformation.ns02#PostalCode,
								CompanyName: item.ns02#ContactInformation.ns02#CompanyName,
								NotificationPreference: item.ns02#ContactInformation.ns02#NotificationPreference								
							}							
						})
					},
					LastAPIS: ( $.ns02#Identity.*ns02#LastAPIS map (itemito, indexito) -> {
						Surname: itemito.ns02#Surname,
						Firstname: itemito.ns02#Firstname,
						Forenames: itemito.ns02#Forenames,
						Gender: itemito.ns02#Gender,
						DateOfBirth: itemito.ns02#DateOfBirth,						
						Nationality: itemito.ns02#Nationality,
						DocumentType: itemito.ns02#DocumentType,
						DocumentNumber: itemito.ns02#DocumentNumber,
						DocumentIssueDate: itemito.ns02#DocumentIssueDate,
						DocumentExpiryDate: itemito.ns02#DocumentExpiryDate,
						CountryOfIssue: itemito.ns02#CountryOfIssue,
						ContactInformation:{
							ContactTitle: itemito.ns02#ContactInformation.ns02#ContactTitle,
							ContactFirstName: itemito.ns02#ContactInformation.ns02#ContactFirstName,
							ContactLastName: itemito.ns02#ContactInformation.ns02#ContactLastName,
							TelephoneNumber: itemito.ns02#ContactInformation.ns02#TelephoneNumber,
							EmailAddress: itemito.ns02#ContactInformation.ns02#EmailAddress,
							AddressLine: itemito.ns02#ContactInformation.ns02#AddressLine,
							City: itemito.ns02#ContactInformation.ns02#City,
							Country: itemito.ns02#ContactInformation.ns02#Country,
							PostalCode: itemito.ns02#ContactInformation.ns02#PostalCode,
							CompanyName: itemito.ns02#ContactInformation.ns02#CompanyName,
							NotificationPreference: itemito.ns02#ContactInformation.ns02#NotificationPreference	
						}
					}),
					ValidDocuments: {
						APISDocumentSet: ($.ns02#Identity.ns01#ValidDocuments.*ns01#APISDocumentSet map (itemito, indexito) ->   {
							MainDocumentType: itemito.ns01#MainDocumentType,
							MainDocumentIssuerCountryCode: itemito.ns01#MainDocumentIssuerCountryCode,
							APISDocuments:  {
								DocumentDetail:(itemito.ns01#APISDocuments.*ns01#DocumentDetail map (itemon, indexon) ->  {
									Type: itemon.ns01#Type,
									IssuerCountryCode: itemon.ns01#IssuerCountryCode,
									Fields:  {
										DocumentField:(itemon.ns01#Fields.*ns01#DocumentField map (item, index) ->  {
											Name: item.ns01#Name,
											Required: item.ns01#Required
										})
									},
									Scannable: itemon.ns01#Scannable,
									Complete: itemon.ns01#Complete,
									Required: itemon.ns01#Required,
									Active: itemon.ns01#Active,
									Order: itemon.ns01#Order
								})
							},
							IsSelected: itemito.ns01#IsSelected
						})
					}
				},
				Baggage: {
					BaggageAllowance:{
						Id: $.ns02#Baggage.ns02#BaggageAllowance.ns02#Id,
						BaggageAllowanceTypeId: $.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageAllowanceTypeId,
						BaggageItemTypeId: $.ns02#Baggage.ns02#BaggageAllowance.ns02#BaggageItemTypeId,
						BagDropId: $.ns02#Baggage.ns02#BaggageAllowance.ns02#BagDropId,
						FlightId: $.ns02#Baggage.ns02#BaggageAllowance.ns02#FlightId,
						PassengerId: $.ns02#Baggage.ns02#BaggageAllowance.ns02#PassengerId,
						PoolItems: $.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolItems,
						PoolWeight: $.ns02#Baggage.ns02#BaggageAllowance.ns02#PoolWeight,
						ConsumeItemWeight: $.ns02#Baggage.ns02#BaggageAllowance.ns02#ConsumeItemWeight,
						UpdateInitialAllowance: $.ns02#Baggage.ns02#BaggageAllowance.ns02#UpdateInitialAllowance,
						MaxSingleItemWeight: $.ns02#Baggage.ns02#BaggageAllowance.ns02#MaxSingleItemWeight,
						InitialBags: $.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialBags,
						InitialWeight: $.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialWeight,
						PurchasedBags: $.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedBags,
						PurchasedWeight: $.ns02#Baggage.ns02#BaggageAllowance.ns02#PurchasedWeight,
						InitialBags: $.ns02#Baggage.ns02#BaggageAllowance.ns02#InitialBags,
						RemainingBags: $.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingBags,
						RemainingWeight: $.ns02#Baggage.ns02#BaggageAllowance.ns02#RemainingWeight,
						CreatedOn: $.ns02#Baggage.ns02#BaggageAllowance.ns02#CreatedOn						
					},
					MaxSingleItemWeight: $.ns02#Baggage.MaxSingleItemWeight
				},
				SSRs: {
					SSR: ($.*ns02#SSRs.*ns02#SSR  map (itemon, indexon) -> {
						SSRCode: itemon.ns02#SSRCode,
						SSRDescription: itemon.ns02#SSRDescription,
						FeeCode: itemon.ns02#FeeCode,
						PaxNumber: itemon.ns02#PaxNumber,
						Price: itemon.ns02#Price						
					})
				},
				CustomProperties: {	
						 string: $.ns02#CustomProperties.*string					
					},
				SeatPreference: $.ns02#SeatPreference
			})
		}
	}
}