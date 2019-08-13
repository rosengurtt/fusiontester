%dw 2.0
output application/xml skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns a http://www.w3.org/2005/08/addressing
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
					ns02#RequestSourceName: payload.QuoteBag_Request.RequestSourceName,
					ns02#RequestType: payload.QuoteBag_Request.RequestType,
					ns02#TestRequest: payload.QuoteBag_Request.TestRequest as String default null,
					ns02#Session: {
						ns02#KioskId: payload.QuoteBag_Request.Session.KioskId,
						ns02#PNR: payload.QuoteBag_Request.Session.PNR,
						ns02#Price: payload.QuoteBag_Request.Session.Price as String default null,
						ns02#ServiceConfigId: payload.QuoteBag_Request.Session.ServiceConfigId,
						ns02#SessionId: payload.QuoteBag_Request.Session.SessionId,
						ns02#StartTime: payload.QuoteBag_Request.Session.StartTime as String default null,
						ns02#Status: payload.QuoteBag_Request.Session.Status,
						ns02#UserId: payload.QuoteBag_Request.Session.UserId,
						ns02#Weight: payload.QuoteBag_Request.Session.Weight as String default null
					},
					ns01#BaggageItemType: payload.QuoteBag_Request.BaggageItemType,
					ns01#Reservation: {
						ns02#BalanceDueOnReservation: payload.QuoteBag_Request.Reservation.BalanceDueOnReservation as String default null,
						ns02#Contact: {
							ns02#ContactFirstName: payload.QuoteBag_Request.Reservation.Contact.ContactFirstName,
							ns02#ContactLastName: payload.QuoteBag_Request.Reservation.Contact.ContactLastName,
							ns02#ContactTitle: payload.QuoteBag_Request.Reservation.Contact.ContactTitle,
							ns02#NotificationPreference: payload.QuoteBag_Request.Reservation.Contact.NotificationPreference
						},
						ns02#CurrentPassenger: {
							ns02#Active: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Active as String default null,
							ns02#AllowanceRetrieved: payload.QuoteBag_Request.Reservation.Passengers.Passenger.AllowanceRetrieved as String default null,
							ns02#Baggage: {
								ns02#BaggageAllowance: {
									ns02#BagDropId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BagDropId,
									ns02#BaggageAllowanceTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
									ns02#BaggageItemTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
									ns02#ConsumeItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight as String default null,
									ns02#CreatedOn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.CreatedOn as String default null,
									ns02#FlightId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.FlightId,
									ns02#Id: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.Id,
									ns02#InitialBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.InitialBags as String default null,
									ns02#InitialWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.InitialWeight as String default null,
									ns02#MaxSingleItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight as String default null,
									ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PassengerId as String default null,
									ns02#PoolItems: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PoolItems as String default null,
									ns02#PoolWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PoolWeight as String default null,
									ns02#PurchasedBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PurchasedBags as String default null,
									ns02#PurchasedWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PurchasedWeight as String default null,
									ns02#RemainingBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.RemainingBags as String default null,
									ns02#RemainingWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.RemainingWeight as String default null,
									ns02#UpdateInitialAllowance: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance as String
								},
								ns02#BaggageItems: {
									ns02#BaggageItem: {
										ns02#Active: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Active default null,
										ns02#BaggageAllowanceId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageAllowanceId,
										ns02#BaggageItemSubTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeId,
										ns02#BaggageItemSubTypeName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeName,
										ns02#BaggageItemType: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemType,
										ns02#BaggageItemTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeId,
										ns02#BaggageItemTypeName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeName,
										ns02#ConsumeAllowance: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.ConsumeAllowance as String default null,
										ns02#CreatedOn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.CreatedOn as String default null,
										ns02#Dropped: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Dropped as String default null,
										ns02#DroppedTime: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.DroppedTime as String default null,
										ns02#HasNotionalWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.HasNotionalWeight as String default null,
										ns02#Id: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Id,
										ns02#InitialWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.InitialWeight as String default null,
										ns02#NativeBaggageId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.NativeBaggageId default null,
										ns02#OutOfGauge: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.OutOfGauge as String default null,
										ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.PassengerId,
										ns02#Printed: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Printed as String default null,
										ns02#PrintedTime: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.PrintedTime as String default null,
										ns02#Registered: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Registered as String default null,
										ns02#RegisteredTime: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.RegisteredTime as String default null,
										ns02#SessionId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.SessionId,
										ns02#TagNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.TagNumber as String default null,
										ns02#Weight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Weight as String default null
									}
								},
								ns02#MaxSingleItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.MaxSingleItemWeight as String default null
							},
							ns02#Boarded: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Boarded as String default null,
							ns02#CheckedIn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.CheckedIn as String default null,
							ns02#ClearanceRequired: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ClearanceRequired as String default null,
							ns02#ClearanceStatus: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ClearanceStatus,
							ns02#ConfirmedDga: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConfirmedDga as String default null,
							ns02#ConfirmedIdentity: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConfirmedIdentity as String default null,
							ns02#ConnectingFlightNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConnectingFlightNumber as String default null,
							ns02#DateOfBirth: payload.QuoteBag_Request.Reservation.Passengers.Passenger.DateOfBirth default null,
							ns02#DocumentCheckRequired: payload.QuoteBag_Request.Reservation.Passengers.Passenger.DocumentCheckRequired as String default null,
							ns02#FirstName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.FirstName,
							ns02#Gender: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Gender,
							ns02#IsSelectableForBoardingPass: payload.QuoteBag_Request.Reservation.Passengers.Passenger.IsSelectableForBoardingPass as String default null,
							ns02#IsSelected: payload.QuoteBag_Request.Reservation.Passengers.Passenger.IsSelected as String default null,
							ns02#LastName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.LastName,
							ns02#MarketingCarrierCode: payload.QuoteBag_Request.Reservation.Passengers.Passenger.MarketingCarrierCode,
							ns02#NativePassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.NativePassengerId as String default null,
							ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerId,
							ns02#PassengerRPH: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerRPH as String default null,
							ns02#PassengerSequenceNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerSequenceNumber,
							ns02#RequiresCheckin: payload.QuoteBag_Request.Reservation.Passengers.Passenger.RequiresCheckin as String default null,
							ns02#SeatNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.SeatNumber,
							ns02#SupportsCheckin: payload.QuoteBag_Request.Reservation.Passengers.Passenger.SupportsCheckin as String default null,
							ns02#Title: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Title
						},
						ns02#Flights: {
							ns02#Flight: {
								ns02#ApisRequired: payload.QuoteBag_Request.Reservation.Flights.Flight.ApisRequired as String default null,
								ns02#ArrivalTime: payload.QuoteBag_Request.Reservation.Flights.Flight.ArrivalTime as String default null,
								ns02#ConnectingFlight: payload.QuoteBag_Request.Reservation.Flights.Flight.ConnectingFlight as String default null,
								ns02#DepartureTerminal: payload.QuoteBag_Request.Reservation.Flights.Flight.DepartureTerminal default null,
								ns02#DepartureTime: payload.QuoteBag_Request.Reservation.Flights.Flight.DepartureTime as String default null,
								ns02#Destination: payload.QuoteBag_Request.Reservation.Flights.Flight.Destination,
								ns02#FlightNumber: payload.QuoteBag_Request.Reservation.Flights.Flight.FlightNumber as String default null,
								ns02#FlightRPH: payload.QuoteBag_Request.Reservation.Flights.Flight.FlightRPH as String default null,
								ns02#Id: payload.QuoteBag_Request.Reservation.Flights.Flight.Id,
								ns02#JourneyRPH: payload.QuoteBag_Request.Reservation.Flights.Flight.JourneyRPH as String default null,
								ns02#MarketingCarrier: payload.QuoteBag_Request.Reservation.Flights.Flight.MarketingCarrier,
								ns02#NativeFlightId: payload.QuoteBag_Request.Reservation.Flights.Flight.NativeFlightId as String default null,
								ns02#OpenForBoarding: payload.QuoteBag_Request.Reservation.Flights.Flight.OpenForBoarding as String default null,
								ns02#OpenForCheckIn: payload.QuoteBag_Request.Reservation.Flights.Flight.OpenForCheckIn as String default null,
								ns02#OperatingCarrier: payload.QuoteBag_Request.Reservation.Flights.Flight.OperatingCarrier,
								ns02#Origin: payload.QuoteBag_Request.Reservation.Flights.Flight.Origin,
								ns02#RequireMultipleAPISDocuments: payload.QuoteBag_Request.Reservation.Flights.Flight.RequireMultipleAPISDocuments as String default null,
								ns02#UTCArrivalTime: payload.QuoteBag_Request.Reservation.Flights.Flight.UTCArrivalTime as String default null,
								ns02#UTCDepartureTime: payload.QuoteBag_Request.Reservation.Flights.Flight.UTCDepartureTime as String default null
							}
						},
						ns02#IsCachedReservation: payload.QuoteBag_Request.Reservation.IsCachedReservation as String default null,
						ns02#IsGroupBooking: payload.QuoteBag_Request.Reservation.IsGroupBooking as String default null,
						ns02#NativeReference: payload.QuoteBag_Request.Reservation.NativeReference,
						ns02#NextFlightRph: payload.QuoteBag_Request.Reservation.NextFlightRph as String default null,
						ns02#Passengers: {
							ns02#Passenger: {
								ns02#Active: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Active as String default null,
								ns02#AllowanceRetrieved: payload.QuoteBag_Request.Reservation.Passengers.Passenger.AllowanceRetrieved as String default null,
								ns02#Baggage: {
									ns02#BaggageAllowance: {
										ns02#BagDropId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BagDropId,
										ns02#BaggageAllowanceTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
										ns02#BaggageItemTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
										ns02#ConsumeItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight as String default null,
										ns02#CreatedOn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.CreatedOn as String default null,
										ns02#FlightId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.FlightId,
										ns02#Id: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.Id,
										ns02#InitialBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.InitialBags as String default null,
										ns02#InitialWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.InitialWeight as String default null,
										ns02#MaxSingleItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight as String default null,
										ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PassengerId default null,
										ns02#PoolItems: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PoolItems as String default null,
										ns02#PoolWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PoolWeight as String default null,
										ns02#PurchasedBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PurchasedBags as String default null,
										ns02#PurchasedWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.PurchasedWeight as String default null,
										ns02#RemainingBags: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.RemainingBags as String default null,
										ns02#RemainingWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.RemainingWeight as String default null,
										ns02#UpdateInitialAllowance: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance as String
									},
									ns02#BaggageItems: {
										ns02#BaggageItem: {
											ns02#Active: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Active  default null,
											ns02#BaggageAllowanceId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageAllowanceId,
											ns02#BaggageItemSubTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeId,
											ns02#BaggageItemSubTypeName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeName,
											ns02#BaggageItemType: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemType,
											ns02#BaggageItemTypeId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeId,
											ns02#BaggageItemTypeName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeName,
											ns02#ConsumeAllowance: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.ConsumeAllowance as String default null,
											ns02#CreatedOn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.CreatedOn as String default null,
											ns02#Dropped: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Dropped as String default null,
											ns02#DroppedTime: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.DroppedTime as String default null,
											ns02#HasNotionalWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.HasNotionalWeight as String default null,
											ns02#Id: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Id,
											ns02#InitialWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.InitialWeight as String default null,
											ns02#NativeBaggageId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.NativeBaggageId default null,
											ns02#OutOfGauge: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.OutOfGauge as String default null,
											ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.PassengerId,
											ns02#Printed: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Printed as String default null,
											ns02#PrintedTime: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.PrintedTime as String default null,
											ns02#Registered: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Registered as String default null,
											ns02#RegisteredTime: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.RegisteredTime as String default null,
											ns02#SessionId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.SessionId,
											ns02#TagNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.TagNumber as String default null,
											ns02#Weight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.BaggageItems.BaggageItem.Weight as String default null
										}
									},
									ns02#MaxSingleItemWeight: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Baggage.MaxSingleItemWeight as String default null
								},
								ns02#Boarded: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Boarded as String default null,
								ns02#CheckedIn: payload.QuoteBag_Request.Reservation.Passengers.Passenger.CheckedIn as String default null,
								ns02#ClearanceRequired: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ClearanceRequired as String default null,
								ns02#ClearanceStatus: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ClearanceStatus,
								ns02#ConfirmedDga: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConfirmedDga as String default null,
								ns02#ConfirmedIdentity: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConfirmedIdentity as String default null,
								ns02#ConnectingFlightNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.ConnectingFlightNumber as String default null,
								ns02#DateOfBirth: payload.QuoteBag_Request.Reservation.Passengers.Passenger.DateOfBirth default null,
								ns02#DocumentCheckRequired: payload.QuoteBag_Request.Reservation.Passengers.Passenger.DocumentCheckRequired as String default null,
								ns02#FirstName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.FirstName,
								ns02#Gender: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Gender,
								ns02#IsSelectableForBoardingPass: payload.QuoteBag_Request.Reservation.Passengers.Passenger.IsSelectableForBoardingPass as String default null,
								ns02#IsSelected: payload.QuoteBag_Request.Reservation.Passengers.Passenger.IsSelected as String default null,
								ns02#LastName: payload.QuoteBag_Request.Reservation.Passengers.Passenger.LastName,
								ns02#MarketingCarrierCode: payload.QuoteBag_Request.Reservation.Passengers.Passenger.MarketingCarrierCode,
								ns02#NativePassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.NativePassengerId as String default null,
								ns02#PassengerId: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerId,
								ns02#PassengerRPH: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerRPH as String default null,
								ns02#PassengerSequenceNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.PassengerSequenceNumber,
								ns02#RequiresCheckin: payload.QuoteBag_Request.Reservation.Passengers.Passenger.RequiresCheckin as String default null,
								ns02#SeatNumber: payload.QuoteBag_Request.Reservation.Passengers.Passenger.SeatNumber,
								ns02#SupportsCheckin: payload.QuoteBag_Request.Reservation.Passengers.Passenger.SupportsCheckin as String default null,
								ns02#Title: payload.QuoteBag_Request.Reservation.Passengers.Passenger.Title
							}
						}
					},
					ns01#ScaleWeight: payload.QuoteBag_Request.ScaleWeight as String default null,
					ns01#UnusedBaggageAllowance: {
						ns02#BaggageAllowance: {
							ns02#BagDropId: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.BagDropId,
							ns02#BaggageAllowanceTypeId: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.BaggageAllowanceTypeId,
							ns02#BaggageItemTypeId: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.BaggageItemTypeId,
							ns02#ConsumeItemWeight: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.ConsumeItemWeight as String default null,
							ns02#CreatedOn: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.CreatedOn as String default null,
							ns02#FlightId: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.FlightId,
							ns02#Id: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.Id,
							ns02#InitialBags: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.InitialBags as String default null,
							ns02#InitialWeight: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.InitialWeight as String default null,
							ns02#MaxSingleItemWeight: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.MaxSingleItemWeight as String default null,
							ns02#PassengerId: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.PassengerId,
							ns02#PoolItems: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.PoolItems as String default null,
							ns02#PoolWeight: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.PoolWeight as String default null,
							ns02#PurchasedWeight: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.PurchasedWeight as String default null,
							ns02#RemainingBags: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.RemainingBags as String default null,
							ns02#RemainingWeight: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.RemainingWeight as String default null,
							ns02#UpdateInitialAllowance: payload.QuoteBag_Request.UnusedBaggageAllowance.BaggageAllowance.UpdateInitialAllowance as String default null
						}
					}
				}
			}
		}
	}
}