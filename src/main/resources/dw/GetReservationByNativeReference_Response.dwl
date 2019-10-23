%dw 2.0
output application/xml skipNullOn="everywhere"
ns ns0 http://services.fusion.aero
ns ns01 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns02 http://schemas.microsoft.com/2003/10/Serialization/Arrays
ns ns03 http://www.w3.org/2003/05/soap-envelope
---
{
	GetReservationByNativeReference_Response: (payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.*ns0#GetReservationByNativeReferenceResult map (i, ind) -> {
		RequestId: i.ns01#RequestId,
		ResponseId: i.ns01#ResponseId,
		DcsRequestsIds: i.ns01#DcsRequestsIds.ns02#guid,
		Errors: {
			FusionError: (i.ns01#Errors.*ns01#FusionError map (err, errInd) ->{
				Critical: err.ns01#Critical,
				Code: err.ns01#Code,
				Description: err.ns01#Description,
				Method: err.ns01#Method,
				Source: err.ns01#Source
			})
		},
		Reservation: {
			NativeReference: i.ns0#Reservation.ns01#NativeReference,
			IsGroupBooking: i.ns0#Reservation.ns01#IsGroupBooking,
			Flights: {
				Flight: (i.ns0#Reservation.ns01#Flights.*ns01#Flight map (flight, flightIndex) -> {
					Id: flight.ns01#Id,
					Origin: flight.ns01#Origin,
					Destination: flight.ns01#Destination,
					DepartureTime: flight.ns01#DepartureTime,
					EstimatedDepartureTime: flight.ns01#EstimatedDepartureTime,
					ArrivalTime: flight.ns01#ArrivalTime,
					UTCDepartureTime: flight.ns01#UTCDepartureTime,
					UTCEstimatedDepartureTime: flight.ns01#UTCEstimatedDepartureTime,
					UTCArrivalTime: flight.ns01#UTCArrivalTime,
					OperatingCarrier: flight.ns01#OperatingCarrier,
					MarketingCarrier: flight.ns01#MarketingCarrier,
					FlightNumber: flight.ns01#FlightNumber,
					NativeFlightId: flight.ns01#NativeFlightId,
					FlightRPH: flight.ns01#FlightRPH,
					ApisRequired: flight.ns01#ApisRequired,
					RequireMultipleAPISDocuments: flight.ns01#RequireMultipleAPISDocuments,
					OpenForCheckIn: flight.ns01#OpenForCheckIn,
					OpenForBoarding: flight.ns01#OpenForBoarding,
					ConnectingFlight: flight.ns01#ConnectingFlight,
					JourneyRPH: flight.ns01#JourneyRPH,
					CustomProperties: {	
						 string: flight.ns01#CustomProperties.*ns02#string					
					},
				}),
			},
			Passengers: {
				(i.ns0#Reservation.ns01#Passengers.*ns01#Passenger map ( passenger , indexOfPassenger ) -> {
					Passenger: {
						PassengerId: passenger.ns01#PassengerId,
						Title: passenger.ns01#Title,
						FirstName: passenger.ns01#FirstName,
						MiddleName: passenger.ns01#MiddleName,
						LastName: passenger.ns01#LastName,
						NativePassengerId: passenger.ns01#NativePassengerId,
						Gender: passenger.ns01#Gender,
						DateOfBirth: passenger.ns01#DateOfBirth ,
						PassengerSequenceNumber: passenger.ns01#PassengerSequenceNumber,
						SeatNumber: passenger.ns01#SeatNumber,
						PaxType: passenger.ns01#PaxType,
						PassengerRPH: passenger.ns01#PassengerRPH,
						ConnectingFlightNumber: passenger.ns01#ConnectingFlightNumber,
						ConfirmedDga: passenger.ns01#ConfirmedDga,
						ConfirmedIdentity: passenger.ns01#ConfirmedIdentity,
						AllowanceRetrieved: passenger.ns01#AllowanceRetrieved,
						IsSelected: passenger.ns01#IsSelected,
						IsSelectableForBoardingPass: passenger.ns01#IsSelectableForBoardingPass,
						ClearanceRequired: passenger.ns01#ClearanceRequired,
						ClearanceStatus: passenger.ns01#ClearanceStatus,
						CheckedIn: passenger.ns01#CheckedIn,
						RequiresCheckin: passenger.ns01#RequiresCheckin,
						SupportsCheckin: passenger.ns01#SupportsCheckin,
						Boarded: passenger.ns01#Boarded,
						Active: passenger.ns01#Active,
						DocumentCheckRequired: passenger.ns01#DocumentCheckRequired,
						Identity: {
							ObtainedAPIS:{
								ApisData: (passenger.ns01#Identity.ns01#ObtainedAPIS.*ns01#ApisData map (apisData, apisDataIndex) -> {
									Surname: apisData.ns01#Surname,
									Firstname: apisData.ns01#Firstname,
									DateOfBirth: apisData.ns01#DateOfBirth,
									CountryOfResidence: apisData.ns01#CountryOfResidence,
									Nationality: apisData.ns01#Nationality,
									DocumentType: apisData.ns01#DocumentType,
									DocumentNumber: apisData.ns01#DocumentNumber,
									DocumentIssueDate: apisData.ns01#DocumentIssueDate,
									DocumentExpiryDate: apisData.ns01#DocumentExpiryDate,
									CountryOfIssue: apisData.ns01#CountryOfIssue,
									ContactInformation: (apisData.*ns01#ContactInformation map (contactInfo, contactInfoIndex) -> {
										ContactTitle: contactInfo.ns01#ContactTitle,
										ContactFirstName: contactInfo.ns01#ContactFirstName,
										ContactLastName: contactInfo.ns01#ContactLastName,
										TelephoneNumber: contactInfo.ns01#TelephoneNumber,
										EmailAddress: contactInfo.ns01#EmailAddress,
										AddressLine: contactInfo.ns01#AddressLine,
										City: contactInfo.ns01#City,
										Country: contactInfo.ns01#Country,
										PostalCode: contactInfo.ns01#PostalCode,
										CompanyName: contactInfo.ns01#CompanyName,
										NotificationPreference: contactInfo.ns01#NotificationPreference								
									}),
								})
							},
							LastAPIS: (passenger.ns01#Identity.*ns01#LastAPIS map (lastApi, lastApiIndex) -> {
								Surname: lastApi.ns01#Surname,
								Firstname: lastApi.ns01#Firstname,
								DateOfBirth: lastApi.ns01#DateOfBirth,
								CountryOfResidence: lastApi.ns01#CountryOfResidence,
								Nationality: lastApi.ns01#Nationality,
								DocumentType: lastApi.ns01#DocumentType,
								DocumentNumber: lastApi.ns01#DocumentNumber,
								DocumentIssueDate: lastApi.ns01#DocumentIssueDate ,
								DocumentExpiryDate: lastApi.ns01#DocumentExpiryDate,
								CountryOfIssue: passenger.ns01#Identity.LastAPIS.ns01#CountryOfIssue,
								ContactInformation: (lastApi.*ns01#ContactInformation  map (contactInfo, contactInfoIndex) -> {
									ContactTitle: contactInfo.ns01#ContactTitle,
									ContactFirstName: contactInfo.ns01#ContactFirstName,
									ContactLastName: contactInfo.ns01#ContactLastName,
									TelephoneNumber: contactInfo.ns01#TelephoneNumber,
									EmailAddress: contactInfo.ns01#EmailAddress,
									AddressLine: contactInfo.ns01#AddressLine,
									City: contactInfo.ns01#City,
									Country: contactInfo.ns01#Country,
									PostalCode: contactInfo.ns01#PostalCode,
									CompanyName: contactInfo.ns01#CompanyName,
									NotificationPreference: contactInfo.ns01#NotificationPreference								
								}),
							}),
							ValidDocuments: {
								APISDocumentSet: (passenger.ns01#Identity.ns01#ValidDocuments.*ns01#APISDocumentSet map (apisDocSet, apisDocSetIndex) ->   {
									MainDocumentType: apisDocSet.ns01#MainDocumentType,
									MainDocumentIssuerCountryCode: apisDocSet.ns01#MainDocumentIssuerCountryCode,
									APISDocuments:  {
										DocumentDetail:(apisDocSet.ns01#APISDocuments.*ns01#DocumentDetail map (docDetail, docDetailIndex) ->  {
											Type: docDetail.ns01#Type,
											IssuerCountryCode: docDetail.ns01#IssuerCountryCode,
											Fields:  {
												DocumentField:(docDetail.ns01#Fields.*ns01#DocumentField map (docField, docFieldIndex) ->  {
													Name: docField.ns01#Name,
													Required: docField.ns01#Required,													
													AcceptedValues: {
														string: docField.ns01#AcceptedValues.*string
													},
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
							},
							DocumentOptions: {
								APISDocumentSet: (passenger.ns01#Identity.ns01#DocumentOptions.*ns01#APISDocumentSet map (apisDocSet, apisDocSetIndex) ->   {
									MainDocumentType: apisDocSet.ns01#MainDocumentType,
									MainDocumentIssuerCountryCode: apisDocSet.ns01#MainDocumentIssuerCountryCode,
									APISDocuments:  {
										DocumentDetail:(apisDocSet.ns01#APISDocuments.*ns01#DocumentDetail map (docDetail, docDetailIndex) ->  {
											Type: docDetail.ns01#Type,
											IssuerCountryCode: docDetail.ns01#IssuerCountryCode,
											Fields:  {
												DocumentField:(docDetail.ns01#Fields.*ns01#DocumentField map (docField, docFieldIndex) ->  {
													Name: docField.ns01#Name,
													Required: docField.ns01#Required,													
													AcceptedValues: {
														string: docField.ns01#AcceptedValues.*string
													},
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
							},
						},
						Baggage: {
							BaggageAllowance: (passenger.ns01#Baggage.*ns01#BaggageAllowance map (baggageAllowance, baggageAllowanceindex) ->  {	
								Id: baggageAllowance.ns01#Id,
								BaggageAllowanceTypeId: baggageAllowance.ns01#BaggageAllowanceTypeId,
								BaggageItemTypeId: baggageAllowance.ns01#BaggageItemTypeId,
								BagDropId: baggageAllowance.ns01#BagDropId,
								FlightId: baggageAllowance.ns01#FlightId,
								PassengerId: baggageAllowance.ns01#PassengerId,
								PoolItems: baggageAllowance.ns01#PoolItems,
								PoolWeight: baggageAllowance.ns01#PoolWeight,
								ConsumeItemWeight: baggageAllowance.ns01#ConsumeItemWeight,
								UpdateInitialAllowance: baggageAllowance.ns01#UpdateInitialAllowance,
								MaxSingleItemWeight: baggageAllowance.ns01#MaxSingleItemWeight,
								InitialBags: baggageAllowance.ns01#InitialBags,
								InitialWeight: baggageAllowance.ns01#InitialWeight,
								PurchasedBags: baggageAllowance.ns01#PurchasedBags,
								PurchasedWeight: baggageAllowance.ns01#PurchasedWeight,
								RemainingBags: baggageAllowance.ns01#RemainingBags,
								RemainingWeight: baggageAllowance.ns01#RemainingWeight,
								CreatedOn: baggageAllowance.ns01#CreatedOn
							}),
							BaggageAllowances: {
								BaggageAllowance: (passenger.ns01#Baggage.ns01#BaggageAllowances.*ns01#BaggageAllowance map (baggageAllowance, baggageAllowanceindex) -> {
									Id: baggageAllowance.Id,
									BaggageAllowanceTypeId: baggageAllowance.BaggageAllowanceTypeId,
									BaggageItemTypeId: baggageAllowance.BaggageItemTypeId,
									BagDropId: baggageAllowance.BagDropId,
									FlightId: baggageAllowance.FlightId,
									PassengerId: baggageAllowance.PassengerId,
									PoolItems: baggageAllowance.PoolItems,
									PoolWeight: baggageAllowance.PoolWeight,
									ConsumeItemWeight: baggageAllowance.ConsumeItemWeight,
									UpdateInitialAllowance: baggageAllowance.UpdateInitialAllowance,
									MaxSingleItemWeight: baggageAllowance.MaxSingleItemWeight,
									InitialBags: baggageAllowance.InitialBags,
									InitialWeight: baggageAllowance.InitialWeight,
									PurchasedBags: baggageAllowance.PurchasedBags,
									PurchasedWeight: baggageAllowance.PurchasedWeight,
									RemainingBags: baggageAllowance.RemainingBags,
									RemainingWeight: baggageAllowance.RemainingWeight,
									CreatedOn: baggageAllowance.CreatedOn,
								})
							},
							BaggageItems: {
								BaggageItem: (passenger.ns01#Baggage.ns01#BaggageItems.*ns01#BaggageItem map (baggageItem, baggageItemIndex) -> {
									Id: baggageItem.ns01#Id,
									BaggageAllowanceId: baggageItem.ns01#BaggageAllowanceId,
									PassengerId: baggageItem.ns01#PassengerId,
									TagNumber: baggageItem.ns01#TagNumber,
									Weight: baggageItem.ns01#Weight,
									InitialWeight: baggageItem.ns01#InitialWeight,
									BaggageItemType: baggageItem.ns01#BaggageItemType,
									BaggageItemTypeId: baggageItem.ns01#BaggageItemTypeId,
									BaggageItemTypeName: baggageItem.ns01#BaggageItemTypeName,
									BaggageItemSubTypeId: baggageItem.ns01#BaggageItemSubTypeId,
									BaggageItemSubTypeName: baggageItem.ns01#BaggageItemSubTypeName,
									HasNotionalWeight: baggageItem.ns01#HasNotionalWeight,
									OutOfGauge: baggageItem.ns01#OutOfGauge,
									ConsumeAllowance: baggageItem.ns01#ConsumeAllowance,
									Registered: baggageItem.ns01#Registered,
									Printed: baggageItem.ns01#Printed,
									Dropped: baggageItem.ns01#Dropped,
									RegisteredTime: baggageItem.ns01#RegisteredTime,
									PrintedTime: baggageItem.ns01#PrintedTime,
									DroppedTime: baggageItem.ns01#DroppedTime,
									CreatedOn: baggageItem.ns01#CreatedOn,
									NativeBaggageId:  baggageItem.ns01#NativeBaggageId,
									Active: baggageItem.ns01#Active
								})
							},
							MaxSingleItemWeight: passenger.ns01#Baggage.ns01#MaxSingleItemWeight
						},
						Infant: (passenger.*ns01#Infant map (infant, infantIndex) -> {
							InfantId: infant.ns01#InfantId,
							AdultPassengerId: infant.ns01#AdultPassengerId,
							FirstName: infant.ns01#FirstName,
							LastName: infant.ns01#LastName,
							PassengerRPH: infant.ns01#PassengerRPH,
							AdultPassengerRPH: infant.ns01#AdultPassengerRPH,
							ConfirmedIdentity: infant.ns01#ConfirmedIdentity,
							AllowanceRetrieved: infant.ns01#AllowanceRetrieved,
							IsSelected: infant.ns01#IsSelected,
							CheckedIn: infant.ns01#CheckedIn,
							Boarded: infant.ns01#Boarded,
							
						}),
						SSRs: {
							SSR: (passenger.ns01#SSRs.*ns01#SSR map (ssr, ssrIdex) -> {
								SSRCode: ssr.ns01#SSRCode,
								SSRDescription: ssr.ns01#SSRDescription,
								FeeCode: ssr.ns01#FeeCode,
								PaxNumber: ssr.ns01#PaxNumber,
								Price: ssr.ns01#Price
							})
						},
						CustomProperties: {
							string: passenger.ns01#CustomProperties.*string
						}
					}
				})
			},
			Contact: (i.ns0#Reservation.*ns01#Contact map (contact, contactIndex) ->{
				ContactTitle: contact.ns01#ContactTitle,
				ContactFirstName: contact.ns01#ContactFirstName,
				ContactLastName: contact.ns01#ContactLastName,
				TelephoneNumber: contact.ns01#TelephoneNumber,
				EmailAddress: contact.ns01#EmailAddress,
				AddressLine: contact.ns01#AddressLine,
				City: contact.ns01#City,
				Country: contact.ns01#Country,
				PostalCode: contact.ns01#PostalCode,
				CompanyName: {
					"text()": contact.ns01#CompanyName
				},
				NotificationPreference: contact.ns01#NotificationPreference
			}),
			IsCachedReservation: i.ns0#Reservation.ns01#IsCachedReservation,
			BalanceDueOnReservation: i.ns0#Reservation.ns01#BalanceDueOnReservation,
			NextFlightRph: i.ns0#Reservation.ns01#NextFlightRph
		}
	})
}