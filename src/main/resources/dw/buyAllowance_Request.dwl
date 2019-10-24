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
				ns01#request: (payload.*BuyAllowance_Request map (i, ind) ->  {
					ns02#DepartureAirportCode: i.DepartureAirportCode,
					ns02#IataAirlineCode: i.IataAirlineCode,
					ns02#MACAddress: i.MACAddress,
					ns02#RequestId: i.RequestId,
					ns02#RequestSourceName: i.RequestSourceName,
					ns02#RequestType: i.RequestType,
					ns02#TestRequest: i.TestRequest,
					ns02#Session: {
						ns02#EndTime: i.Session.EndTime,
						ns02#KioskId: i.Session.KioskId,
						ns02#PNR: i.Session.PNR,
						ns02#Price: i.Session.Price,
						ns02#ServiceConfigId: i.Session.ServiceConfigId,
						ns02#SessionId: i.Session.SessionId,
						ns02#StartTime: i.Session.StartTime,
						ns02#Status: i.Session.Status,
						ns02#UserId: i.Session.UserId,
						ns02#Weight: i.Session.Weight
					},
					ns01#AgentName: i.AgentName,
					ns01#Costs: {
						ns02#Currency: i.Costs.Currency,
						ns02#ItemList: {
							ns02#ExcessBaggageCost: {
								ns02#AdditionalAllowance: (i.Costs.ItemList.*ExcessBaggageCost.AdditionalAllowance map (additionalAllowance, addAllInd) -> {
									ns02#BagDropId: additionalAllowance.BagDropId,
									ns02#BaggageAllowanceTypeId: additionalAllowance.BaggageAllowanceTypeId,
									ns02#BaggageItemTypeId: additionalAllowance.BaggageItemTypeId,
									ns02#ConsumeItemWeight: additionalAllowance.ConsumeItemWeight,
									ns02#CreatedOn: additionalAllowance.CreatedOn,
									ns02#FlightId: additionalAllowance.FlightId,
									ns02#Id: additionalAllowance.Id,
									ns02#InitialBags: additionalAllowance.InitialBags,
									ns02#InitialWeight: additionalAllowance.InitialWeight,
									ns02#MaxSingleItemWeight: additionalAllowance.MaxSingleItemWeight,
									ns02#PassengerId: additionalAllowance.PassengerId,
									ns02#PoolItems: additionalAllowance.PoolItems,
									ns02#PoolWeight: additionalAllowance.PoolWeight,
									ns02#PurchasedBags: additionalAllowance.PurchasedBags,
									ns02#PurchasedWeight: additionalAllowance.PurchasedWeight,
									ns02#RemainingBags: additionalAllowance.RemainingBags,
									ns02#RemainingWeight: additionalAllowance.RemainingWeight,
									ns02#UpdateInitialAllowance: additionalAllowance.UpdateInitialAllowance
								}),
								ns02#Description: i.Costs.ItemList.ExcessBaggageCost.Description,
								ns02#Price: i.Costs.ItemList.ExcessBaggageCost.Price,
								ns02#Quantity: i.Costs.ItemList.ExcessBaggageCost.Quantity
							}
						},
						ns02#PaymentType: i.Costs.PaymentType,
						ns02#QuoteStatus: i.Costs.QuoteStatus
					},
					ns01#Flights: {
						ns02#Flight: (i.Flights.*Flight map (flight, flightInd) -> {
							ns02#ApisRequired: flight.ApisRequired,
							ns02#ArrivalTime: flight.ArrivalTime,
							ns02#ConnectingFlight: flight.ConnectingFlight,
							ns02#DepartureTerminal: flight.DepartureTerminal,
							ns02#DepartureTime: flight.DepartureTime,
							ns02#Destination: flight.Destination,
							ns02#FlightNumber: flight.FlightNumber,
							ns02#FlightRPH: flight.FlightRPH,
							ns02#Id: flight.Id,
							ns02#JourneyRPH: flight.JourneyRPH,
							ns02#MarketingCarrier: flight.MarketingCarrier,
							ns02#NativeFlightId: flight.NativeFlightId,
							ns02#OpenForBoarding: flight.OpenForBoarding,
							ns02#OpenForCheckIn: flight.OpenForCheckIn,
							ns02#OperatingCarrier: flight.OperatingCarrier,
							ns02#Origin: flight.Origin,
							ns02#RequireMultipleAPISDocuments: flight.RequireMultipleAPISDocuments,
							ns02#UTCArrivalTime: flight.UTCArrivalTime,
							ns02#UTCDepartureTime: flight.UTCDepartureTime
						})
					},
					ns01#Passenger: (i.*Passenger map (passenger, indPass) -> {
						ns02#Active: passenger.Active,
						ns02#AllowanceRetrieved: passenger.AllowanceRetrieved,
						ns02#Baggage: (i.*Bagagge map (bagagge, in) -> {
							ns02#BaggageAllowance: (bagagge.*BaggageAllowance map (bagaggeAllowance, index) -> {
								ns02#BagDropId: bagaggeAllowance.BagDropId,
								ns02#BaggageAllowanceTypeId: bagaggeAllowance.BaggageAllowanceTypeId,
								ns02#BaggageItemTypeId: bagaggeAllowance.BaggageItemTypeId,
								ns02#ConsumeItemWeight: bagaggeAllowance.ConsumeItemWeight,
								ns02#CreatedOn: bagaggeAllowance.CreatedOn,
								ns02#FlightId: bagaggeAllowance.FlightId,
								ns02#Id: bagaggeAllowance.Id,
								ns02#InitialBags: bagaggeAllowance.InitialBags,
								ns02#InitialWeight: bagaggeAllowance.InitialWeight,
								ns02#MaxSingleItemWeight: bagaggeAllowance.MaxSingleItemWeight,
								ns02#PassengerId: bagaggeAllowance.PassengerId,
								ns02#PoolItems: bagaggeAllowance.PoolItems,
								ns02#PoolWeight: bagaggeAllowance.PoolWeight,
								ns02#PurchasedBags: bagaggeAllowance.PurchasedBags,
								ns02#PurchasedWeight: bagaggeAllowance.PurchasedWeight,
								ns02#RemainingBags: bagaggeAllowance.RemainingBags,
								ns02#RemainingWeight: bagaggeAllowance.RemainingWeight,
								ns02#UpdateInitialAllowance: bagaggeAllowance.UpdateInitialAllowance
							}),
							ns02#BaggageItems: {
								ns02#BaggageItem: (bagagge.BaggageItems.*BaggageItem map (bagaggeItem, ind) -> {
									ns02#Active: bagaggeItem.Active,
									ns02#BaggageAllowanceId: bagaggeItem.BaggageAllowanceId,
									ns02#BaggageItemSubTypeId: bagaggeItem.BaggageItemSubTypeId,
									ns02#BaggageItemSubTypeName: bagaggeItem.BaggageItemSubTypeName,
									ns02#BaggageItemType: bagaggeItem.BaggageItemType,
									ns02#BaggageItemTypeId: bagaggeItem.BaggageItemTypeId,
									ns02#BaggageItemTypeName: bagaggeItem.BaggageItemTypeName,
									ns02#ConsumeAllowance: bagaggeItem.ConsumeAllowance,
									ns02#CreatedOn: bagaggeItem.CreatedOn,
									ns02#Dropped: bagaggeItem.Dropped,
									ns02#DroppedTime: bagaggeItem.DroppedTime,
									ns02#HasNotionalWeight: bagaggeItem.HasNotionalWeight,
									ns02#Id: bagaggeItem.Id,
									ns02#InitialWeight: bagaggeItem.InitialWeight,
									ns02#NativeBaggageId: bagaggeItem.NativeBaggageId,
									ns02#OutOfGauge: bagaggeItem.OutOfGauge,
									ns02#PassengerId: bagaggeItem.PassengerId,
									ns02#Printed: bagaggeItem.Printed,
									ns02#PrintedTime: bagaggeItem.PrintedTime,
									ns02#Registered: bagaggeItem.Registered,
									ns02#RegisteredTime: bagaggeItem.RegisteredTime,
									ns02#SessionId: bagaggeItem.SessionId,
									ns02#TagNumber: bagaggeItem.TagNumber,
									ns02#Weight: bagaggeItem.Weight
								})
							},
							ns02#MaxSingleItemWeight: bagagge.MaxSingleItemWeight
						}),
						ns02#Boarded: passenger.Boarded,
						ns02#CheckedIn: passenger.CheckedIn,
						ns02#ClearanceRequired: passenger.ClearanceRequired,
						ns02#ClearanceStatus: passenger.ClearanceStatus,
						ns02#ConfirmedDga: passenger.ConfirmedDga,
						ns02#ConfirmedIdentity: passenger.ConfirmedIdentity,
						ns02#ConnectingFlightNumber: passenger.ConnectingFlightNumber,
						ns02#DateOfBirth: passenger.DateOfBirth,
						ns02#DocumentCheckRequired: passenger.DocumentCheckRequired,
						ns02#FirstName: passenger.FirstName,
						ns02#Gender: passenger.Gender,
						ns02#Identity: {
							ns02#LastAPIS: (passenger.Identity.*LastAPIS map (lastApis, lastApisIndex) -> {
								ns02#DateOfBirth: lastApis.DateOfBirth,
								ns02#DocumentExpiryDate: lastApis.DocumentExpiryDate,
								ns02#DocumentIssueDate: lastApis.DocumentIssueDate,
								ns02#DocumentNumber: lastApis.DocumentNumber,
								ns02#DocumentType: lastApis.DocumentType,
								ns02#Firstname: lastApis.Firstname,
								ns02#Nationality: lastApis.Nationality,
								ns02#Surname: lastApis.Surname
							})
						},
						ns02#IsSelectableForBoardingPass: passenger.IsSelectableForBoardingPass,
						ns02#IsSelected: passenger.IsSelected,
						ns02#LastName: passenger.LastName,
						ns02#MarketingCarrierCode: passenger.MarketingCarrierCode,
						ns02#NativePassengerId: passenger.NativePassengerId,
						ns02#PassengerId: passenger.PassengerId,
						ns02#PassengerRPH: passenger.PassengerRPH,
						ns02#PassengerSequenceNumber: passenger.PassengerSequenceNumber,
						ns02#RequiresCheckin: passenger.RequiresCheckin,
						ns02#SeatNumber: passenger.SeatNumber,
						ns02#SupportsCheckin: passenger.SupportsCheckin,
						ns02#Title: passenger.Title
					})
				})
			}
		}
	}
}