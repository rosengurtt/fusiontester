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
			a#Action @(ns0#mustUnderstand: "1"): "http://services.fusion.aero/IFusionService/GetBagLicensePlate",
			a#MessageID: "urn:uuid:e933edc2-19c0-4e4e-87c2-8628bc7bf3b7",
			a#ReplyTo: {
				a#Address: "http://www.w3.org/2005/08/addressing/anonymous"
			},
			a#To @(ns0#mustUnderstand: "1"): "http://local.fusion.aero/FusionService.svc"
		},
		ns0#Body: {
			ns01#GetBagLicensePlate: {
				ns01#request: {
					ns02#DepartureAirportCode: payload.GetBagLicensePlate_Request.DepartureAirportCode,
					ns02#IataAirlineCode: payload.GetBagLicensePlate_Request.IataAirlineCode,
					ns02#MACAddress: payload.GetBagLicensePlate_Request.MACAddress,
					ns02#RequestId: payload.GetBagLicensePlate_Request.RequestId,
					ns02#RequestSourceName: payload.GetBagLicensePlate_Request.RequestSourceName,
					ns02#RequestType: payload.GetBagLicensePlate_Request.RequestType,
					ns02#TestRequest: payload.GetBagLicensePlate_Request.TestRequest,
					ns02#Session: {
						ns02#EndTime: payload.GetBagLicensePlate_Request.Session.EndTime,
						ns02#KioskId: payload.GetBagLicensePlate_Request.Session.KioskId,
						ns02#PNR: payload.GetBagLicensePlate_Request.Session.PNR,
						ns02#Price: payload.GetBagLicensePlate_Request.Session.Price,
						ns02#ServiceConfigId: payload.GetBagLicensePlate_Request.Session.ServiceConfigId,
						ns02#SessionId: payload.GetBagLicensePlate_Request.Session.SessionId,
						ns02#StartTime: payload.GetBagLicensePlate_Request.Session.StartTime as String default null,
						ns02#Status: payload.GetBagLicensePlate_Request.Session.Status,
						ns02#UserId: payload.GetBagLicensePlate_Request.Session.UserId,
						ns02#Weight: payload.GetBagLicensePlate_Request.Session.Weight as String default null
					},
					ns01#ActivateBagTag: payload.GetBagLicensePlate_Request.ActivateBagTag,
					ns01#BagWeight: payload.GetBagLicensePlate_Request.BagWeight as String,
					ns01#BaggageItem: {
						ns02#Active: payload.GetBagLicensePlate_Request.BaggageItem.Active,
						ns02#BaggageAllowanceId: payload.GetBagLicensePlate_Request.BaggageItem.BaggageAllowanceId,
						ns02#BaggageItemSubTypeId: payload.GetBagLicensePlate_Request.BaggageItem.BaggageItemSubTypeId,
						ns02#BaggageItemType: payload.GetBagLicensePlate_Request.BaggageItem.BaggageItemType,
						ns02#BaggageItemTypeId: payload.GetBagLicensePlate_Request.BaggageItem.BaggageItemTypeId,
						ns02#BaggageItemTypeName: payload.GetBagLicensePlate_Request.BaggageItem.BaggageItemTypeName,
						ns02#ConsumeAllowance: payload.GetBagLicensePlate_Request.BaggageItem.ConsumeAllowance,
						ns02#CreatedOn: payload.GetBagLicensePlate_Request.BaggageItem.CreatedOn,
						ns02#Dropped: payload.GetBagLicensePlate_Request.BaggageItem.Dropped,
						ns02#DroppedTime: payload.GetBagLicensePlate_Request.BaggageItem.DroppedTime as String default null,
						ns02#HasNotionalWeight: payload.GetBagLicensePlate_Request.BaggageItem.HasNotionalWeight,
						ns02#Id: payload.GetBagLicensePlate_Request.BaggageItem.Id,
						ns02#InitialWeight: payload.GetBagLicensePlate_Request.BaggageItem.InitialWeight,
						ns02#NativeBaggageId: payload.GetBagLicensePlate_Request.BaggageItem.NativeBaggageId,
						ns02#OutOfGauge: payload.GetBagLicensePlate_Request.BaggageItem.OutOfGauge,
						ns02#PassengerId: payload.GetBagLicensePlate_Request.BaggageItem.PassengerId,
						ns02#Printed: payload.GetBagLicensePlate_Request.BaggageItem.Printed,
						ns02#PrintedTime: payload.GetBagLicensePlate_Request.BaggageItem.PrintedTime as String default null,
						ns02#Registered: payload.GetBagLicensePlate_Request.BaggageItem.Registered,
						ns02#RegisteredTime: payload.GetBagLicensePlate_Request.BaggageItem.RegisteredTime as String default null,
						ns02#SessionId: payload.GetBagLicensePlate_Request.BaggageItem.SessionId,
						ns02#Weight: payload.GetBagLicensePlate_Request.BaggageItem.Weight as String default null
					},
					ns01#BaggageItemType: payload.GetBagLicensePlate_Request.BaggageItemType,
					ns01#ClearVisaAlert: payload.GetBagLicensePlate_Request.ClearVisaAlert,
					ns01#ExcessBaggageCost: {
						ns02#PaymentType: payload.GetBagLicensePlate_Request.ExcessBaggageCost.PaymentType,
						ns02#QuoteStatus: payload.GetBagLicensePlate_Request.ExcessBaggageCost.QuoteStatus
					},
					ns01#Flight: {
						ns02#ApisRequired: payload.GetBagLicensePlate_Request.Flight.ApisRequired,
						ns02#ArrivalTime: payload.GetBagLicensePlate_Request.Flight.ArrivalTime as String default null,
						ns02#ConnectingFlight: payload.GetBagLicensePlate_Request.Flight.ConnectingFlight as String default null,
						ns02#DepartureTerminal: payload.GetBagLicensePlate_Request.Flight.DepartureTerminal default null,
						ns02#DepartureTime: payload.GetBagLicensePlate_Request.Flight.DepartureTime as String default null,
						ns02#Destination: payload.GetBagLicensePlate_Request.Flight.Destination,
						ns02#FlightNumber: payload.GetBagLicensePlate_Request.Flight.FlightNumber as String default null,
						ns02#FlightRPH: payload.GetBagLicensePlate_Request.Flight.FlightRPH,
						ns02#Id: payload.GetBagLicensePlate_Request.Flight.Id,
						ns02#JourneyRPH: payload.GetBagLicensePlate_Request.Flight.JourneyRPH,
						ns02#MarketingCarrier: payload.GetBagLicensePlate_Request.Flight.MarketingCarrier,
						ns02#NativeFlightId: payload.GetBagLicensePlate_Request.Flight.NativeFlightId as String default null,
						ns02#OpenForBoarding: payload.GetBagLicensePlate_Request.Flight.OpenForBoarding,
						ns02#OpenForCheckIn: payload.GetBagLicensePlate_Request.Flight.OpenForCheckIn,
						ns02#OperatingCarrier: payload.GetBagLicensePlate_Request.Flight.OperatingCarrier,
						ns02#Origin: payload.GetBagLicensePlate_Request.Flight.Origin,
						ns02#RequireMultipleAPISDocuments: payload.GetBagLicensePlate_Request.Flight.RequireMultipleAPISDocuments,
						ns02#UTCArrivalTime: payload.GetBagLicensePlate_Request.Flight.UTCArrivalTime as String default null,
						ns02#UTCDepartureTime: payload.GetBagLicensePlate_Request.Flight.UTCDepartureTime as String default null
					},
					ns01#Flights:  {
						ns02#Flight: (payload.GetBagLicensePlate_Request.Flights.*Flight map {
							ns02#ApisRequired: $.ApisRequired as String,
							ns02#ArrivalTime: $.ArrivalTime as String default null,
							ns02#ConnectingFlight: $.ConnectingFlight as String default null,
							ns02#DepartureTerminal: $.DepartureTerminal as String default null,
							ns02#DepartureTime: $.DepartureTime as String default null,
							ns02#Destination: $.Destination,
							ns02#FlightNumber: $.FlightNumber as String default null,
							ns02#FlightRPH: $.FlightRPH as String,
							ns02#Id: $.Id,
							ns02#JourneyRPH: $.JourneyRPH as String,
							ns02#MarketingCarrier: $.MarketingCarrier,
							ns02#NativeFlightId: $.NativeFlightId as String default null,
							ns02#OpenForBoarding: $.OpenForBoarding as String default null,
							ns02#OpenForCheckIn: $.OpenForCheckIn as String default null,
							ns02#OperatingCarrier: $.OperatingCarrier,
							ns02#Origin: $.Origin,
							ns02#RequireMultipleAPISDocuments: $.RequireMultipleAPISDocuments as String default null,
							ns02#UTCArrivalTime: $.UTCArrivalTime as String default null,
							ns02#UTCDepartureTime: $.UTCDepartureTime as String default null
						})
					},
					ns01#Passenger: {
						ns02#Active: payload.GetBagLicensePlate_Request.Passenger.Active as String default null,
						ns02#AllowanceRetrieved: payload.GetBagLicensePlate_Request.Passenger.AllowanceRetrieved as String default null,
						ns02#Baggage: {
							ns02#BaggageAllowance: {
								ns02#BagDropId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.BagDropId,
								ns02#BaggageAllowanceTypeId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
								ns02#BaggageItemTypeId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
								ns02#ConsumeItemWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight as String default null,
								ns02#CreatedOn: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.CreatedOn as String default null,
								ns02#FlightId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.FlightId,
								ns02#Id: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.Id,
								ns02#InitialBags: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.InitialBags as String default null,
								ns02#InitialWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.InitialWeight as String default null,
								ns02#MaxSingleItemWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight as String default null,
								ns02#PassengerId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PassengerId as String default null,
								ns02#PoolItems: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PoolItems as String default null,
								ns02#PoolWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PoolWeight as String default null,
								ns02#PurchasedBags: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PurchasedBags as String default null,
								ns02#PurchasedWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PurchasedWeight as String default null,
								ns02#RemainingBags: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.RemainingBags as String default null,
								ns02#RemainingWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.RemainingWeight as String default null,
								ns02#UpdateInitialAllowance: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance as String default null
							},
							ns02#MaxSingleItemWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.MaxSingleItemWeight as String default null
						},
						ns02#Boarded: payload.GetBagLicensePlate_Request.Passenger.Boarded as String default null,
						ns02#CheckedIn: payload.GetBagLicensePlate_Request.Passenger.CheckedIn as String default null,
						ns02#ClearanceRequired: payload.GetBagLicensePlate_Request.Passenger.ClearanceRequired as String default null,
						ns02#ClearanceStatus: payload.GetBagLicensePlate_Request.Passenger.ClearanceStatus,
						ns02#ConfirmedDga: payload.GetBagLicensePlate_Request.Passenger.ConfirmedDga as String default null,
						ns02#ConfirmedIdentity: payload.GetBagLicensePlate_Request.Passenger.ConfirmedIdentity as String default null,
						ns02#ConnectingFlightNumber: payload.GetBagLicensePlate_Request.Passenger.ConnectingFlightNumber as String default null,
						ns02#DocumentCheckRequired: payload.GetBagLicensePlate_Request.Passenger.DocumentCheckRequired as String default null,
						ns02#FirstName: payload.GetBagLicensePlate_Request.Passenger.FirstName,
						ns02#Gender: payload.GetBagLicensePlate_Request.Passenger.Gender,
						ns02#Identity: {
							ns02#LastAPIS: {
								ns02#DateOfBirth: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DateOfBirth as String default null,
								ns02#DocumentExpiryDate: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentExpiryDate as String default null,
								ns02#DocumentIssueDate: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentIssueDate as String default null,
								ns02#DocumentNumber: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentNumber as String default null,
								ns02#DocumentType: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentType,
								ns02#Firstname: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Firstname,
								ns02#Nationality: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Nationality,
								ns02#Surname: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Surname
							} 
						},
						ns02#IsSelectableForBoardingPass: payload.GetBagLicensePlate_Request.Passenger.IsSelectableForBoardingPass as String default null,
						ns02#IsSelected: payload.GetBagLicensePlate_Request.Passenger.IsSelected as String default null,
						ns02#LastName: payload.GetBagLicensePlate_Request.Passenger.LastName,
						ns02#MarketingCarrierCode: payload.GetBagLicensePlate_Request.Passenger.MarketingCarrierCode,
						ns02#NativePassengerId: payload.GetBagLicensePlate_Request.Passenger.NativePassengerId as String default null,
						ns02#PassengerId: payload.GetBagLicensePlate_Request.Passenger.PassengerId,
						ns02#PassengerRPH: payload.GetBagLicensePlate_Request.Passenger.PassengerRPH as String default null,
						ns02#PassengerSequenceNumber: payload.GetBagLicensePlate_Request.Passenger.PassengerSequenceNumber,
						ns02#RequiresCheckin: payload.GetBagLicensePlate_Request.Passenger.RequiresCheckin as String default null,
						ns02#SeatNumber: payload.GetBagLicensePlate_Request.Passenger.SeatNumber,
						ns02#Title: payload.GetBagLicensePlate_Request.Passenger.Title
					},
					ns01#Pnr: payload.GetBagLicensePlate_Request.Pnr
				}
			}
		}
	}
}