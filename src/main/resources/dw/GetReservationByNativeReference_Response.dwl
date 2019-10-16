%dw 2.0
output application/xml skipNullOn="everywhere"
ns ns0 http://services.fusion.aero
ns ns01 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns02 http://schemas.microsoft.com/2003/10/Serialization/Arrays
ns ns03 http://www.w3.org/2003/05/soap-envelope
---
{
	GetReservationByNativeReference_Response: {
		RequestId: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns01#RequestId,
		ResponseId: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns01#ResponseId,
		DcsRequestsIds: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns01#DcsRequestsIds.ns02#guid,
		Errors: (payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns01#Errors.*ns01#FusionError map
		{
			FusionError: {
				Critical: $.ns01#Critical,
				Code: $.ns01#Code,
				Description: $.ns01#Description,
				Method: $.ns01#Method,
				Source: $.ns01#Source
			}
		}),
		Reservation: {
			NativeReference: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#NativeReference,
			IsGroupBooking: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#IsGroupBooking,
			Flights: {
				Flight: {
					Id: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#Id,
					Origin: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#Origin,
					Destination: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#Destination,
					DepartureTime: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#DepartureTime,
					ArrivalTime: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#ArrivalTime,
					UTCDepartureTime: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#UTCDepartureTime,
					UTCArrivalTime: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#UTCArrivalTime,
					OperatingCarrier: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#OperatingCarrier,
					MarketingCarrier: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#MarketingCarrier,
					FlightNumber: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#FlightNumber,
					NativeFlightId: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#NativeFlightId,
					FlightRPH: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#FlightRPH,
					ApisRequired: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#ApisRequired,
					RequireMultipleAPISDocuments: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#RequireMultipleAPISDocuments,
					OpenForCheckIn: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#OpenForCheckIn,
					OpenForBoarding: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#OpenForBoarding,
					ConnectingFlight: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#ConnectingFlight,
					JourneyRPH: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#JourneyRPH,
					CustomProperties: {	
						 string: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Flights.ns01#Flight.ns01#CustomProperties.*string					
					},
				}
			},
			Passengers: {
				(payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Passengers.*ns01#Passenger map ( passenger , indexOfPassenger ) -> {
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
							LastAPIS: {
								Surname: passenger.ns01#Identity.ns01#LastAPIS.ns01#Surname,
								Firstname: passenger.ns01#Identity.ns01#LastAPIS.ns01#Firstname,
								DateOfBirth: passenger.ns01#Identity.ns01#LastAPIS.ns01#DateOfBirth,
								Nationality: passenger.ns01#Identity.ns01#LastAPIS.ns01#Nationality,
								DocumentType: passenger.ns01#Identity.ns01#LastAPIS.ns01#DocumentType,
								DocumentNumber: passenger.ns01#Identity.ns01#LastAPIS.ns01#DocumentNumber,
								DocumentIssueDate: passenger.ns01#Identity.ns01#LastAPIS.ns01#DocumentIssueDate ,
								DocumentExpiryDate: passenger.ns01#Identity.ns01#LastAPIS.ns01#DocumentExpiryDate ,
								CountryOfIssue: passenger.ns01#Identity.LastAPIS.ns01#CountryOfIssue
							}
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
								BaggageAllowance: (passenger.ns01#Baggage.ns01#BaggageAllowances.*ns01#BaggageAllowance map {
									Id: $.Id,
									BaggageAllowanceTypeId: $.BaggageAllowanceTypeId,
									BaggageItemTypeId: $.BaggageItemTypeId,
									BagDropId: $.BagDropId,
									FlightId: $.FlightId,
									PassengerId: $.PassengerId,
									PoolItems: $.PoolItems,
									PoolWeight: $.PoolWeight,
									ConsumeItemWeight: $.ConsumeItemWeight,
									UpdateInitialAllowance: $.UpdateInitialAllowance,
									MaxSingleItemWeight: $.MaxSingleItemWeight,
									InitialBags: $.InitialBags,
									InitialWeight: $.InitialWeight,
									PurchasedBags: $.PurchasedBags,
									PurchasedWeight: $.PurchasedWeight,
									RemainingBags: $.RemainingBags,
									RemainingWeight: $.RemainingWeight,
									CreatedOn: $.CreatedOn,
								})
							},
							BaggageItems: {
								BaggageItem: (passenger.ns01#Baggage.ns01#BaggageItems.*ns01#BaggageItem map {
									Id: $.ns01#Id,
									BaggageAllowanceId: $.ns01#BaggageAllowanceId,
									PassengerId: $.ns01#PassengerId,
									TagNumber: $.ns01#TagNumber,
									Weight: $.ns01#Weight,
									InitialWeight: $.ns01#InitialWeight,
									BaggageItemType: $.ns01#BaggageItemType,
									BaggageItemTypeId: $.ns01#BaggageItemTypeId,
									BaggageItemTypeName: $.ns01#BaggageItemTypeName,
									BaggageItemSubTypeId: $.ns01#BaggageItemSubTypeId,
									HasNotionalWeight: $.ns01#HasNotionalWeight,
									OutOfGauge: $.ns01#OutOfGauge,
									ConsumeAllowance: $.ns01#ConsumeAllowance,
									Registered: $.ns01#Registered,
									Printed: $.ns01#Printed,
									Dropped: $.ns01#Dropped,
									RegisteredTime: $.ns01#RegisteredTime,
									PrintedTime: $.ns01#PrintedTime,
									DroppedTime: $.ns01#DroppedTime,
									CreatedOn: $.ns01#CreatedOn,
									NativeBaggageId:  $.ns01#NativeBaggageId,
									Active: $.ns01#Active
								})
							},
							MaxSingleItemWeight: passenger.ns01#Baggage.ns01#MaxSingleItemWeight
						},
						SSRs: {
							SSR: (passenger.ns01#SSRs.*ns01#SSR map {
								SSRCode: $.ns01#SSRCode,
								SSRDescription: $.ns01#SSRDescription,
								FeeCode: $.ns01#FeeCode,
								PaxNumber: $.ns01#PaxNumber,
								Price: $.ns01#Price
							})
						},
						CustomProperties: {
							string: passenger.ns01#CustomProperties.*string
						}
					}
				})
			},
			Contact: {
				ContactTitle: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#ContactTitle,
				ContactFirstName: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#ContactFirstName,
				ContactLastName: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#ContactLastName,
				TelephoneNumber: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#TelephoneNumber,
				EmailAddress: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#EmailAddress,
				AddressLine: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#AddressLine,
				City: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#City,
				Country: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#Country,
				PostalCode: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#PostalCode,
				CompanyName: {
					"text()": payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#CompanyName
				},
				NotificationPreference: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#Contact.ns01#NotificationPreference
			},
			IsCachedReservation: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#IsCachedReservation,
			BalanceDueOnReservation: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#BalanceDueOnReservation,
			NextFlightRph: payload.ns03#Envelope.ns03#Body.ns0#GetReservationByNativeReferenceResponse.ns0#GetReservationByNativeReferenceResult.ns0#Reservation.ns01#NextFlightRph
		}
	}
}