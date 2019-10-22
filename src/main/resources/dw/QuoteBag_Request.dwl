%dw 2.0
output application/xml skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns a http://www.w3.org/2005/08/addressing
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
		ns0#Envelope: {
		ns0#Header: {
			a#Action @(ns0#mustUnderstand: "1"): "http://services.fusion.aero/IFusionService/QuoteBag",
			a#MessageID: "urn:uuid:e933edc2-19c0-4e4e-87c2-8628bc7bf3b7",
			a#ReplyTo: {
				a#Address: "http://www.w3.org/2005/08/addressing/anonymous"
			},
			a#To @(ns0#mustUnderstand: "1"): "http://local.fusion.aero/FusionService.svc"
		},
		ns0#Body: {
			ns01#QuoteBag: {
				ns01#request: {
					ns02#DepartureAirportCode: payload.QuoteBag_Request.DepartureAirportCode,
					ns02#IataAirlineCode: payload.QuoteBag_Request.IataAirlineCode,
					ns02#MACAddress: payload.QuoteBag_Request.MACAddress,
					ns02#RequestId: payload.QuoteBag_Request.RequestId,
					ns02#RequestSourceName: payload.QuoteBag_Request.RequestSourceName,
					ns02#RequestType: payload.QuoteBag_Request.RequestType,
					ns02#TestRequest: payload.QuoteBag_Request.TestRequest,
					ns02#Session: {
						ns02#KioskId: payload.QuoteBag_Request.Session.KioskId,
						ns02#PNR: payload.QuoteBag_Request.Session.PNR,
						ns02#Price: payload.QuoteBag_Request.Session.Price,
						ns02#ServiceConfigId: payload.QuoteBag_Request.Session.ServiceConfigId,
						ns02#SessionId: payload.QuoteBag_Request.Session.SessionId,
						ns02#StartTime: payload.QuoteBag_Request.Session.StartTime,
						ns02#Status: payload.QuoteBag_Request.Session.Status,
						ns02#UserId: payload.QuoteBag_Request.Session.UserId,
						ns02#Weight: payload.QuoteBag_Request.Session.Weight
					},
					ns01#BaggageItem: (payload.QuoteBag_Request.*BaggageItem map (item, index) ->  {
						ns02#Active: item.Active,
						ns02#BaggageAllowanceId: item.BaggageAllowanceId,
						ns02#BaggageItemSubTypeId: item.BaggageItemSubTypeId,
						ns02#BaggageItemType: item.BaggageItemType,
						ns02#BaggageItemTypeId: item.BaggageItemTypeId,
						ns02#BaggageItemTypeName: item.BaggageItemTypeName,
						ns02#ConsumeAllowance: item.ConsumeAllowance,
						ns02#CreatedOn: item.CreatedOn,
						ns02#Dropped: item.Dropped,
						ns02#DroppedTime: item.DroppedTime,
						ns02#HasNotionalWeight: item.HasNotionalWeight,
						ns02#Id: item.Id,
						ns02#InitialWeight: item.InitialWeight,
						ns02#NativeBaggageId: item.NativeBaggageId,
						ns02#OutOfGauge: item.OutOfGauge,
						ns02#PassengerId: item.PassengerId,
						ns02#Printed: item.Printed,
						ns02#PrintedTime: item.PrintedTime,
						ns02#Registered: item.Registered,
						ns02#RegisteredTime: item.RegisteredTime,
						ns02#SessionId: item.SessionId,
						ns02#Weight: item.Weight
					}),
					ns01#BaggageItemType: payload.QuoteBag_Request.BaggageItemType,
					ns01#Reservation: {
						ns02#BalanceDueOnReservation: payload.QuoteBag_Request.Reservation.BalanceDueOnReservation,
						ns02#Contact: {
							ns02#ContactFirstName: payload.QuoteBag_Request.Reservation.Contact.ContactFirstName,
							ns02#ContactLastName: payload.QuoteBag_Request.Reservation.Contact.ContactLastName,
							ns02#ContactTitle: payload.QuoteBag_Request.Reservation.Contact.ContactTitle,
							ns02#NotificationPreference: payload.QuoteBag_Request.Reservation.Contact.NotificationPreference
						},
						ns02#CurrentPassenger: {
							ns02#Active: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Active,
							ns02#AllowanceRetrieved: payload.QuoteBag_Request.Reservation.Passengers.Passenger.AllowanceRetrieved,
							ns02#Baggage: {
								ns02#BaggageAllowance: {
									ns02#BagDropId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BagDropId,
									ns02#BaggageAllowanceTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
									ns02#BaggageItemTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
									ns02#ConsumeItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight,
									ns02#CreatedOn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.CreatedOn,
									ns02#FlightId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.FlightId,
									ns02#Id: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.Id,
									ns02#InitialBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.InitialBags,
									ns02#InitialWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.InitialWeight,
									ns02#MaxSingleItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight,
									ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PassengerId,
									ns02#PoolItems: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PoolItems,
									ns02#PoolWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PoolWeight,
									ns02#PurchasedBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PurchasedBags,
									ns02#PurchasedWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PurchasedWeight,
									ns02#RemainingBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.RemainingBags,
									ns02#RemainingWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.RemainingWeight,
									ns02#UpdateInitialAllowance: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance
								} ,
								ns02#BaggageItems: {
									ns02#BaggageItem: (payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.*BaggageItem map (item, index) ->  {
										ns02#Active: item.Active,
										ns02#BaggageAllowanceId: item.BaggageAllowanceId,
										ns02#BaggageItemSubTypeId: item.BaggageItemSubTypeId,
										ns02#BaggageItemSubTypeName: item.BaggageItemSubTypeName,
										ns02#BaggageItemType: item.BaggageItemType,
										ns02#BaggageItemTypeId: item.BaggageItemTypeId,
										ns02#BaggageItemTypeName: item.BaggageItemTypeName,
										ns02#ConsumeAllowance: item.ConsumeAllowance,
										ns02#CreatedOn: item.CreatedOn,
										ns02#Dropped: item.Dropped,
										ns02#DroppedTime: item.DroppedTime,
										ns02#HasNotionalWeight: item.HasNotionalWeight,
										ns02#Id: item.Id,
										ns02#InitialWeight: item.InitialWeight,
										ns02#NativeBaggageId: item.NativeBaggageId default null,
										ns02#OutOfGauge: item.OutOfGauge,
										ns02#PassengerId: item.PassengerId,
										ns02#Printed: item.Printed,
										ns02#PrintedTime: item.PrintedTime,
										ns02#Registered: item.Registered,
										ns02#RegisteredTime: item.RegisteredTime,
										ns02#SessionId: item.SessionId,
										ns02#TagNumber: item.TagNumber,
										ns02#Weight: item.Weight
									})
								} ,
								ns02#MaxSingleItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.MaxSingleItemWeight
							},
							ns02#Boarded: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Boarded,
							ns02#CheckedIn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.CheckedIn,
							ns02#ClearanceRequired: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ClearanceRequired,
							ns02#ClearanceStatus: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ClearanceStatus,
							ns02#ConfirmedDga: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConfirmedDga,
							ns02#ConfirmedIdentity: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConfirmedIdentity,
							ns02#ConnectingFlightNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConnectingFlightNumber,
							ns02#DateOfBirth: payload.QuoteBag_Request.Reservation.Passengers.Passenger.DateOfBirth default null,
							ns02#DocumentCheckRequired: payload.QuoteBag_Request.Reservation.Passengers.Passenger.DocumentCheckRequired,
							ns02#FirstName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.FirstName,
							ns02#Gender: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Gender,
							ns02#IsSelectableForBoardingPass: payload.QuoteBag_Request.Reservation.Passengers.Passenger.IsSelectableForBoardingPass,
							ns02#IsSelected: payload.QuoteBag_Request.Reservation.Passengers.Passenger.IsSelected,
							ns02#LastName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.LastName,
							ns02#MarketingCarrierCode: payload.QuoteBag_Request.Reservation.Passengers.Passenger.MarketingCarrierCode,
							ns02#NativePassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.NativePassengerId,
							ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerId,
							ns02#PassengerRPH: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerRPH,
							ns02#PassengerSequenceNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerSequenceNumber,
							ns02#RequiresCheckin: payload.QuoteBag_Request.Reservation.Passengers.Passenger.RequiresCheckin,
							ns02#SeatNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.SeatNumber,
							ns02#SupportsCheckin: payload.QuoteBag_Request.Reservation.Passengers.Passenger.SupportsCheckin,
							ns02#Title: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Title
						},
						ns02#Flights: {
							ns02#Flight: {
								ns02#ApisRequired: payload.QuoteBag_Request.Reservation.Flights.Flight.ApisRequired,
								ns02#ArrivalTime: payload.QuoteBag_Request.Reservation.Flights.Flight.ArrivalTime,
								ns02#ConnectingFlight: payload.QuoteBag_Request.Reservation.Flights.Flight.ConnectingFlight,								
								ns02#CustomProperties:{
									ns03#string: payload.QuoteBag_Request.Reservation.Flights.Flight.CustomProperties.*string
								},
								ns02#DepartureTerminal: payload.QuoteBag_Request.Reservation.Flights.Flight.DepartureTerminal default null,
								ns02#DepartureTime: payload.QuoteBag_Request.Reservation.Flights.Flight.DepartureTime,
								ns02#Destination: payload.QuoteBag_Request.Reservation.Flights.Flight.Destination,
								ns02#EstimatedDepartureTime: payload.QuoteBag_Request.Reservation.Flights.Flight.EstimatedDepartureTime,
								ns02#FlightNumber: payload.QuoteBag_Request.Reservation.Flights.Flight.FlightNumber,
								ns02#FlightRPH: payload.QuoteBag_Request.Reservation.Flights.Flight.FlightRPH,
								ns02#Id: payload.QuoteBag_Request.Reservation.Flights.Flight.Id,
								ns02#JourneyRPH: payload.QuoteBag_Request.Reservation.Flights.Flight.JourneyRPH,
								ns02#MarketingCarrier: payload.QuoteBag_Request.Reservation.Flights.Flight.MarketingCarrier,
								ns02#NativeFlightId: payload.QuoteBag_Request.Reservation.Flights.Flight.NativeFlightId,
								ns02#OpenForBoarding: payload.QuoteBag_Request.Reservation.Flights.Flight.OpenForBoarding,
								ns02#OpenForCheckIn: payload.QuoteBag_Request.Reservation.Flights.Flight.OpenForCheckIn,
								ns02#OperatingCarrier: payload.QuoteBag_Request.Reservation.Flights.Flight.OperatingCarrier,
								ns02#Origin: payload.QuoteBag_Request.Reservation.Flights.Flight.Origin,
								ns02#RequireMultipleAPISDocuments: payload.QuoteBag_Request.Reservation.Flights.Flight.RequireMultipleAPISDocuments,
								ns02#UTCArrivalTime: payload.QuoteBag_Request.Reservation.Flights.Flight.UTCArrivalTime,
								ns02#UTCDepartureTime: payload.QuoteBag_Request.Reservation.Flights.Flight.UTCDepartureTime,
								ns02#UTCEstimatedDepartureTime: payload.QuoteBag_Request.Reservation.Flights.Flight.UTCEstimatedDepartureTime,
							}
						},
						ns02#IsCachedReservation: payload.QuoteBag_Request.Reservation.IsCachedReservation,
						ns02#IsGroupBooking: payload.QuoteBag_Request.Reservation.IsGroupBooking,
						ns02#NativeReference: payload.QuoteBag_Request.Reservation.NativeReference,
						ns02#NextFlightRph: payload.QuoteBag_Request.Reservation.NextFlightRph,
						ns02#Passengers: {
							ns02#Passenger: (payload.QuoteBag_Request.Reservation.Passengers.*Passenger map (passItem, passIndex) -> {
								ns02#Active: passItem.Active,
								ns02#AllowanceRetrieved: passItem.AllowanceRetrieved,
								ns02#Baggage: {
									ns02#BaggageAllowance: {
										ns02#BagDropId: passItem.Baggage.BaggageAllowance.BagDropId,
										ns02#BaggageAllowanceTypeId: passItem.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
										ns02#BaggageItemTypeId: passItem.Baggage.BaggageAllowance.BaggageItemTypeId,
										ns02#ConsumeItemWeight: passItem.Baggage.BaggageAllowance.ConsumeItemWeight,
										ns02#CreatedOn: passItem.Baggage.BaggageAllowance.CreatedOn,
										ns02#FlightId: passItem.Baggage.BaggageAllowance.FlightId,
										ns02#Id: passItem.Baggage.BaggageAllowance.Id,
										ns02#InitialBags: passItem.Baggage.BaggageAllowance.InitialBags,
										ns02#InitialWeight: passItem.Baggage.BaggageAllowance.InitialWeight,
										ns02#MaxSingleItemWeight: passItem.Baggage.BaggageAllowance.MaxSingleItemWeight,
										ns02#PassengerId: passItem.Baggage.BaggageAllowance.PassengerId default null,
										ns02#PoolItems: passItem.Baggage.BaggageAllowance.PoolItems,
										ns02#PoolWeight: passItem.Baggage.BaggageAllowance.PoolWeight,
										ns02#PurchasedBags: passItem.Baggage.BaggageAllowance.PurchasedBags,
										ns02#PurchasedWeight: passItem.Baggage.BaggageAllowance.PurchasedWeight,
										ns02#RemainingBags: passItem.Baggage.BaggageAllowance.RemainingBags,
										ns02#RemainingWeight: passItem.Baggage.BaggageAllowance.RemainingWeight,
										ns02#UpdateInitialAllowance: passItem.Baggage.BaggageAllowance.UpdateInitialAllowance
									},
									ns02#BaggageItems: {
										ns02#BaggageItem: (passItem.Baggage.BaggageItems.*BaggageItem map (item, index) ->  {
											ns02#Active: item.Active  default null,
											ns02#BaggageAllowanceId: item.BaggageAllowanceId,
											ns02#BaggageItemSubTypeId: item.BaggageItemSubTypeId,
											ns02#BaggageItemSubTypeName: item.BaggageItemSubTypeName,
											ns02#BaggageItemType: item.BaggageItemType,
											ns02#BaggageItemTypeId: item.BaggageItemTypeId,
											ns02#BaggageItemTypeName: item.BaggageItemTypeName,
											ns02#ConsumeAllowance: item.ConsumeAllowance,
											ns02#CreatedOn: item.CreatedOn,
											ns02#Dropped: item.Dropped,
											ns02#DroppedTime: item.DroppedTime,
											ns02#HasNotionalWeight: item.HasNotionalWeight,
											ns02#Id: item.Id,
											ns02#InitialWeight: item.InitialWeight,
											ns02#NativeBaggageId: item.NativeBaggageId default null,
											ns02#OutOfGauge: item.OutOfGauge,
											ns02#PassengerId: item.PassengerId,
											ns02#Printed: item.Printed,
											ns02#PrintedTime: item.PrintedTime,
											ns02#Registered: item.Registered,
											ns02#RegisteredTime: item.RegisteredTime,
											ns02#SessionId: item.SessionId,
											ns02#TagNumber: item.TagNumber,
											ns02#Weight: item.Weight
										})
									},
									ns02#MaxSingleItemWeight: passItem.Baggage.MaxSingleItemWeight
								},
								ns02#Barcode: passItem.Barcode,								
								ns02#Boarded: passItem.Boarded,
								ns02#CarrierBookingClass: passItem.CarrierBookingClass,
								ns02#CheckedIn: passItem.CheckedIn,
								ns02#ClearanceRequired: passItem.ClearanceRequired,
								ns02#ClearanceStatus: passItem.ClearanceStatus,
								ns02#ConfirmedDga: passItem.ConfirmedDga,
								ns02#ConfirmedIdentity: passItem.ConfirmedIdentity,
								ns02#ConnectingFlightNumber: passItem.ConnectingFlightNumber,
								ns02#CustomProperties:{
									ns03#string: passItem.CustomProperties.*string
								},
								ns02#DateOfBirth: passItem.DateOfBirth,
								ns02#DocumentCheckRequired: passItem.DocumentCheckRequired,
								ns02#Fees:{
									ns02#Fee: (passItem.Fees.*Fee map  {
										ns02#Code: $.Code,
										ns02#Currency: $.Currency,
										ns02#FeeAmount: $.FeeAmount,
										ns02#FeeType: $.FeeType,										
									})
								},
								ns02#FirstName: passItem.FirstName,
								ns02#Gender: passItem.Gender,								
								ns02#Identity: if (passItem.Identity.LastAPIS != null) {
									ns02#LastAPIS: {	
										ns02#AddressInformation: passItem.Identity.LastAPIS.AddressInformation,	
										ns02#ContactInformation: if (passItem.Identity.LastAPIS.ContactInformation.ContactLastName != null) {
											ns02#AddressLine: passItem.Identity.LastAPIS.ContactInformation.AddressLine,
											ns02#City: passItem.Identity.LastAPIS.ContactInformation.City,
											ns02#CompanyName: passItem.Identity.LastAPIS.ContactInformation.CompanyName,
											ns02#ContactFirstName: passItem.Identity.LastAPIS.ContactInformation.ContactFirstName,
											ns02#ContactLastName: passItem.Identity.LastAPIS.ContactInformation.ContactLastName,
											ns02#ContactTitle: passItem.Identity.LastAPIS.ContactInformation.ContactTitle,
											ns02#Country: passItem.Identity.LastAPIS.ContactInformation.Country,
											ns02#EmailAddress: passItem.Identity.LastAPIS.ContactInformation.EmailAddress,
											ns02#NotificationPreference: passItem.Identity.LastAPIS.ContactInformation.NotificationPreference,
											ns02#PostalCode: passItem.Identity.LastAPIS.ContactInformation.PostalCode,
											ns02#TelephoneNumber: passItem.Identity.LastAPIS.ContactInformation.TelephoneNumber,									
										} else null,
										ns02#CountryOfIssue: passItem.Identity.LastAPIS.CountryOfIssue,
										ns02#CountryOfResidence: passItem.Identity.LastAPIS.CountryOfResidence,								
										ns02#DateOfBirth: passItem.Identity.LastAPIS.DateOfBirth,		
										ns02#DocumentExpiryDate: passItem.Identity.LastAPIS.DocumentExpiryDate,
										ns02#DocumentIssueDate: passItem.Identity.LastAPIS.DocumentIssueDate,
										ns02#DocumentNumber: passItem.Identity.LastAPIS.DocumentNumber,						
										ns02#DocumentType: passItem.Identity.LastAPIS.DocumentType,
										ns02#Firstname: passItem.Identity.LastAPIS.Firstname,
										ns02#Forenames: passItem.Identity.LastAPIS.Forenames,
										ns02#Gender: passItem.Identity.LastAPIS.Gender,
										ns02#Nationality: passItem.Identity.LastAPIS.Nationality,
										ns02#Surname: passItem.Identity.LastAPIS.Surname
									} 
								} else null,
								ns02#IsSelectableForBoardingPass: passItem.IsSelectableForBoardingPass,
								ns02#IsSelected: passItem.IsSelected,
								ns02#LastName: passItem.LastName,
								ns02#MarketingCarrierCode: passItem.MarketingCarrierCode,
								ns02#NativePassengerId: passItem.NativePassengerId,
								ns02#PassengerId: passItem.PassengerId,
								ns02#PassengerRPH: passItem.PassengerRPH,
								ns02#PassengerSequenceNumber: passItem.PassengerSequenceNumber,
								ns02#PaxType: passItem.PaxType,
								ns02#Remarks: {
									ns02#Remark: (passItem.Remarks.*Remark map  {
										ns02#RemarkType: $.RemarkType,
										ns02#Wording: $.Wording,										
									})
								},
								ns02#RequiresCheckin: passItem.RequiresCheckin,
								ns02#SSRs: {
									ns02#SSR: (passItem.SSRs.*SSR map (itemon, indexon) -> {
										ns02#Currency: itemon.Currency,
										ns02#FeeCode: itemon.FeeCode,
										ns02#FlightNumber: itemon.FlightNumber,
										ns02#PaxNumber: itemon.PaxNumber,
										ns02#Price: itemon.Price,
										ns02#SSRCode: itemon.SSRCode,
										ns02#SSRDescription: itemon.SSRDescription,				
									})
								},
								ns02#SeatNumber: passItem.SeatNumber,
								ns02#SeatPreference: {
									ns02#Name: passItem.SeatPreference.Name,
								}, 								
								ns02#SupportsCheckin: passItem.SupportsCheckin,
								ns02#Title: passItem.Title
							})
							
							
							
							
						}
					},
					ns01#ScaleWeight: payload.QuoteBag_Request.ScaleWeight,
					ns01#UnusedBaggageAllowance: {
						ns02#BaggageAllowance:( payload.QuoteBag_Request.UnusedBaggageAllowance.*BaggageAllowance map {
							ns02#BagDropId: $.BagDropId,
							ns02#BaggageAllowanceTypeId: $.BaggageAllowanceTypeId,
							ns02#BaggageItemTypeId: $.BaggageItemTypeId,
							ns02#ConsumeItemWeight: $.ConsumeItemWeight,
							ns02#CreatedOn: $.CreatedOn,
							ns02#FlightId: $.FlightId,
							ns02#Id: $.Id,
							ns02#InitialBags: $.InitialBags,
							ns02#InitialWeight: $.InitialWeight,
							ns02#MaxSingleItemWeight: $.MaxSingleItemWeight,
							ns02#PassengerId: $.PassengerId,
							ns02#PoolItems: $.PoolItems,
							ns02#PoolWeight: $.PoolWeight,
							ns02#PurchasedBags: $.PurchasedBags,
							ns02#PurchasedWeight: $.PurchasedWeight,
							ns02#RemainingBags: $.RemainingBags,
							ns02#RemainingWeight: $.RemainingWeight,
							ns02#UpdateInitialAllowance: $.UpdateInitialAllowance
						})
					}
				}
			}
		}
	}
}