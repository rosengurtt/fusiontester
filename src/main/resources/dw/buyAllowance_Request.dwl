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
					ns02#Session: (i.*Session map (session, sessionIndex) ->{
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
					ns01#AgentName: i.AgentName,
					ns01#Costs: {
						ns02#CardPayment: {
							ns02#AuthorisationCode: i.Costs.CardPayment.AuthorisationCode,
							ns02#CardScheme: i.Costs.CardPayment.CardScheme,
							ns02#MerchantId: i.Costs.CardPayment.AuthorisationCode,
							ns02#TerminalId: i.Costs.CardPayment.TerminalId,
							ns02#TransactionDate: i.Costs.CardPayment.TransactionDate,
							ns02#TransactionReference: i.Costs.CardPayment.TransactionReference,
						},
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
								ns02#CurrencySymbol: i.Costs.ItemList.ExcessBaggageCost.CurrencySymbol,
								ns02#Description: i.Costs.ItemList.ExcessBaggageCost.Description,
								ns02#Price: i.Costs.ItemList.ExcessBaggageCost.Price,
								ns02#Quantity: i.Costs.ItemList.ExcessBaggageCost.Quantity
							}
						},
						ns02#PaymentReference: i.Costs.PaymentReference,
						ns02#PaymentType: i.Costs.PaymentType,
						ns02#PaymentTypeDetail: i.Costs.PaymentTypeDetail,
						ns02#QuoteStatus: i.Costs.QuoteStatus,
						ns02#StatusMessage: i.Costs.StatusMessage
					},
					ns01#Flights: {
						ns02#Flight: (i.Flights.*Flight map (flight, flightInd) -> {
							ns02#ApisRequired: flight.ApisRequired,
							ns02#ArrivalTime: flight.ArrivalTime,
							ns02#ConnectingFlight: flight.ConnectingFlight,								
							ns02#CustomProperties:{
								ns03#string: flight.CustomProperties.*string
							},
							ns02#DepartureTerminal: flight.DepartureTerminal,
							ns02#DepartureTime: flight.DepartureTime,
							ns02#Destination: flight.Destination,
							ns02#EstimatedDepartureTime: flight.EstimatedDepartureTime,
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
							ns02#UTCDepartureTime: flight.UTCDepartureTime,
							ns02#UTCEstimatedDepartureTime: flight.UTCEstimatedDepartureTime,
						})
					},
					ns01#Passenger: (i.*Passenger map (passenger, indPass) -> {
						ns02#Active: passenger.Active,
						ns02#AllowanceRetrieved: passenger.AllowanceRetrieved,
						ns02#Baggage: (passenger.*Baggage map (baggage, in) -> {
							ns02#BaggageAllowance: (baggage.*BaggageAllowance map (baggageAllowance, index) -> {
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
								ns02#BaggageItem: (baggage.BaggageItems.*BaggageItem map (baggageItem, ind) -> {
									ns02#Active: baggageItem.Active,
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
									ns02#Weight: baggageItem.Weight,
								})
							},
							ns02#MaxSingleItemWeight: baggage.MaxSingleItemWeight
						}),
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
						ns02#Gender: passenger.Gender,
						ns02#Identity: {
							ns02#LastAPIS: (passenger.Identity.*LastAPIS map (lastApis, lastApisIndex) -> {
								ns02#AddressInformation: lastApis.AddressInformation,
								ns02#ContactInformation: 
								if (lastApis.ContactInformation.ContactLastName != null)
								(lastApis.*ContactInformation map (contactInfo, contactInfoIndex) -> {
									ns02#AddressLine: contactInfo.AddressLine,
									ns02#City: contactInfo.City,
									ns02#CompanyName: contactInfo.CompanyName,
									ns02#ContactFirstName: contactInfo.ContactFirstName,
									ns02#ContactLastName: contactInfo.ContactLastName,
									ns02#ContactTitle: contactInfo.ContactTitle,
									ns02#Country: contactInfo.Country,
									ns02#EmailAddress: contactInfo.EmailAddress,
									ns02#NotificationPreference: contactInfo.NotificationPreference,
									ns02#PostalCode: contactInfo.PostalCode,
									ns02#TelephoneNumber: contactInfo.TelephoneNumber		
								}) else null,
								ns02#CountryOfIssue: lastApis.CountryOfIssue,
								ns02#CountryOfResidence: lastApis.CountryOfResidence,
								ns02#DateOfBirth: lastApis.DateOfBirth,
								ns02#DocumentExpiryDate: lastApis.DocumentExpiryDate,
								ns02#DocumentIssueDate: lastApis.DocumentIssueDate,
								ns02#DocumentNumber: lastApis.DocumentNumber,
								ns02#DocumentType: lastApis.DocumentType,
								ns02#Firstname: lastApis.Firstname,
								ns02#Forenames: lastApis.Forenames,
								ns02#Gender: lastApis.Gender,
								ns02#ImageBytes: lastApis.ImageBytes,
								ns02#Nationality: lastApis.Nationality,
								ns02#RawCodeline: lastApis.RawCodeline,
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