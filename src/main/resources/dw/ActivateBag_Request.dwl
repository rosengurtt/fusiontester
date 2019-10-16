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
			ns01#ActivateBag: {
				ns01#request: {
					ns02#DepartureAirportCode: payload.ActivateBag_Request.DepartureAirportCode,
					ns02#IataAirlineCode: payload.ActivateBag_Request.IataAirlineCode,
					ns02#MACAddress: payload.ActivateBag_Request.MACAddress,
					ns02#RequestId: payload.ActivateBag_Request.RequestId,
					ns02#RequestSourceName: payload.ActivateBag_Request.RequestSourceName,
					ns02#RequestType: payload.ActivateBag_Request.RequestType,
					ns02#TestRequest: payload.ActivateBag_Request.TestRequest,
					ns02#Session: {
						ns02#EndTime: payload.ActivateBag_Request.Session.EndTime,
						ns02#KioskId: payload.ActivateBag_Request.Session.KioskId,
						ns02#PNR: payload.ActivateBag_Request.Session.PNR,
						ns02#Price: payload.ActivateBag_Request.Session.Price,
						ns02#ServiceConfigId: payload.ActivateBag_Request.Session.ServiceConfigId,
						ns02#SessionId: payload.ActivateBag_Request.Session.SessionId,
						ns02#StartTime: payload.ActivateBag_Request.Session.StartTime,
						ns02#Status: payload.ActivateBag_Request.Session.Status,
						ns02#UserId: payload.ActivateBag_Request.Session.UserId,
						ns02#Weight: payload.ActivateBag_Request.Session.Weight
					},
					ns01#BaggageItem: {
						ns02#Active: payload.ActivateBag_Request.BaggageItem.Active,
						ns02#BaggageAllowanceId: payload.ActivateBag_Request.BaggageItem.BaggageAllowanceId,
						ns02#BaggageItemSubTypeId: payload.ActivateBag_Request.BaggageItem.BaggageItemSubTypeId,
						ns02#BaggageItemType: payload.ActivateBag_Request.BaggageItem.BaggageItemType,
						ns02#BaggageItemTypeId: payload.ActivateBag_Request.BaggageItem.BaggageItemTypeId,
						ns02#BaggageItemTypeName: payload.ActivateBag_Request.BaggageItem.BaggageItemTypeName,
						ns02#ConsumeAllowance: payload.ActivateBag_Request.BaggageItem.ConsumeAllowance,
						ns02#CreatedOn: payload.ActivateBag_Request.BaggageItem.CreatedOn,
						ns02#Dropped: payload.ActivateBag_Request.BaggageItem.Dropped,
						ns02#DroppedTime: payload.ActivateBag_Request.BaggageItem.DroppedTime,
						ns02#HasNotionalWeight: payload.ActivateBag_Request.BaggageItem.HasNotionalWeight,
						ns02#Id: payload.ActivateBag_Request.BaggageItem.Id,
						ns02#InitialWeight: payload.ActivateBag_Request.BaggageItem.InitialWeight,
						ns02#NativeBaggageId:  payload.ActivateBag_Request.BaggageItem.NativeBaggageId,
						ns02#OutOfGauge: payload.ActivateBag_Request.BaggageItem.OutOfGauge,
						ns02#PassengerId: payload.ActivateBag_Request.BaggageItem.PassengerId,
						ns02#Printed: payload.ActivateBag_Request.BaggageItem.Printed,
						ns02#PrintedTime: payload.ActivateBag_Request.BaggageItem.PrintedTime,
						ns02#Registered: payload.ActivateBag_Request.BaggageItem.Registered,
						ns02#RegisteredTime: payload.ActivateBag_Request.BaggageItem.RegisteredTime,
						ns02#SessionId: payload.ActivateBag_Request.BaggageItem.SessionId,
						ns02#TagNumber: payload.ActivateBag_Request.BaggageItem.TagNumber,
						ns02#Weight: payload.ActivateBag_Request.BaggageItem.Weight
					},
					ns01#Flight: {
						ns02#ApisRequired: payload.ActivateBag_Request.Flight.ApisRequired,
						ns02#ArrivalTime: payload.ActivateBag_Request.Flight.ArrivalTime,
						ns02#ConnectingFlight: payload.ActivateBag_Request.Flight.ConnectingFlight,
						ns02#CustomProperties:{
							ns03#string: payload.ActivateBag_Request.Flight.CustomProperties.*string
						},
						ns02#DepartureTime: payload.ActivateBag_Request.Flight.DepartureTime,
						ns02#Destination: payload.ActivateBag_Request.Flight.Destination,
						ns02#EstimatedDepartureTime: payload.ActivateBag_Request.Flight.EstimatedDepartureTime,
						ns02#FlightNumber: payload.ActivateBag_Request.Flight.FlightNumber,
						ns02#FlightRPH: payload.ActivateBag_Request.Flight.FlightRPH,
						ns02#Id: payload.ActivateBag_Request.Flight.Id,
						ns02#JourneyRPH: payload.ActivateBag_Request.Flight.JourneyRPH,
						ns02#MarketingCarrier: payload.ActivateBag_Request.Flight.MarketingCarrier,
						ns02#OpenForBoarding: payload.ActivateBag_Request.Flight.OpenForBoarding,
						ns02#OpenForCheckIn: payload.ActivateBag_Request.Flight.OpenForCheckIn,
						ns02#OperatingCarrier: payload.ActivateBag_Request.Flight.OperatingCarrier,
						ns02#Origin: payload.ActivateBag_Request.Flight.Origin,
						ns02#RequireMultipleAPISDocuments: payload.ActivateBag_Request.Flight.RequireMultipleAPISDocuments,
						ns02#UTCArrivalTime: payload.ActivateBag_Request.Flight.UTCArrivalTime,
						ns02#UTCDepartureTime: payload.ActivateBag_Request.Flight.UTCDepartureTime,
						ns02#UTCEstimatedDepartureTime: payload.ActivateBag_Request.Flight.UTCEstimatedDepartureTime
					},
					ns01#Passenger: {
						ns02#Active: payload.ActivateBag_Request.Passenger.Active,
						ns02#AllowanceRetrieved: payload.ActivateBag_Request.Passenger.AllowanceRetrieved,
						ns02#Baggage: {
							ns02#BaggageAllowance: {
								ns02#BagDropId: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.BagDropId,
								ns02#BaggageAllowanceTypeId: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
								ns02#BaggageItemTypeId: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
								ns02#ConsumeItemWeight: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight,
								ns02#CreatedOn: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.CreatedOn,
								ns02#FlightId: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.FlightId,
								ns02#Id: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.Id,
								ns02#InitialBags: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.InitialBags,
								ns02#InitialWeight: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.InitialWeight,
								ns02#MaxSingleItemWeight: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight,
								ns02#PassengerId: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.PassengerId,
								ns02#PoolItems: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.PoolItems,
								ns02#PoolWeight: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.PoolWeight,
								ns02#PurchasedBags: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.PurchasedBags,
								ns02#PurchasedWeight: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.PurchasedWeight,
								ns02#RemainingBags: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.RemainingBags,
								ns02#RemainingWeight: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.RemainingWeight,
								ns02#UpdateInitialAllowance: payload.ActivateBag_Request.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance
							},
							ns02#BaggageItems: {
								ns02#BaggageItem: (payload.ActivateBag_Request.Passenger.Baggage.BaggageItems.*BaggageItem map {
									ns02#BaggageAllowanceId: $.BaggageAllowanceId,
									ns02#BaggageItemSubTypeId: $.BaggageItemSubTypeId,
									ns02#BaggageItemSubTypeName: $.BaggageItemSubTypeName,
									ns02#BaggageItemType: $.BaggageItemType,
									ns02#BaggageItemTypeId: $.BaggageItemTypeId,
									ns02#BaggageItemTypeName: $.BaggageItemTypeName,
									ns02#ConsumeAllowance: $.ConsumeAllowance,
									ns02#CreatedOn: $.CreatedOn,
									ns02#Dropped: $.Dropped,
									ns02#DroppedTime: $.DroppedTime,
									ns02#HasNotionalWeight: $.HasNotionalWeight,
									ns02#Id: $.Id,
									ns02#InitialWeight: $.InitialWeight,
									ns02#NativeBaggageId: $.NativeBaggageId,
									ns02#OutOfGauge: $.OutOfGauge,
									ns02#PassengerId: $.PassengerId,
									ns02#Printed: $.Printed,
									ns02#PrintedTime: $.PrintedTime,
									ns02#Registered: $.Registered,
									ns02#RegisteredTime: $.RegisteredTime,
									ns02#SessionId: $.SessionId,
									ns02#TagNumber: $.TagNumber,
									ns02#Weight: $.Weight
								})
							},
							ns02#MaxSingleItemWeight: payload.ActivateBag_Request.Passenger.Baggage.MaxSingleItemWeight
						},
						ns02#Boarded: payload.ActivateBag_Request.Passenger.Boarded,
						ns02#CheckedIn: payload.ActivateBag_Request.Passenger.CheckedIn,
						ns02#ClearanceRequired: payload.ActivateBag_Request.Passenger.ClearanceRequired,
						ns02#ClearanceStatus: payload.ActivateBag_Request.Passenger.ClearanceStatus,
						ns02#ConfirmedDga: payload.ActivateBag_Request.Passenger.ConfirmedDga,
						ns02#ConfirmedIdentity: payload.ActivateBag_Request.Passenger.ConfirmedIdentity,
						ns02#ConnectingFlightNumber: payload.ActivateBag_Request.Passenger.ConnectingFlightNumber,
						ns02#CustomProperties:{
							ns03#string: payload.ActivateBag_Request.Passenger.CustomProperties.*string
						},
						ns02#DateOfBirth: payload.ActivateBag_Request.Passenger.DateOfBirth,
						ns02#DocumentCheckRequired: payload.ActivateBag_Request.Passenger.DocumentCheckRequired,
						ns02#FirstName: payload.ActivateBag_Request.Passenger.FirstName,
						ns02#IsSelectableForBoardingPass: payload.ActivateBag_Request.Passenger.IsSelectableForBoardingPass,
						ns02#IsSelected: payload.ActivateBag_Request.Passenger.IsSelected,
						ns02#LastName: payload.ActivateBag_Request.Passenger.LastName,
						ns02#MarketingCarrierCode: payload.ActivateBag_Request.Passenger.MarketingCarrierCode,
						ns02#NativePassengerId: payload.ActivateBag_Request.Passenger.NativePassengerId,
						ns02#PassengerId: payload.ActivateBag_Request.Passenger.PassengerId,
						ns02#PassengerRPH: payload.ActivateBag_Request.Passenger.PassengerRPH,
						ns02#PassengerSequenceNumber: payload.ActivateBag_Request.Passenger.PassengerSequenceNumber,
						ns02#PaxType: payload.ActivateBag_Request.Passenger.PaxType,
						ns02#RequiresCheckin: payload.ActivateBag_Request.Passenger.RequiresCheckin,
						ns02#SeatNumber: payload.ActivateBag_Request.Passenger.SeatNumber,
						ns02#SupportsCheckin: payload.ActivateBag_Request.Passenger.SupportsCheckin,
						ns02#Title: payload.ActivateBag_Request.Passenger.Title
					},
					ns01#Pnr: payload.ActivateBag_Request.Pnr
				}
			}
		}
	}
}