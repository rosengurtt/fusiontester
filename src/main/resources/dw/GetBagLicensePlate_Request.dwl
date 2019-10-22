%dw 2.0
output application/xml skipNullOn = "everywhere"
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
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
						ns02#StartTime: payload.GetBagLicensePlate_Request.Session.StartTime,
						ns02#Status: payload.GetBagLicensePlate_Request.Session.Status,
						ns02#UserId: payload.GetBagLicensePlate_Request.Session.UserId,
						ns02#Weight: payload.GetBagLicensePlate_Request.Session.Weight
					},
					ns01#ActivateBagTag: payload.GetBagLicensePlate_Request.ActivateBagTag,
					ns01#BagWeight: payload.GetBagLicensePlate_Request.BagWeight,
					ns01#BaggageItem: (payload.GetBagLicensePlate_Request.*BaggageItem map (item, index) ->  {
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
					ns01#BaggageItemType: payload.GetBagLicensePlate_Request.BaggageItemType,
					ns01#ClearVisaAlert: payload.GetBagLicensePlate_Request.ClearVisaAlert,
					ns01#ExcessBaggageCost: {
						ns02#PaymentType: payload.GetBagLicensePlate_Request.ExcessBaggageCost.PaymentType,
						ns02#QuoteStatus: payload.GetBagLicensePlate_Request.ExcessBaggageCost.QuoteStatus
					},
					ns01#Flight: {
						ns02#ApisRequired: payload.GetBagLicensePlate_Request.Flight.ApisRequired,
						ns02#ArrivalTime: payload.GetBagLicensePlate_Request.Flight.ArrivalTime,
						ns02#ConnectingFlight: payload.GetBagLicensePlate_Request.Flight.ConnectingFlight,
						ns02#DepartureTerminal: payload.GetBagLicensePlate_Request.Flight.DepartureTerminal default null,
						ns02#DepartureTime: payload.GetBagLicensePlate_Request.Flight.DepartureTime,
						ns02#Destination: payload.GetBagLicensePlate_Request.Flight.Destination,
						ns02#EstimatedDepartureTime: payload.GetBagLicensePlate_Request.Flight.EstimatedDepartureTime,
						ns02#FlightNumber: payload.GetBagLicensePlate_Request.Flight.FlightNumber,
						ns02#FlightRPH: payload.GetBagLicensePlate_Request.Flight.FlightRPH,
						ns02#Id: payload.GetBagLicensePlate_Request.Flight.Id,
						ns02#JourneyRPH: payload.GetBagLicensePlate_Request.Flight.JourneyRPH,
						ns02#MarketingCarrier: payload.GetBagLicensePlate_Request.Flight.MarketingCarrier,
						ns02#NativeFlightId: payload.GetBagLicensePlate_Request.Flight.NativeFlightId,
						ns02#OpenForBoarding: payload.GetBagLicensePlate_Request.Flight.OpenForBoarding,
						ns02#OpenForCheckIn: payload.GetBagLicensePlate_Request.Flight.OpenForCheckIn,
						ns02#OperatingCarrier: payload.GetBagLicensePlate_Request.Flight.OperatingCarrier,
						ns02#Origin: payload.GetBagLicensePlate_Request.Flight.Origin,
						ns02#RequireMultipleAPISDocuments: payload.GetBagLicensePlate_Request.Flight.RequireMultipleAPISDocuments,
						ns02#UTCArrivalTime: payload.GetBagLicensePlate_Request.Flight.UTCArrivalTime,
						ns02#UTCDepartureTime: payload.GetBagLicensePlate_Request.Flight.UTCDepartureTime,
						ns02#UTCEstimatedDepartureTime: payload.GetBagLicensePlate_Request.Flight.UTCEstimatedDepartureTime,
					},
					ns01#Flights:  {
						ns02#Flight: (payload.GetBagLicensePlate_Request.Flights.*Flight map {
							ns02#ApisRequired: $.ApisRequired as String,
							ns02#ArrivalTime: $.ArrivalTime,
							ns02#ConnectingFlight: $.ConnectingFlight,
							ns02#DepartureTerminal: $.DepartureTerminal,
							ns02#DepartureTime: $.DepartureTime,
							ns02#Destination: $.Destination,
							ns02#EstimatedDepartureTime: $.EstimatedDepartureTime,
							ns02#FlightNumber: $.FlightNumber,
							ns02#FlightRPH: $.FlightRPH as String,
							ns02#Id: $.Id,
							ns02#JourneyRPH: $.JourneyRPH as String,
							ns02#MarketingCarrier: $.MarketingCarrier,
							ns02#NativeFlightId: $.NativeFlightId,
							ns02#OpenForBoarding: $.OpenForBoarding,
							ns02#OpenForCheckIn: $.OpenForCheckIn,
							ns02#OperatingCarrier: $.OperatingCarrier,
							ns02#Origin: $.Origin,
							ns02#RequireMultipleAPISDocuments: $.RequireMultipleAPISDocuments,
							ns02#UTCArrivalTime: $.UTCArrivalTime,
							ns02#UTCDepartureTime: $.UTCDepartureTime,
							ns02#UTCEstimatedDepartureTime: $.UTCEstimatedDepartureTime,
						})
					},
					ns01#Passenger: {
						ns02#Active: payload.GetBagLicensePlate_Request.Passenger.Active,
						ns02#AllowanceRetrieved: payload.GetBagLicensePlate_Request.Passenger.AllowanceRetrieved,
						ns02#Baggage: {
							ns02#BaggageAllowance: if (payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.RemainingWeight != '0'
									 or payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.InitialWeight != '0'
									or payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PoolItems == 'true'
									or payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PoolWeight == 'true') {
								ns02#BagDropId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.BagDropId,
								ns02#BaggageAllowanceTypeId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
								ns02#BaggageItemTypeId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.BaggageItemTypeId,
								ns02#ConsumeItemWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.ConsumeItemWeight,
								ns02#CreatedOn: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.CreatedOn,
								ns02#FlightId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.FlightId,
								ns02#Id: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.Id,
								ns02#InitialBags: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.InitialBags,
								ns02#InitialWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.InitialWeight,
								ns02#MaxSingleItemWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.MaxSingleItemWeight,
								ns02#PassengerId: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PassengerId,
								ns02#PoolItems: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PoolItems,
								ns02#PoolWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PoolWeight,
								ns02#PurchasedBags: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PurchasedBags,
								ns02#PurchasedWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.PurchasedWeight,
								ns02#RemainingBags: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.RemainingBags,
								ns02#RemainingWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.RemainingWeight,
								ns02#UpdateInitialAllowance: payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowance.UpdateInitialAllowance
							} else null,
							ns02#BaggageAllowances: {
								ns02#BaggageAllowance: (payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageAllowances.*BaggageAllowance map (item, index) -> {
									ns02#BagDropId: item.BagDropId,
									ns02#BaggageAllowanceTypeId: item.BaggageAllowanceTypeId,
									ns02#BaggageItemTypeId: item.BaggageItemTypeId,
									ns02#ConsumeItemWeight: item.ConsumeItemWeight,
									ns02#CreatedOn: item.CreatedOn,
									ns02#FlightId: item.FlightId,
									ns02#Id: item.Id,
									ns02#InitialBags: item.InitialBags,
									ns02#InitialWeight: item.InitialWeight,
									ns02#MaxSingleItemWeight: item.MaxSingleItemWeight,
									ns02#PassengerId: item.PassengerId,
									ns02#PoolItems: item.PoolItems,
									ns02#PoolWeight: item.PoolWeight,
									ns02#PurchasedBags: item.PurchasedBags,
									ns02#PurchasedWeight: item.PurchasedWeight,
									ns02#RemainingBags: item.RemainingBags,
									ns02#RemainingWeight: item.RemainingWeight,
									ns02#UpdateInitialAllowance: item.UpdateInitialAllowance,
								})
							},
							ns02#BaggageItems: {
								ns02#BaggageItem: (payload.GetBagLicensePlate_Request.Passenger.Baggage.BaggageItems.*BaggageItem map (item, index) -> {
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
									ns02#NativeBaggageId: item.NativeBaggageId,
									ns02#OutOfGauge: item.OutOfGauge,
									ns02#PassengerId: item.PassengerId,
									ns02#Printed: item.Printed,
									ns02#PrintedTime: item.PrintedTime,
									ns02#Registered: item.Registered,
									ns02#RegisteredTime: item.RegisteredTime,
									ns02#SessionId: item.SessionId,
									ns02#TagNumber: item.TagNumber,
									ns02#Weight: item.Weight,
								})
							},
							ns02#MaxSingleItemWeight: payload.GetBagLicensePlate_Request.Passenger.Baggage.MaxSingleItemWeight
						},
						ns02#Barcode: payload.GetBagLicensePlate_Request.Passenger.Barcode,
						ns02#Boarded: payload.GetBagLicensePlate_Request.Passenger.Boarded,
						ns02#CheckedIn: payload.GetBagLicensePlate_Request.Passenger.CheckedIn,
						ns02#ClearanceRequired: payload.GetBagLicensePlate_Request.Passenger.ClearanceRequired,
						ns02#ClearanceStatus: payload.GetBagLicensePlate_Request.Passenger.ClearanceStatus,
						ns02#ConfirmedDga: payload.GetBagLicensePlate_Request.Passenger.ConfirmedDga,
						ns02#ConfirmedIdentity: payload.GetBagLicensePlate_Request.Passenger.ConfirmedIdentity,
						ns02#ConnectingFlightNumber: payload.GetBagLicensePlate_Request.Passenger.ConnectingFlightNumber,
						ns02#CustomProperties:{
							ns03#string: payload.GetBagLicensePlate_Request.Passenger.CustomProperties.*string
						},
						ns02#DateOfBirth: payload.GetBagLicensePlate_Request.Passenger.DateOfBirth,
						ns02#DocumentCheckRequired: payload.GetBagLicensePlate_Request.Passenger.DocumentCheckRequired,
						ns02#FirstName: payload.GetBagLicensePlate_Request.Passenger.FirstName,
						ns02#Gender: payload.GetBagLicensePlate_Request.Passenger.Gender,
						ns02#Identity: if (payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS != null) {
							ns02#LastAPIS: {	
								ns02#AddressInformation: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.AddressInformation,	
								ns02#ContactInformation: if (payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.ContactLastName != null) {
									ns02#AddressLine: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.AddressLine,
									ns02#City: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.City,
									ns02#CompanyName: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.CompanyName,
									ns02#ContactFirstName: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.ContactFirstName,
									ns02#ContactLastName: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.ContactLastName,
									ns02#ContactTitle: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.ContactTitle,
									ns02#Country: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.Country,
									ns02#EmailAddress: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.EmailAddress,
									ns02#NotificationPreference: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.NotificationPreference,
									ns02#PostalCode: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.PostalCode,
									ns02#TelephoneNumber: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.ContactInformation.TelephoneNumber,									
								} else null,
								ns02#CountryOfIssue: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.CountryOfIssue,
								ns02#CountryOfResidence: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.CountryOfResidence,								
								ns02#DateOfBirth: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DateOfBirth,		
								ns02#DocumentExpiryDate: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentExpiryDate,
								ns02#DocumentIssueDate: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentIssueDate,
								ns02#DocumentNumber: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentNumber,						
								ns02#DocumentType: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.DocumentType,
								ns02#Firstname: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Firstname,
								ns02#Forenames: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Forenames,
								ns02#Gender: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Gender,
								ns02#Nationality: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Nationality,
								ns02#Surname: payload.GetBagLicensePlate_Request.Passenger.Identity.LastAPIS.Surname
							} 
						} else null,
						ns02#IsSelectableForBoardingPass: payload.GetBagLicensePlate_Request.Passenger.IsSelectableForBoardingPass,
						ns02#IsSelected: payload.GetBagLicensePlate_Request.Passenger.IsSelected,
						ns02#LastName: payload.GetBagLicensePlate_Request.Passenger.LastName,
						ns02#MarketingCarrierCode: payload.GetBagLicensePlate_Request.Passenger.MarketingCarrierCode,
						ns02#MiddleName: payload.GetBagLicensePlate_Request.Passenger.MiddleName,
						ns02#NativePassengerId: payload.GetBagLicensePlate_Request.Passenger.NativePassengerId,
						ns02#PassengerId: payload.GetBagLicensePlate_Request.Passenger.PassengerId,
						ns02#PassengerRPH: payload.GetBagLicensePlate_Request.Passenger.PassengerRPH,
						ns02#PassengerSequenceNumber: payload.GetBagLicensePlate_Request.Passenger.PassengerSequenceNumber,
						ns02#PaxType: payload.GetBagLicensePlate_Request.Passenger.PaxType,
						ns02#SSRs:{
							ns02#SSR: (payload.GetBagLicensePlate_Request.Passenger.SSRs.*SSR  map (itemon, indexon) -> {
								ns02#Currency: itemon.Currency,
								ns02#FeeCode: itemon.FeeCode,
								ns02#FlightNumber: itemon.FlightNumber,
								ns02#PaxNumber: itemon.PaxNumber,
								ns02#Price: itemon.Price,
								ns02#SSRCode: itemon.SSRCode,
								ns02#SSRDescription: itemon.SSRDescription,						
							})
						},
						ns02#RequiresCheckin: payload.GetBagLicensePlate_Request.Passenger.RequiresCheckin,
						ns02#SeatNumber: payload.GetBagLicensePlate_Request.Passenger.SeatNumber,
						ns02#SeatPreference: {
							ns02#Name: payload.GetBagLicensePlate_Request.Passenger.SeatPreference.Name,
						},
						ns02#SupportsCheckin: payload.GetBagLicensePlate_Request.Passenger.SupportsCheckin,
						ns02#Title: payload.GetBagLicensePlate_Request.Passenger.Title
					},
					ns01#Pnr: payload.GetBagLicensePlate_Request.Pnr
				}
			}
		}
	}
}