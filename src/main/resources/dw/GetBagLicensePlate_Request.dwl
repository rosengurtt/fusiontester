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
				ns01#request: (payload.*GetBagLicensePlate_Request map (i, ind) -> {
					ns02#DepartureAirportCode: i.DepartureAirportCode,
					ns02#IataAirlineCode: i.IataAirlineCode,
					ns02#MACAddress: i.MACAddress,
					ns02#RequestId: i.RequestId,
					ns02#RequestSourceName: i.RequestSourceName,
					ns02#RequestType: i.RequestType,
					ns02#TestRequest: i.TestRequest,
					ns02#Session: (i.*Session map (session,sessionIndex) -> {
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
					ns01#ActivateBagTag: i.ActivateBagTag,
					ns01#BagWeight: i.BagWeight,
					ns01#BaggageItem: (i.*BaggageItem map (baggageItem, baggageItemIndex) ->  {
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
					}),
					ns01#BaggageItemType: i.BaggageItemType,
					ns01#ClearVisaAlert: i.ClearVisaAlert,
					ns01#ExcessBaggageCost: {
						ns02#PaymentType: i.ExcessBaggageCost.PaymentType,
						ns02#QuoteStatus: i.ExcessBaggageCost.QuoteStatus
					},
					ns01#Flight: (i.*Flight map (flight, flightIndex) -> {
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
					}),
					ns01#Flights:  {
						ns02#Flight: (i.Flights.*Flight map (flight, flightIndex) -> {
							ns02#ApisRequired: flight.ApisRequired,
							ns02#ArrivalTime: flight.ArrivalTime,
							ns02#ConnectingFlight: flight.ConnectingFlight,
							ns02#DepartureTerminal: flight.DepartureTerminal,
							ns02#DepartureTime: flight.DepartureTime,
							ns02#Destination: flight.Destination,
							ns02#EstimatedDepartureTime: flight.EstimatedDepartureTime,
							ns02#FlightNumber: flight.FlightNumber,
							ns02#FlightRPH: flight.FlightRPH as String,
							ns02#Id: flight.Id,
							ns02#JourneyRPH: flight.JourneyRPH as String,
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
					ns01#Passenger: (i.*Passenger map (passenger, passengerIndex) -> {
						ns02#Active: passenger.Active,
						ns02#AllowanceRetrieved: passenger.AllowanceRetrieved,
						ns02#Baggage: {
							ns02#BaggageAllowance: if (passenger.Baggage.BaggageAllowance.RemainingWeight != '0'
									 or passenger.Baggage.BaggageAllowance.InitialWeight != '0'
									or passenger.Baggage.BaggageAllowance.PoolItems == 'true'
									or passenger.Baggage.BaggageAllowance.PoolWeight == 'true')
								(passenger.Baggage.*BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) -> {
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
							}) else null,
							ns02#BaggageAllowances: {
								ns02#BaggageAllowance: (passenger.Baggage.BaggageAllowances.*BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) -> {
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
									ns02#UpdateInitialAllowance: baggageAllowance.UpdateInitialAllowance,
								})
							},
							ns02#BaggageItems: {
								ns02#BaggageItem: (passenger.Baggage.BaggageItems.*BaggageItem map (baggageItem, baggageItemIndex) -> {
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
							ns02#MaxSingleItemWeight: passenger.Baggage.MaxSingleItemWeight
						},
						ns02#Barcode: passenger.Barcode,
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
						ns02#Identity: if (passenger.Identity.LastAPIS != null) {
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
						} else null,
						ns02#Infant: if (passenger.Infant.InfantId != null)
							(passenger.*Infant map (infant, infantIndex) -> {
							ns02#AdultPassengerId: infant.AdultPassengerId,
							ns02#AdultPassengerRPH: infant.AdultPassengerRPH,
							ns02#AllowanceRetrieved: infant.AllowanceRetrieved,
							ns02#Baggage: {
									ns02#BaggageAllowance: if (infant.Baggage.BaggageAllowance.RemainingWeight != '0'
											 or infant.Baggage.BaggageAllowance.InitialWeight != '0'
											or infant.Baggage.BaggageAllowance.PoolItems == 'true'
											or infant.Baggage.BaggageAllowance.PoolWeight == 'true') 
										(infant.Baggage.*BaggageAllowance map (baggageAllowance, baggageIndex) ->	{
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
									}) else null,
									ns02#BaggageAllowances: {
										ns02#BaggageAllowance: (infant.Baggage.BaggageAllowances.*BaggageAllowance map (baggageAllowance, baggageAllowanceIndex) -> {
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
											ns02#UpdateInitialAllowance: baggageAllowance.UpdateInitialAllowance,
										})
									},
									ns02#BaggageItems: {
										ns02#BaggageItem: (infant.Baggage.BaggageItems.*BaggageItem map (baggageItem, baggageItemIndex) -> {
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
									ns02#MaxSingleItemWeight: infant.Baggage.MaxSingleItemWeight
								},
							ns02#Boarded: infant.Boarded,
							ns02#CheckedIn: infant.CheckedIn,
							ns02#ConfirmedIdentity: infant.ConfirmedIdentity,
							ns02#CustomProperties:{
								ns03#string: infant.CustomProperties.*string
							},
							ns02#DateOfBirth: infant.DateOfBirth,
							ns02#Fees:{
								ns02#Fee: (infant.*Fee map (fee, feeIndex) -> {
									ns02#Code: fee.Code,
									ns02#Currency: fee.Currency,
									ns02#FeeAmount: fee.FeeAmount,
									ns02#FeeType: fee.FeeType,										
								})
							},
							ns02#FirstName: infant.FirstName,
							ns02#Gender: infant.Gender,
							ns02#Identity: if (infant.Identity.LastAPIS != null) {
								ns02#LastAPIS: (infant.Identity.*LastAPIS map (lastApis, lastApisIndex) -> {	
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
							} else null,
							ns02#InfantId: infant.InfantId,
							ns02#IsSelected: infant.IsSelected,
							ns02#LastName: infant.LastName,
							ns02#MiddleName: infant.MiddleName,
							ns02#NativePassengerId: infant.NativePassengerId,
							ns02#PassengerRPH: infant.PassengerRPH,
							ns02#PassengerSequenceNumber: infant.PassengerSequenceNumber,
							ns02#Remarks: {
								ns02#Remark: (infant.Remarks.*Remark map (remark, remarkindex) -> {
									ns02#RemarkType: remark.RemarkType,
									ns02#Wording: remark.Wording,										
								})
							},
							ns02#SSRs: {
								ns02#SSR: (infant.SSRs.*SSR map (ssr, ssrIndex) -> {
									ns02#Currency: ssr.Currency,
									ns02#FeeCode: ssr.FeeCode,
									ns02#FlightNumber: ssr.FlightNumber,
									ns02#PaxNumber: ssr.PaxNumber,
									ns02#Price: ssr.Price,
									ns02#SSRCode: ssr.SSRCode,
									ns02#SSRDescription: ssr.SSRDescription,				
								})
							},
							ns02#SeatNumber: infant.SeatNumber,
							ns02#Title: infant.Title,							
						}) else null,
						ns02#IsSelectableForBoardingPass: passenger.IsSelectableForBoardingPass,
						ns02#IsSelected: passenger.IsSelected,
						ns02#LastName: passenger.LastName,
						ns02#MarketingCarrierCode: passenger.MarketingCarrierCode,
						ns02#MiddleName: passenger.MiddleName,
						ns02#NativePassengerId: passenger.NativePassengerId,
						ns02#PassengerId: passenger.PassengerId,
						ns02#PassengerRPH: passenger.PassengerRPH,
						ns02#PassengerSequenceNumber: passenger.PassengerSequenceNumber,
						ns02#PaxType: passenger.PaxType,
						ns02#SSRs:{
							ns02#SSR: (passenger.SSRs.*SSR  map (itemon, indexon) -> {
								ns02#Currency: itemon.Currency,
								ns02#FeeCode: itemon.FeeCode,
								ns02#FlightNumber: itemon.FlightNumber,
								ns02#PaxNumber: itemon.PaxNumber,
								ns02#Price: itemon.Price,
								ns02#SSRCode: itemon.SSRCode,
								ns02#SSRDescription: itemon.SSRDescription,						
							})
						},
						ns02#RequiresCheckin: passenger.RequiresCheckin,
						ns02#SeatNumber: passenger.SeatNumber,
						ns02#SeatPreference: {
							ns02#Name: passenger.SeatPreference.Name,
						},
						ns02#SupportsCheckin: passenger.SupportsCheckin,
						ns02#Title: passenger.Title
					}),
					ns01#Pnr: i.Pnr
				})
			}
		}
	}
}