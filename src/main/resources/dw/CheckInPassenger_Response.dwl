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
						ApisData:{
							Surname: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Surname,
							Firstname: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Firstname,
							Forenames: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Forenames,
							Gender: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Gender,
							DateOfBirth: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DateOfBirth,
							Nationality: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Nationality,
							DocumentType: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentType,
							DocumentNumber: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentNumber,
							DocumentIssueDate: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentIssueDate,
							DocumentExpiryDate: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentExpiryDate,
							CountryOfIssue: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#CountryOfIssue,
							ContactInformation:{
								ContactTitle: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#ContactTitle,
								ContactFirstName: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#ContactFirstName,
								ContactLastName: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#ContactLastName,
								TelephoneNumber: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#TelephoneNumber,
								EmailAddress: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#EmailAddress,
								AddressLine: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#AddressLine,
								City: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#City,
								Country: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#Country,
								PostalCode: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#PostalCode,
								CompanyName: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#CompanyName,
								NotificationPreference: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#NotificationPreference								
							}							
						}
					},
					LastAPIS: {
						Surname: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Surname,
							Firstname: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Firstname,
							Forenames: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Forenames,
							Gender: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Gender,
							DateOfBirth: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DateOfBirth,
							Nationality: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#Nationality,
							DocumentType: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentType,
							DocumentNumber: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentNumber,
							DocumentIssueDate: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentIssueDate,
							DocumentExpiryDate: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#DocumentExpiryDate,
							CountryOfIssue: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#CountryOfIssue,
							ContactInformation:{
								ContactTitle: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#ContactTitle,
								ContactFirstName: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#ContactFirstName,
								ContactLastName: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#ContactLastName,
								TelephoneNumber: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#TelephoneNumber,
								EmailAddress: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#EmailAddress,
								AddressLine: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#AddressLine,
								City: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#City,
								Country: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#Country,
								PostalCode: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#PostalCode,
								CompanyName: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#CompanyName,
								NotificationPreference: $.ns02#Identity.ns02#ObtainedAPIS.ns02#ApisData.ns02#ContactInformation.ns02#NotificationPreference	
						}
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
					SSR: ($.*ns02#SSRs.*ns02#SSR  map (item, index) -> {
						SSRCode: item.ns02#SSRCode,
						SSRDescription: item.ns02#SSRDescription,
						FeeCode: item.ns02#FeeCode,
						PaxNumber: item.ns02#PaxNumber,
						Price: item.ns02#Price						
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