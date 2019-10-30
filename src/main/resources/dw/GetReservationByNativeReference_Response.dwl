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
			FusionError: (i.ns01#Errors.*ns01#FusionError map (err, errInd) -> {
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
					BaggageAcceptanceStatus: flight.ns01#BaggageAcceptanceStatus,
					ConnectingFlight: flight.ns01#ConnectingFlight,
					JourneyRPH: flight.ns01#JourneyRPH,
					CustomProperties: {	
						 string: flight.ns01#CustomProperties.*ns02#string					
					},
				})
			},
			Passengers: {
				Passenger: (i.ns0#Reservation.ns01#Passengers.*ns01#Passenger map (passenger, indexOfPassenger) -> {
					PassengerId: passenger.ns01#PassengerId,
					Title: passenger.ns01#Title,
					FirstName: passenger.ns01#FirstName,
					MiddleName: passenger.ns01#MiddleName,
					LastName: passenger.ns01#LastName,
					NativePassengerId: passenger.ns01#NativePassengerId,
					CarrierBookingClass: passenger.ns01#CarrierBookingClass,
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
								ContactInformation: {
									ContactTitle: apisData.ns01#ContactInformation.ns01#ContactTitle,
									ContactFirstName: apisData.ns01#ContactInformation.ns01#ContactFirstName,
									ContactLastName: apisData.ns01#ContactInformation.ns01#ContactLastName,
									TelephoneNumber: apisData.ns01#ContactInformation.ns01#TelephoneNumber,
									EmailAddress: apisData.ns01#ContactInformation.ns01#EmailAddress,
									AddressLine: apisData.ns01#ContactInformation.ns01#AddressLine,
									City: apisData.ns01#ContactInformation.ns01#City,
									Country: apisData.ns01#ContactInformation.ns01#Country,
									PostalCode: apisData.ns01#ContactInformation.ns01#PostalCode,
									CompanyName: apisData.ns01#ContactInformation.ns01#CompanyName,
									NotificationPreference: apisData.ns01#ContactInformation.ns01#NotificationPreference								
								},								
								AddressInformation: {
									StreetNumber: apisData.ns01#AddressInformation.ns01#StreetNumber,
									CityName: apisData.ns01#AddressInformation.ns01#CityName,
									StateProvince: apisData.ns01#AddressInformation.ns01#StateProvince,
									PostalCode: apisData.ns01#AddressInformation.ns01#PostalCode,
									Country: {
										A2Code: apisData.ns01#AddressInformation.ns01#Country.ns01#A2Code,
										A3Code: apisData.ns01#AddressInformation.ns01#Country.ns01#A3Code,
										PhoneCode: apisData.ns01#AddressInformation.ns01#Country.ns01#PhoneCode,
										Name: apisData.ns01#AddressInformation.ns01#Country.ns01#Name,
										Abbreviation: apisData.ns01#AddressInformation.ns01#Country.ns01#Abbreviation,
										Enabled: apisData.ns01#AddressInformation.ns01#Country.ns01#Enabled,
										
									},
								},
							})
						},
						LastAPIS: (passenger.ns01#Identity.*ns01#LastAPIS map (lastApis, lastApisIndex) ->{
							Surname: lastApis.ns01#Surname,
							Firstname: lastApis.ns01#Firstname,
							Gender: lastApis.ns01#Gender,
							DateOfBirth: lastApis.ns01#DateOfBirth,
							CountryOfResidence: lastApis.ns01#CountryOfResidence,
							Nationality: lastApis.ns01#Nationality,
							DocumentType: lastApis.ns01#DocumentType,
							DocumentNumber: lastApis.ns01#DocumentNumber,
							DocumentIssueDate: lastApis.ns01#DocumentIssueDate ,
							DocumentExpiryDate: lastApis.ns01#DocumentExpiryDate,
							CountryOfIssue: lastApis.ns01#CountryOfIssue,
							ContactInformation: {
								ContactTitle: lastApis.ns01#ContactInformation.ns01#ContactTitle,
								ContactFirstName: lastApis.ns01#ContactInformation.ns01#ContactFirstName,
								ContactLastName: lastApis.ns01#ContactInformation.ns01#ContactLastName,
								TelephoneNumber: lastApis.ns01#ContactInformation.ns01#TelephoneNumber,
								EmailAddress: lastApis.ns01#ContactInformation.ns01#EmailAddress,
								AddressLine: lastApis.ns01#ContactInformation.ns01#AddressLine,
								City: lastApis.ns01#ContactInformation.ns01#City,
								Country: lastApis.ns01#ContactInformation.ns01#Country,
								PostalCode: lastApis.ns01#ContactInformation.ns01#PostalCode,
								CompanyName: lastApis.ns01#ContactInformation.ns01#CompanyName,
								NotificationPreference: lastApis.ns01#ContactInformation.ns01#NotificationPreference								
							},
							AddressInformation: {
								StreetNumber: lastApis.ns01#AddressInformation.ns01#StreetNumber,
								CityName: lastApis.ns01#AddressInformation.ns01#CityName,
								StateProvince: lastApis.ns01#AddressInformation.ns01#StateProvince,
								PostalCode: lastApis.ns01#AddressInformation.ns01#PostalCode,
								Country: {
									A2Code: lastApis.ns01#AddressInformation.ns01#Country.ns01#A2Code,
									A3Code: lastApis.ns01#AddressInformation.ns01#Country.ns01#A3Code,
									PhoneCode: lastApis.ns01#AddressInformation.ns01#Country.ns01#PhoneCode,
									Name: lastApis.ns01#AddressInformation.ns01#Country.ns01#Name,
									Abbreviation: lastApis.ns01#AddressInformation.ns01#Country.ns01#Abbreviation,
									Enabled: lastApis.ns01#AddressInformation.ns01#Country.ns01#Enabled,
									
								},
							},
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
						BaggageAllowance: {	
							Id: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#Id,
							BaggageAllowanceTypeId: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#BaggageAllowanceTypeId,
							BaggageItemTypeId: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#BaggageItemTypeId,
							BagDropId: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#BagDropId,
							FlightId: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#FlightId,
							PassengerId: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#PassengerId,
							PoolItems: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#PoolItems,
							PoolWeight: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#PoolWeight,
							ConsumeItemWeight: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#ConsumeItemWeight,
							UpdateInitialAllowance: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#UpdateInitialAllowance,
							MaxSingleItemWeight: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#MaxSingleItemWeight,
							InitialBags: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#InitialBags,
							InitialWeight: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#InitialWeight,
							PurchasedBags: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#PurchasedBags,
							PurchasedWeight: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#PurchasedWeight,
							RemainingBags: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#RemainingBags,
							RemainingWeight: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#RemainingWeight,
							CreatedOn: passenger.ns01#Baggage.ns01#BaggageAllowance.ns01#CreatedOn
						},
						BaggageAllowances: {
							BaggageAllowance: (passenger.ns01#Baggage.ns01#BaggageAllowances.*ns01#BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) -> {
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
								CreatedOn: baggageAllowance.ns01#CreatedOn,
							})
						},
						BaggageItems: {
							(passenger.ns01#Baggage.ns01#BaggageItems.*ns01#BaggageItem map (baggageItem, baggageItemIndex) -> { 
								BaggageItem: {
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
								},
							}),
						},
						MaxSingleItemWeight: passenger.ns01#Baggage.ns01#MaxSingleItemWeight
					},
					Infant: {
						InfantId: passenger.ns01#Infant.ns01#InfantId,
						AdultPassengerId: passenger.ns01#Infant.ns01#AdultPassengerId,
						Title: passenger.ns01#Infant.ns01#Title,
						FirstName: passenger.ns01#Infant.ns01#FirstName,
						LastName: passenger.ns01#Infant.ns01#LastName,
						NativePassengerId: passenger.ns01#Infant.ns01#NativePassengerId,
						SeatNumber: passenger.ns01#Infant.ns01#SeatNumber,
						PassengerRPH: passenger.ns01#Infant.ns01#PassengerRPH,
						AdultPassengerRPH: passenger.ns01#Infant.ns01#AdultPassengerRPH,
						ConfirmedIdentity: passenger.ns01#Infant.ns01#ConfirmedIdentity,
						AllowanceRetrieved: passenger.ns01#Infant.ns01#AllowanceRetrieved,
						IsSelected: passenger.ns01#Infant.ns01#IsSelected,
						CheckedIn: passenger.ns01#Infant.ns01#CheckedIn,
						Boarded: passenger.ns01#Infant.ns01#Boarded,
						Identity: {
							ObtainedAPIS:{
								ApisData: (passenger.ns01#Infant.ns01#Identity.ns01#ObtainedAPIS.*ns01#ApisData map (apisData, apisDataIndex) -> {
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
									ContactInformation: {
										ContactTitle: apisData.ns01#ContactInformation.ns01#ContactTitle,
										ContactFirstName: apisData.ns01#ContactInformation.ns01#ContactFirstName,
										ContactLastName: apisData.ns01#ContactInformation.ns01#ContactLastName,
										TelephoneNumber: apisData.ns01#ContactInformation.ns01#TelephoneNumber,
										EmailAddress: apisData.ns01#ContactInformation.ns01#EmailAddress,
										AddressLine: apisData.ns01#ContactInformation.ns01#AddressLine,
										City: apisData.ns01#ContactInformation.ns01#City,
										Country: apisData.ns01#ContactInformation.ns01#Country,
										PostalCode: apisData.ns01#ContactInformation.ns01#PostalCode,
										CompanyName: apisData.ns01#ContactInformation.ns01#CompanyName,
										NotificationPreference: apisData.ns01#ContactInformation.ns01#NotificationPreference								
									},
									AddressInformation: {
										StreetNumber: apisData.ns01#AddressInformation.ns01#StreetNumber,
										CityName: apisData.ns01#AddressInformation.ns01#CityName,
										StateProvince: apisData.ns01#AddressInformation.ns01#StateProvince,
										PostalCode: apisData.ns01#AddressInformation.ns01#PostalCode,
										Country: {
											A2Code: apisData.ns01#AddressInformation.ns01#Country.ns01#A2Code,
											A3Code: apisData.ns01#AddressInformation.ns01#Country.ns01#A3Code,
											PhoneCode: apisData.ns01#AddressInformation.ns01#Country.ns01#PhoneCode,
											Name: apisData.ns01#AddressInformation.ns01#Country.ns01#Name,
											Abbreviation: apisData.ns01#AddressInformation.ns01#Country.ns01#Abbreviation,
											Enabled: apisData.ns01#AddressInformation.ns01#Country.ns01#Enabled,
											
										},
									},
								})
							},
							LastAPIS: (passenger.ns01#Infant.ns01#Identity.*ns01#LastAPIS map (lastApis, lastApisIndex) ->{
								Surname: lastApis.ns01#Surname,
								Firstname: lastApis.ns01#Firstname,
								DateOfBirth: lastApis.ns01#DateOfBirth,
								CountryOfResidence: lastApis.ns01#CountryOfResidence,
								Nationality: lastApis.ns01#Nationality,
								DocumentType: lastApis.ns01#DocumentType,
								DocumentNumber: lastApis.ns01#DocumentNumber,
								DocumentIssueDate: lastApis.ns01#DocumentIssueDate ,
								DocumentExpiryDate: lastApis.ns01#DocumentExpiryDate,
								CountryOfIssue: lastApis.ns01#CountryOfIssue,
								ContactInformation: {
									ContactTitle: lastApis.ns01#ContactInformation.ns01#ContactTitle,
									ContactFirstName: lastApis.ns01#ContactInformation.ns01#ContactFirstName,
									ContactLastName: lastApis.ns01#ContactInformation.ns01#ContactLastName,
									TelephoneNumber: lastApis.ns01#ContactInformation.ns01#TelephoneNumber,
									EmailAddress: lastApis.ns01#ContactInformation.ns01#EmailAddress,
									AddressLine: lastApis.ns01#ContactInformation.ns01#AddressLine,
									City: lastApis.ns01#ContactInformation.ns01#City,
									Country: lastApis.ns01#ContactInformation.ns01#Country,
									PostalCode: lastApis.ns01#ContactInformation.ns01#PostalCode,
									CompanyName: lastApis.ns01#ContactInformation.ns01#CompanyName,
									NotificationPreference: lastApis.ns01#ContactInformation.ns01#NotificationPreference								
								},
							}),
							ValidDocuments: {
								APISDocumentSet: (passenger.ns01#Infant.ns01#Identity.ns01#ValidDocuments.*ns01#APISDocumentSet map (apisDocSet, apisDocSetIndex) ->   {
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
								APISDocumentSet: (passenger.ns01#Infant.ns01#Identity.ns01#DocumentOptions.*ns01#APISDocumentSet map (apisDocSet, apisDocSetIndex) ->   {
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
						CustomProperties: {
							string: passenger.ns01#Infant.ns01#CustomProperties.*string
						}
					},					
					SSRs: {
						SSR: (passenger.ns01#SSRs.*ns01#SSR map (ssr, ssrIndex) -> {
							SSRCode: ssr.ns01#SSRCode,
							SSRDescription: ssr.ns01#SSRDescription,
							FlightNumber: ssr.ns01#FlightNumber,
							FeeCode: ssr.ns01#FeeCode,
							PaxNumber: ssr.ns01#PaxNumber,
							Price: ssr.ns01#Price
						})
					},
					CustomProperties: {
						string: passenger.ns01#CustomProperties.*string
					}
				}),
			},
			Contact: {
				ContactTitle: i.ns0#Reservation.ns01#Contact.ns01#ContactTitle,
				ContactFirstName: i.ns0#Reservation.ns01#Contact.ns01#ContactFirstName,
				ContactLastName: i.ns0#Reservation.ns01#Contact.ns01#ContactLastName,
				TelephoneNumber: i.ns0#Reservation.ns01#Contact.ns01#TelephoneNumber,
				EmailAddress: i.ns0#Reservation.ns01#Contact.ns01#EmailAddress,
				AddressLine: i.ns0#Reservation.ns01#Contact.ns01#AddressLine,
				City: i.ns0#Reservation.ns01#Contact.ns01#City,
				Country: i.ns0#Reservation.ns01#Contact.ns01#Country,
				PostalCode: i.ns0#Reservation.ns01#Contact.ns01#PostalCode,
				CompanyName: {
					"text()": i.ns0#Reservation.ns01#Contact.ns01#CompanyName
				},
				NotificationPreference: i.ns0#Reservation.ns01#Contact.ns01#NotificationPreference
			},
			IsCachedReservation: i.ns0#Reservation.ns01#IsCachedReservation,
			BalanceDueOnReservation: i.ns0#Reservation.ns01#BalanceDueOnReservation,
			NextFlightRph: i.ns0#Reservation.ns01#NextFlightRph
		}
	})
}