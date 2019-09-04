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
			a#Action @(ns0#mustUnderstand: "1"): "http://services.fusion.aero/IFusionService/BuyAllowance",
			a#MessageID: "urn:uuid:e933edc2-19c0-4e4e-87c2-8628bc7bf3b7",
			a#ReplyTo: {
				a#Address: "http://www.w3.org/2005/08/addressing/anonymous"
			},
			a#To @(ns0#mustUnderstand: "1"): "http://local.fusion.aero/FusionService.svc"
		},
		ns0#Body: {
			ns01#BuyAllowance: {
				ns01#request: {
					ns02#DepartureAirportCode: payload.BuyAllowance_Request.DepartureAirportCode,
					ns02#IataAirlineCode: payload.BuyAllowance_Request.IataAirlineCode,
					ns02#MACAddress: payload.BuyAllowance_Request.MACAddress,
					ns02#RequestId: payload.BuyAllowance_Request.RequestId,
					ns02#RequestSourceName: payload.BuyAllowance_Request.RequestSourceName,
					ns02#RequestType: payload.BuyAllowance_Request.RequestType,
					ns02#TestRequest: payload.BuyAllowance_Request.TestRequest,
					ns02#Session: {
						ns02#EndTime: payload.BuyAllowance_Request.Session.EndTime,
						ns02#KioskId: payload.BuyAllowance_Request.Session.KioskId,
						ns02#PNR: payload.BuyAllowance_Request.Session.PNR,
						ns02#Price: payload.BuyAllowance_Request.Session.Price as String default null,
						ns02#ServiceConfigId: payload.BuyAllowance_Request.Session.ServiceConfigId,
						ns02#SessionId: payload.BuyAllowance_Request.Session.SessionId,
						ns02#StartTime: payload.BuyAllowance_Request.Session.StartTime,
						ns02#Status: payload.BuyAllowance_Request.Session.Status,
						ns02#UserId: payload.BuyAllowance_Request.Session.UserId,
						ns02#Weight: payload.BuyAllowance_Request.Session.Weight
					},
					ns01#AgentName: payload.BuyAllowance_Request.AgentName,
					ns01#Costs: {
						ns02#Currency: payload.BuyAllowance_Request.Costs.Currency,
						ns02#ItemList: {
							ns02#ExcessBaggageCost: {
								ns02#AdditionalAllowance: {
									ns02#BagDropId: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.BagDropId,
									ns02#BaggageAllowanceTypeId: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.BaggageAllowanceTypeId,
									ns02#BaggageItemTypeId: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.BaggageItemTypeId,
									ns02#ConsumeItemWeight: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.ConsumeItemWeight as String default null,
									ns02#CreatedOn: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.CreatedOn as String default null,
									ns02#FlightId: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.FlightId,
									ns02#Id: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.Id,
									ns02#InitialBags: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.InitialBags as String default null,
									ns02#InitialWeight: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.InitialWeight as String default null,
									ns02#MaxSingleItemWeight: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.MaxSingleItemWeight as String default null,
									ns02#PassengerId: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PassengerId as String default null,
									ns02#PoolItems: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PoolItems as String default null,
									ns02#PoolWeight: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PoolWeight as String default null,
									ns02#PurchasedBags: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PurchasedBags as String default null,
									ns02#PurchasedWeight: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PurchasedWeight as String default null,
									ns02#RemainingBags: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.RemainingBags as String default null,
									ns02#RemainingWeight: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.RemainingWeight as String default null,
									ns02#UpdateInitialAllowance: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.UpdateInitialAllowance as String default null
								},
								ns02#Description: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.Description,
								ns02#Price: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.Price as String default null,
								ns02#Quantity: payload.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.Quantity as String default null
							}
						},
						ns02#PaymentType: payload.BuyAllowance_Request.Costs.PaymentType,
						ns02#QuoteStatus: payload.BuyAllowance_Request.Costs.QuoteStatus
					},
					ns01#Flights: {
						ns02#Flight: {
							ns02#ApisRequired: payload.BuyAllowance_Request.Flights.Flight.ApisRequired as String default null,
							ns02#ArrivalTime: payload.BuyAllowance_Request.Flights.Flight.ArrivalTime as String default null,
							ns02#ConnectingFlight: payload.BuyAllowance_Request.Flights.Flight.ConnectingFlight as String default null,
							ns02#DepartureTerminal: payload.BuyAllowance_Request.Flights.Flight.DepartureTerminal as String default null,
							ns02#DepartureTime: payload.BuyAllowance_Request.Flights.Flight.DepartureTime as String default null,
							ns02#Destination: payload.BuyAllowance_Request.Flights.Flight.Destination,
							ns02#FlightNumber: payload.BuyAllowance_Request.Flights.Flight.FlightNumber as String default null,
							ns02#FlightRPH: payload.BuyAllowance_Request.Flights.Flight.FlightRPH as String default null,
							ns02#Id: payload.BuyAllowance_Request.Flights.Flight.Id,
							ns02#JourneyRPH: payload.BuyAllowance_Request.Flights.Flight.JourneyRPH as String default null,
							ns02#MarketingCarrier: payload.BuyAllowance_Request.Flights.Flight.MarketingCarrier,
							ns02#NativeFlightId: payload.BuyAllowance_Request.Flights.Flight.NativeFlightId as String default null,
							ns02#OpenForBoarding: payload.BuyAllowance_Request.Flights.Flight.OpenForBoarding as String default null,
							ns02#OpenForCheckIn: payload.BuyAllowance_Request.Flights.Flight.OpenForCheckIn as String default null,
							ns02#OperatingCarrier: payload.BuyAllowance_Request.Flights.Flight.OperatingCarrier,
							ns02#Origin: payload.BuyAllowance_Request.Flights.Flight.Origin,
							ns02#RequireMultipleAPISDocuments: payload.BuyAllowance_Request.Flights.Flight.RequireMultipleAPISDocuments as String default null,
							ns02#UTCArrivalTime: payload.BuyAllowance_Request.Flights.Flight.UTCArrivalTime as String default null,
							ns02#UTCDepartureTime: payload.BuyAllowance_Request.Flights.Flight.UTCDepartureTime as String default null
						}
					},
					ns01#Passenger: {
						ns02#Active: payload.BuyAllowance_Request.Passenger.Active as String default null,
						ns02#AllowanceRetrieved: payload.BuyAllowance_Request.Passenger.AllowanceRetrieved as String default null,
						ns02#Baggage: {
							ns02#BaggageAllowance: {
								ns02#BagDropId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.BagDropId,
								ns02#BaggageAllowanceTypeId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
								ns02#BaggageItemTypeId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
								ns02#ConsumeItemWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight as String default null,
								ns02#CreatedOn: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.CreatedOn as String default null,
								ns02#FlightId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.FlightId,
								ns02#Id: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.Id,
								ns02#InitialBags: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.InitialBags as String default null,
								ns02#InitialWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.InitialWeight as String default null,
								ns02#MaxSingleItemWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight as String default null,
								ns02#PassengerId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PassengerId as String default null,
								ns02#PoolItems: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PoolItems as String default null,
								ns02#PoolWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PoolWeight as String default null,
								ns02#PurchasedBags: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PurchasedBags as String default null,
								ns02#PurchasedWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PurchasedWeight as String default null,
								ns02#RemainingBags: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.RemainingBags as String default null,
								ns02#RemainingWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.RemainingWeight as String default null,
								ns02#UpdateInitialAllowance: payload.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance as String default null
							},
							ns02#BaggageItems: {
								ns02#BaggageItem: {
									ns02#Active: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Active as String default null,
									ns02#BaggageAllowanceId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageAllowanceId,
									ns02#BaggageItemSubTypeId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeId,
									ns02#BaggageItemSubTypeName: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeName,
									ns02#BaggageItemType: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemType,
									ns02#BaggageItemTypeId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeId,
									ns02#BaggageItemTypeName: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeName,
									ns02#ConsumeAllowance: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.ConsumeAllowance as String default null,
									ns02#CreatedOn: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.CreatedOn as String default null,
									ns02#Dropped: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Dropped as String default null,
									ns02#DroppedTime: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.DroppedTime as String default null,
									ns02#HasNotionalWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.HasNotionalWeight as String default null,
									ns02#Id: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Id,
									ns02#InitialWeight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.InitialWeight as String default null,
									ns02#NativeBaggageId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.NativeBaggageId as String default null,
									ns02#OutOfGauge: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.OutOfGauge as String default null,
									ns02#PassengerId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.PassengerId,
									ns02#Printed: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Printed as String default null,
									ns02#PrintedTime: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.PrintedTime as String default null,
									ns02#Registered: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Registered as String default null,
									ns02#RegisteredTime: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.RegisteredTime as String default null,
									ns02#SessionId: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.SessionId,
									ns02#TagNumber: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.TagNumber as String default null,
									ns02#Weight: payload.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Weight as String default null
								}
							},
							ns02#MaxSingleItemWeight: payload.BuyAllowance_Request.Passenger.Baggage.MaxSingleItemWeight as String default null
						},
						ns02#Boarded: payload.BuyAllowance_Request.Passenger.Boarded as String default null,
						ns02#CheckedIn: payload.BuyAllowance_Request.Passenger.CheckedIn as String default null,
						ns02#ClearanceRequired: payload.BuyAllowance_Request.Passenger.ClearanceRequired as String default null,
						ns02#ClearanceStatus: payload.BuyAllowance_Request.Passenger.ClearanceStatus,
						ns02#ConfirmedDga: payload.BuyAllowance_Request.Passenger.ConfirmedDga as String default null,
						ns02#ConfirmedIdentity: payload.BuyAllowance_Request.Passenger.ConfirmedIdentity as String default null,
						ns02#ConnectingFlightNumber: payload.BuyAllowance_Request.Passenger.ConnectingFlightNumber as String default null,
						ns02#DateOfBirth: payload.BuyAllowance_Request.Passenger.DateOfBirth as String default null,
						ns02#DocumentCheckRequired: payload.BuyAllowance_Request.Passenger.DocumentCheckRequired as String default null,
						ns02#FirstName: payload.BuyAllowance_Request.Passenger.FirstName,
						ns02#Gender: payload.BuyAllowance_Request.Passenger.Gender,
						ns02#Identity: {
							ns02#LastAPIS: {
								ns02#DateOfBirth: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.DateOfBirth as String default null,
								ns02#DocumentExpiryDate: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentExpiryDate as String default null,
								ns02#DocumentIssueDate: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentIssueDate as String default null,
								ns02#DocumentNumber: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentNumber as String default null,
								ns02#DocumentType: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentType,
								ns02#Firstname: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.Firstname,
								ns02#Nationality: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.Nationality,
								ns02#Surname: payload.BuyAllowance_Request.Passenger.Identity.LastAPIS.Surname
							}
						},
						ns02#IsSelectableForBoardingPass: payload.BuyAllowance_Request.Passenger.IsSelectableForBoardingPass as String default null,
						ns02#IsSelected: payload.BuyAllowance_Request.Passenger.IsSelected as String default null,
						ns02#LastName: payload.BuyAllowance_Request.Passenger.LastName,
						ns02#MarketingCarrierCode: payload.BuyAllowance_Request.Passenger.MarketingCarrierCode,
						ns02#NativePassengerId: payload.BuyAllowance_Request.Passenger.NativePassengerId as String default null,
						ns02#PassengerId: payload.BuyAllowance_Request.Passenger.PassengerId,
						ns02#PassengerRPH: payload.BuyAllowance_Request.Passenger.PassengerRPH as String default null,
						ns02#PassengerSequenceNumber: payload.BuyAllowance_Request.Passenger.PassengerSequenceNumber,
						ns02#RequiresCheckin: payload.BuyAllowance_Request.Passenger.RequiresCheckin as String default null,
						ns02#SeatNumber: payload.BuyAllowance_Request.Passenger.SeatNumber,
						ns02#SupportsCheckin: payload.BuyAllowance_Request.Passenger.SupportsCheckin as String default null,
						ns02#Title: payload.BuyAllowance_Request.Passenger.Title
					}
				}
			}
		}
	}
}