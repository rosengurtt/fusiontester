%dw 2.0
output application/xml skipNullOn = "everywhere"
ns a http://www.w3.org/2005/08/addressing
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
	ns0#Envelope:{
		ns0#Header:{
	          a#Action @(ns0#mustUnderstand: "1"): "http://services.fusion.aero/IFusionService/ActivateBag",
	          a#MessageID: "urn:uuid:e933edc2-19c0-4e4e-87c2-8628bc7bf3b7",
	          a#ReplyTo: {
	          	a#Address: "http://www.w3.org/2005/08/addressing/anonymous"
	          },
	          a#To @(ns0#mustUnderstand: "1"): "http://local.fusion.aero/FusionService.svc"
	     },
	    ns0#Body:{
			ns01#ActivateBag: (payload.*ActivateBag_Request map (i, ind) -> {
				ns01#request: {
					ns02#DepartureAirportCode: i.DepartureAirportCode,
					ns02#IataAirlineCode: i.IataAirlineCode,
					ns02#MACAddress: i.MACAddress,
					ns02#RequestId: i.RequestId,
					ns02#RequestSourceName: i.RequestSourceName,
					ns02#RequestType: i.RequestType,
					ns02#TestRequest: i.TestRequest,
					ns02#Session: (i.Session map (session, sessionindex) -> {
						ns02#EndTime: session.EndTime,
						ns02#KioskId: session.KioskId,
						ns02#PNR: session.PNR,
						ns02#Price: session.Price,
						ns02#ServiceConfigId: session.ServiceConfigId,
						ns02#SessionId: session.SessionId,
						ns02#StartTime: session.StartTime,
						ns02#Status: session.Status,
						ns02#UserId: session.UserId,
						ns02#Weight: session.Weight
					}),
					ns01#BaggageItem: (i.BaggageItem map (baggageItem, baggageItemIndex) -> {
						ns02#Active: baggageItem.Active,
						ns02#BaggageAllowanceId: baggageItem.BaggageAllowanceId,
						ns02#BaggageItemSubTypeId: baggageItem.BaggageItemSubTypeId,
						ns02#BaggageItemType: baggageItem.BaggageItemType,
						ns02#BaggageItemTypeId: baggageItem.BaggageItemTypeId,
						ns02#BaggageItemTypeName: baggageItem.BaggageItemTypeName,
						ns02#ConsumeAllowance: baggageItem.ConsumeAllowance,
						ns02#CreatedOn: baggageItem.CreatedOn,
						ns02#Dropped: baggageItem.Dropped,
						ns02#DroppedTime: baggageItem.DroppedTime,
						ns02#HasNotionalWeight: baggageItem.HasNotionalWeight,
						ns02#Id: baggageItem.Id,
						ns02#InitialWeight: baggageItem.InitialWeight,
						ns02#NativeBaggageId:  baggageItem.NativeBaggageId,
						ns02#OutOfGauge: baggageItem.OutOfGauge,
						ns02#PassengerId: baggageItem.PassengerId,
						ns02#Printed: baggageItem.Printed,
						ns02#PrintedTime: baggageItem.PrintedTime,
						ns02#Registered: baggageItem.Registered,
						ns02#RegisteredTime: baggageItem.RegisteredTime,
						ns02#SessionId: baggageItem.SessionId,
						ns02#TagNumber: baggageItem.TagNumber,
						ns02#Weight: baggageItem.Weight
					}),
					ns01#Flight: (i.Flight map (flight, flightIndex) -> {
						ns02#ApisRequired: flight.ApisRequired,
						ns02#ArrivalTime: flight.ArrivalTime,
						ns02#ConnectingFlight: flight.ConnectingFlight,
						ns02#CustomProperties:{
							ns03#string: flight.CustomProperties.*string
						},
						ns02#DepartureTime: flight.DepartureTime,
						ns02#Destination: flight.Destination,
						ns02#EstimatedDepartureTime: flight.EstimatedDepartureTime,
						ns02#FlightNumber: flight.FlightNumber,
						ns02#FlightRPH: flight.FlightRPH,
						ns02#Id: flight.Id,
						ns02#JourneyRPH: flight.JourneyRPH,
						ns02#MarketingCarrier: flight.MarketingCarrier,
						ns02#OpenForBoarding: flight.OpenForBoarding,
						ns02#OpenForCheckIn: flight.OpenForCheckIn,
						ns02#OperatingCarrier: flight.OperatingCarrier,
						ns02#Origin: flight.Origin,
						ns02#RequireMultipleAPISDocuments: flight.RequireMultipleAPISDocuments,
						ns02#UTCArrivalTime: flight.UTCArrivalTime,
						ns02#UTCDepartureTime: flight.UTCDepartureTime,
						ns02#UTCEstimatedDepartureTime: flight.UTCEstimatedDepartureTime
					}),
					ns01#Passenger: (i.Passenger map (passenger, passengerIndex) -> {
						ns02#Active: passenger.Active,
						ns02#AllowanceRetrieved: passenger.AllowanceRetrieved,
						ns02#Baggage: {
							ns02#BaggageAllowance: (passenger.Baggage.BaggageAllowance map (baggageAllowance, BaggageAllowanceindex) -> {
								ns02#BagDropId: baggageAllowance.BagDropId,
								ns02#BaggageAllowanceTypeId: baggageAllowance.BaggageAllowanceTypeId,
								ns02#BaggageItemTypeId: baggageAllowance.BaggageItemTypeId,
								ns02#ConsumeItemWeight: baggageAllowance.ConsumeItemWeight,
								ns02#CreatedOn: baggageAllowance.CreatedOn,
								ns02#FlightId: baggageAllowance.FlightId,
								ns02#Id: baggageAllowance.Id,
								ns02#InitialBags: baggageAllowance.InitialBags,
								ns02#InitialWeight: baggageAllowance.InitialWeight,
								ns02#MaxSingleItemWeight: baggageAllowance.MaxSingleItemWeight,
								ns02#PassengerId: baggageAllowance.PassengerId,
								ns02#PoolItems: baggageAllowance.PoolItems,
								ns02#PoolWeight: baggageAllowance.PoolWeight,
								ns02#PurchasedBags: baggageAllowance.PurchasedBags,
								ns02#PurchasedWeight: baggageAllowance.PurchasedWeight,
								ns02#RemainingBags: baggageAllowance.RemainingBags,
								ns02#RemainingWeight: baggageAllowance.RemainingWeight,
								ns02#UpdateInitialAllowance: baggageAllowance.UpdateInitialAllowance
							}),
							ns02#BaggageItems: {
								ns02#BaggageItem: (passenger.Baggage.BaggageItems.*BaggageItem map (baggageItem, bagaggeItemIndex) -> {
									ns02#BaggageAllowanceId: baggageItem.BaggageAllowanceId,
									ns02#BaggageItemSubTypeId: baggageItem.BaggageItemSubTypeId,
									ns02#BaggageItemSubTypeName: baggageItem.BaggageItemSubTypeName,
									ns02#BaggageItemType: baggageItem.BaggageItemType,
									ns02#BaggageItemTypeId: baggageItem.BaggageItemTypeId,
									ns02#BaggageItemTypeName: baggageItem.BaggageItemTypeName,
									ns02#ConsumeAllowance: baggageItem.ConsumeAllowance,
									ns02#CreatedOn: baggageItem.CreatedOn,
									ns02#Dropped: baggageItem.Dropped,
									ns02#DroppedTime: baggageItem.DroppedTime,
									ns02#HasNotionalWeight: baggageItem.HasNotionalWeight,
									ns02#Id: baggageItem.Id,
									ns02#InitialWeight: baggageItem.InitialWeight,
									ns02#NativeBaggageId: baggageItem.NativeBaggageId,
									ns02#OutOfGauge: baggageItem.OutOfGauge,
									ns02#PassengerId: baggageItem.PassengerId,
									ns02#Printed: baggageItem.Printed,
									ns02#PrintedTime: baggageItem.PrintedTime,
									ns02#Registered: baggageItem.Registered,
									ns02#RegisteredTime: baggageItem.RegisteredTime,
									ns02#SessionId: baggageItem.SessionId,
									ns02#TagNumber: baggageItem.TagNumber,
									ns02#Weight: baggageItem.Weight
								})
							},
							ns02#MaxSingleItemWeight: passenger.Baggage.MaxSingleItemWeight
						},
						ns02#Boarded: passenger.Boarded,
						ns02#CheckedIn: passenger.CheckedIn,
						ns02#ClearanceRequired: passenger.ClearanceRequired,
						ns02#ClearanceStatus: passenger.ClearanceStatus,
						ns02#ConfirmedDga: passenger.ConfirmedDga,
						ns02#ConfirmedIdentity: passenger.ConfirmedIdentity,
						ns02#ConnectingFlightNumber: passenger.ConnectingFlightNumber,
						ns02#CustomProperties:{
							ns03#string: passenger.CustomProperties.*string
						},
						ns02#DateOfBirth: passenger.DateOfBirth,
						ns02#DocumentCheckRequired: passenger.DocumentCheckRequired,
						ns02#FirstName: passenger.FirstName,
						ns02#IsSelectableForBoardingPass: passenger.IsSelectableForBoardingPass,
						ns02#IsSelected: passenger.IsSelected,
						ns02#LastName: passenger.LastName,
						ns02#MarketingCarrierCode: passenger.MarketingCarrierCode,
						ns02#NativePassengerId: passenger.NativePassengerId,
						ns02#PassengerId: passenger.PassengerId,
						ns02#PassengerRPH: passenger.PassengerRPH,
						ns02#PassengerSequenceNumber: passenger.PassengerSequenceNumber,
						ns02#PaxType: passenger.PaxType,
						ns02#RequiresCheckin: passenger.RequiresCheckin,
						ns02#SeatNumber: passenger.SeatNumber,
						ns02#SupportsCheckin: passenger.SupportsCheckin,
						ns02#Title: passenger.Title
					}),
					ns01#Pnr: i.Pnr
				}
			})
		}
	}
}