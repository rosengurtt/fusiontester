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
					ns02#DepartureAirportCode: attributes.BuyAllowance_Request.DepartureAirportCode,
					ns02#IataAirlineCode: attributes.BuyAllowance_Request.IataAirlineCode,
					ns02#MACAddress: attributes.BuyAllowance_Request.MACAddress,
					ns02#RequestId: attributes.BuyAllowance_Request.RequestId,
					ns02#RequestSourceName: attributes.BuyAllowance_Request.RequestSourceName,
					ns02#RequestType: attributes.BuyAllowance_Request.RequestType,
					ns02#TestRequest: attributes.BuyAllowance_Request.TestRequest,
					ns02#Session: {
						ns02#EndTime: attributes.BuyAllowance_Request.Session.EndTime,
						ns02#KioskId: attributes.BuyAllowance_Request.Session.KioskId,
						ns02#PNR: attributes.BuyAllowance_Request.Session.PNR,
						ns02#Price: attributes.BuyAllowance_Request.Session.Price as String default null,
						ns02#ServiceConfigId: attributes.BuyAllowance_Request.Session.ServiceConfigId,
						ns02#SessionId: attributes.BuyAllowance_Request.Session.SessionId,
						ns02#StartTime: attributes.BuyAllowance_Request.Session.StartTime,
						ns02#Status: attributes.BuyAllowance_Request.Session.Status,
						ns02#UserId: attributes.BuyAllowance_Request.Session.UserId,
						ns02#Weight: attributes.BuyAllowance_Request.Session.Weight
					},
					ns01#AgentName: attributes.BuyAllowance_Request.AgentName,
					ns01#Costs: {
						ns02#Currency: attributes.BuyAllowance_Request.Costs.Currency,
						ns02#ItemList: {
							ns02#ExcessBaggageCost: {
								ns02#AdditionalAllowance: {
									ns02#BagDropId: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.BagDropId,
									ns02#BaggageAllowanceTypeId: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.BaggageAllowanceTypeId,
									ns02#BaggageItemTypeId: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.BaggageItemTypeId,
									ns02#ConsumeItemWeight: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.ConsumeItemWeight as String default null,
									ns02#CreatedOn: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.CreatedOn as String default null,
									ns02#FlightId: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.FlightId,
									ns02#Id: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.Id,
									ns02#InitialBags: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.InitialBags as String default null,
									ns02#InitialWeight: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.InitialWeight as String default null,
									ns02#MaxSingleItemWeight: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.MaxSingleItemWeight as String default null,
									ns02#PassengerId: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PassengerId as String default null,
									ns02#PoolItems: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PoolItems as String default null,
									ns02#PoolWeight: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PoolWeight as String default null,
									ns02#PurchasedBags: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PurchasedBags as String default null,
									ns02#PurchasedWeight: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.PurchasedWeight as String default null,
									ns02#RemainingBags: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.RemainingBags as String default null,
									ns02#RemainingWeight: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.RemainingWeight as String default null,
									ns02#UpdateInitialAllowance: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.AdditionalAllowance.UpdateInitialAllowance as String default null
								},
								ns02#Description: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.Description,
								ns02#Price: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.Price as String default null,
								ns02#Quantity: attributes.BuyAllowance_Request.Costs.ItemList.ExcessBaggageCost.Quantity as String default null
							}
						},
						ns02#PaymentType: attributes.BuyAllowance_Request.Costs.PaymentType,
						ns02#QuoteStatus: attributes.BuyAllowance_Request.Costs.QuoteStatus
					},
					ns01#Flights: {
						ns02#Flight: {
							ns02#ApisRequired: attributes.BuyAllowance_Request.Flights.Flight.ApisRequired as String default null,
							ns02#ArrivalTime: attributes.BuyAllowance_Request.Flights.Flight.ArrivalTime as String default null,
							ns02#ConnectingFlight: attributes.BuyAllowance_Request.Flights.Flight.ConnectingFlight as String default null,
							ns02#DepartureTerminal: attributes.BuyAllowance_Request.Flights.Flight.DepartureTerminal as String default null,
							ns02#DepartureTime: attributes.BuyAllowance_Request.Flights.Flight.DepartureTime as String default null,
							ns02#Destination: attributes.BuyAllowance_Request.Flights.Flight.Destination,
							ns02#FlightNumber: attributes.BuyAllowance_Request.Flights.Flight.FlightNumber as String default null,
							ns02#FlightRPH: attributes.BuyAllowance_Request.Flights.Flight.FlightRPH as String default null,
							ns02#Id: attributes.BuyAllowance_Request.Flights.Flight.Id,
							ns02#JourneyRPH: attributes.BuyAllowance_Request.Flights.Flight.JourneyRPH as String default null,
							ns02#MarketingCarrier: attributes.BuyAllowance_Request.Flights.Flight.MarketingCarrier,
							ns02#NativeFlightId: attributes.BuyAllowance_Request.Flights.Flight.NativeFlightId as String default null,
							ns02#OpenForBoarding: attributes.BuyAllowance_Request.Flights.Flight.OpenForBoarding as String default null,
							ns02#OpenForCheckIn: attributes.BuyAllowance_Request.Flights.Flight.OpenForCheckIn as String default null,
							ns02#OperatingCarrier: attributes.BuyAllowance_Request.Flights.Flight.OperatingCarrier,
							ns02#Origin: attributes.BuyAllowance_Request.Flights.Flight.Origin,
							ns02#RequireMultipleAPISDocuments: attributes.BuyAllowance_Request.Flights.Flight.RequireMultipleAPISDocuments as String default null,
							ns02#UTCArrivalTime: attributes.BuyAllowance_Request.Flights.Flight.UTCArrivalTime as String default null,
							ns02#UTCDepartureTime: attributes.BuyAllowance_Request.Flights.Flight.UTCDepartureTime as String default null
						}
					},
					ns01#Passenger: {
						ns02#Active: attributes.BuyAllowance_Request.Passenger.Active as String default null,
						ns02#AllowanceRetrieved: attributes.BuyAllowance_Request.Passenger.AllowanceRetrieved as String default null,
						ns02#Baggage: {
							ns02#BaggageAllowance: {
								ns02#BagDropId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.BagDropId,
								ns02#BaggageAllowanceTypeId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
								ns02#BaggageItemTypeId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
								ns02#ConsumeItemWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight as String default null,
								ns02#CreatedOn: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.CreatedOn as String default null,
								ns02#FlightId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.FlightId,
								ns02#Id: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.Id,
								ns02#InitialBags: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.InitialBags as String default null,
								ns02#InitialWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.InitialWeight as String default null,
								ns02#MaxSingleItemWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight as String default null,
								ns02#PassengerId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PassengerId as String default null,
								ns02#PoolItems: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PoolItems as String default null,
								ns02#PoolWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PoolWeight as String default null,
								ns02#PurchasedBags: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PurchasedBags as String default null,
								ns02#PurchasedWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.PurchasedWeight as String default null,
								ns02#RemainingBags: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.RemainingBags as String default null,
								ns02#RemainingWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.RemainingWeight as String default null,
								ns02#UpdateInitialAllowance: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance as String default null
							},
							ns02#BaggageItems: {
								ns02#BaggageItem: {
									ns02#Active: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Active as String default null,
									ns02#BaggageAllowanceId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageAllowanceId,
									ns02#BaggageItemSubTypeId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeId,
									ns02#BaggageItemSubTypeName: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemSubTypeName,
									ns02#BaggageItemType: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemType,
									ns02#BaggageItemTypeId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeId,
									ns02#BaggageItemTypeName: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.BaggageItemTypeName,
									ns02#ConsumeAllowance: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.ConsumeAllowance as String default null,
									ns02#CreatedOn: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.CreatedOn as String default null,
									ns02#Dropped: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Dropped as String default null,
									ns02#DroppedTime: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.DroppedTime as String default null,
									ns02#HasNotionalWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.HasNotionalWeight as String default null,
									ns02#Id: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Id,
									ns02#InitialWeight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.InitialWeight as String default null,
									ns02#NativeBaggageId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.NativeBaggageId as String default null,
									ns02#OutOfGauge: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.OutOfGauge as String default null,
									ns02#PassengerId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.PassengerId,
									ns02#Printed: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Printed as String default null,
									ns02#PrintedTime: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.PrintedTime as String default null,
									ns02#Registered: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Registered as String default null,
									ns02#RegisteredTime: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.RegisteredTime as String default null,
									ns02#SessionId: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.SessionId,
									ns02#TagNumber: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.TagNumber as String default null,
									ns02#Weight: attributes.BuyAllowance_Request.Passenger.Baggage.BaggageItems.BaggageItem.Weight as String default null
								}
							},
							ns02#MaxSingleItemWeight: attributes.BuyAllowance_Request.Passenger.Baggage.MaxSingleItemWeight as String default null
						},
						ns02#Boarded: attributes.BuyAllowance_Request.Passenger.Boarded as String default null,
						ns02#CheckedIn: attributes.BuyAllowance_Request.Passenger.CheckedIn as String default null,
						ns02#ClearanceRequired: attributes.BuyAllowance_Request.Passenger.ClearanceRequired as String default null,
						ns02#ClearanceStatus: attributes.BuyAllowance_Request.Passenger.ClearanceStatus,
						ns02#ConfirmedDga: attributes.BuyAllowance_Request.Passenger.ConfirmedDga as String default null,
						ns02#ConfirmedIdentity: attributes.BuyAllowance_Request.Passenger.ConfirmedIdentity as String default null,
						ns02#ConnectingFlightNumber: attributes.BuyAllowance_Request.Passenger.ConnectingFlightNumber as String default null,
						ns02#DateOfBirth: attributes.BuyAllowance_Request.Passenger.DateOfBirth as String default null,
						ns02#DocumentCheckRequired: attributes.BuyAllowance_Request.Passenger.DocumentCheckRequired as String default null,
						ns02#FirstName: attributes.BuyAllowance_Request.Passenger.FirstName,
						ns02#Gender: attributes.BuyAllowance_Request.Passenger.Gender,
						ns02#Identity: {
							ns02#LastAPIS: {
								ns02#DateOfBirth: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.DateOfBirth as String default null,
								ns02#DocumentExpiryDate: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentExpiryDate as String default null,
								ns02#DocumentIssueDate: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentIssueDate as String default null,
								ns02#DocumentNumber: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentNumber as String default null,
								ns02#DocumentType: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.DocumentType,
								ns02#Firstname: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.Firstname,
								ns02#Nationality: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.Nationality,
								ns02#Surname: attributes.BuyAllowance_Request.Passenger.Identity.LastAPIS.Surname
							}
						},
						ns02#IsSelectableForBoardingPass: attributes.BuyAllowance_Request.Passenger.IsSelectableForBoardingPass as String default null,
						ns02#IsSelected: attributes.BuyAllowance_Request.Passenger.IsSelected as String default null,
						ns02#LastName: attributes.BuyAllowance_Request.Passenger.LastName,
						ns02#MarketingCarrierCode: attributes.BuyAllowance_Request.Passenger.MarketingCarrierCode,
						ns02#NativePassengerId: attributes.BuyAllowance_Request.Passenger.NativePassengerId as String default null,
						ns02#PassengerId: attributes.BuyAllowance_Request.Passenger.PassengerId,
						ns02#PassengerRPH: attributes.BuyAllowance_Request.Passenger.PassengerRPH as String default null,
						ns02#PassengerSequenceNumber: attributes.BuyAllowance_Request.Passenger.PassengerSequenceNumber,
						ns02#RequiresCheckin: attributes.BuyAllowance_Request.Passenger.RequiresCheckin as String default null,
						ns02#SeatNumber: attributes.BuyAllowance_Request.Passenger.SeatNumber,
						ns02#SupportsCheckin: attributes.BuyAllowance_Request.Passenger.SupportsCheckin as String default null,
						ns02#Title: attributes.BuyAllowance_Request.Passenger.Title
					}
				}
			}
		}
	}
}