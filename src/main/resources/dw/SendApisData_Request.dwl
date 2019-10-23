%dw 2.0
output application/xml skipNullOn = "everywhere"
ns a http://www.w3.org/2005/08/addressing
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns ns03 http://schemas.microsoft.com/2003/10/Serialization/Arrays
---
{
	ns0#Envelope: {
		ns0#Header: {
			a#Action @(ns0#mustUnderstand: "1"): "http://services.fusion.aero/IFusionService/SendApisData",
			a#MessageID: "urn:uuid:e933edc2-19c0-4e4e-87c2-8628bc7bf3b7",
			a#ReplyTo: {
				a#Address: "http://www.w3.org/2005/08/addressing/anonymous"
			},
			a#To @(ns0#mustUnderstand: "1"): "http://local.fusion.aero/FusionService.svc"
		},
		ns0#Body: {
			ns01#SendApisData: {
				ns01#request: {
					ns02#DepartureAirportCode: payload.SendApisData_Request.DepartureAirportCode,
					ns02#IataAirlineCode: payload.SendApisData_Request.IataAirlineCode,
					ns02#MACAddress: payload.SendApisData_Request.MACAddress,
					ns02#RequestId: payload.SendApisData_Request.RequestId,
					ns02#RequestSourceName: payload.SendApisData_Request.RequestSourceName,
					ns02#RequestType: payload.SendApisData_Request.RequestType,
					ns02#TestRequest: payload.SendApisData_Request.TestRequest,
					ns02#BusinessActivity: payload.SendApisData_Request.BusinessActivity,
					ns02#OverridingKioskUser:{
						ns02#DateCreated: payload.SendApisData_Request.OverridingKioskUser.DateCreated,
						ns02#DisplayName: payload.SendApisData_Request.OverridingKioskUser.DisplayName,
						ns02#HashedPassword: payload.SendApisData_Request.OverridingKioskUser.HashedPassword,
						ns02#IsAdmin: payload.SendApisData_Request.OverridingKioskUser.IsAdmin,
						ns02#LastLogin: payload.SendApisData_Request.OverridingKioskUser.LastLogin,
						ns02#NativeUserId: payload.SendApisData_Request.OverridingKioskUser.NativeUserId,
						ns02#OrganisationId: payload.SendApisData_Request.OverridingKioskUser.OrganisationId,
						ns02#UserId: payload.SendApisData_Request.OverridingKioskUser.UserId,
						ns02#UserName: payload.SendApisData_Request.OverridingKioskUser.UserName,
					},
					ns02#Session: {
						ns02#EndTime: payload.SendApisData_Request.Session.EndTime,
						ns02#KioskId: payload.SendApisData_Request.Session.KioskId,
						ns02#PNR: payload.SendApisData_Request.Session.PNR,
						ns02#Price: payload.SendApisData_Request.Session.Price,
						ns02#ServiceConfigId: payload.SendApisData_Request.Session.ServiceConfigId,
						ns02#SessionId: payload.SendApisData_Request.Session.SessionId,
						ns02#StartTime: payload.SendApisData_Request.Session.StartTime,
						ns02#Status: payload.SendApisData_Request.Session.Status,
						ns02#UserId: payload.SendApisData_Request.Session.UserId,
						ns02#Weight: payload.SendApisData_Request.Session.Weight
					},
					ns02#ApisData:{
						ns02#AddressInformation: {
							ns02#CityName: payload.SendApisData_Request.ApisData.AddressInformation.CityName,
							ns02#Country:{
								ns02#A2Code: payload.SendApisData_Request.ApisData.AddressInformation.Country.A2Code,
								ns02#A3Code: payload.SendApisData_Request.ApisData.AddressInformation.Country.A3Code,
								ns02#Abbreviation: payload.SendApisData_Request.ApisData.AddressInformation.Country.Abbreviation,
								ns02#Enabled: payload.SendApisData_Request.ApisData.AddressInformation.Country.Enabled,
								ns02#Name: payload.SendApisData_Request.ApisData.AddressInformation.Country.Name,
								ns02#PhoneCode: payload.SendApisData_Request.ApisData.AddressInformation.Country.PhoneCode,								
							},
							ns02#PostalCode: payload.SendApisData_Request.ApisData.AddressInformation.PostalCode,
							ns02#StateProvince: payload.SendApisData_Request.ApisData.AddressInformation.StateProvince,
							ns02#StreetNumber: payload.SendApisData_Request.ApisData.AddressInformation.StreetNumber,
						},
						ns02#ContactInformation: if (payload.SendApisData_Request.ApisData.ContactInformation.ContactLastName != null) {
							ns02#AddressLine: payload.SendApisData_Request.ApisData.ContactInformation.AddressLine,
							ns02#City: payload.SendApisData_Request.ApisData.ContactInformation.City,
							ns02#CompanyName: payload.SendApisData_Request.ApisData.ContactInformation.CompanyName,
							ns02#ContactFirstName: payload.SendApisData_Request.ApisData.ContactInformation.ContactFirstName,
							ns02#ContactLastName: payload.SendApisData_Request.ApisData.ContactInformation.ContactLastName,
							ns02#ContactTitle: payload.SendApisData_Request.ApisData.ContactInformation.ContactTitle,
							ns02#Country: payload.SendApisData_Request.ApisData.ContactInformation.Country,
							ns02#EmailAddress: payload.SendApisData_Request.ApisData.ContactInformation.EmailAddress,
							ns02#NotificationPreference: payload.SendApisData_Request.ApisData.ContactInformation.NotificationPreference,
							ns02#PostalCode: payload.SendApisData_Request.ApisData.ContactInformation.PostalCode,
							ns02#TelephoneNumber: payload.SendApisData_Request.ApisData.ContactInformation.TelephoneNumber,									
						} else null,
						ns02#CountryOfIssue: payload.SendApisData_Request.ApisData.CountryOfIssue,
						ns02#CountryOfResidence: payload.SendApisData_Request.ApisData.CountryOfResidence,								
						ns02#DateOfBirth: payload.SendApisData_Request.ApisData.DateOfBirth,		
						ns02#DocumentExpiryDate: payload.SendApisData_Request.ApisData.DocumentExpiryDate,
						ns02#DocumentIssueDate: payload.SendApisData_Request.ApisData.DocumentIssueDate,
						ns02#DocumentNumber: payload.SendApisData_Request.ApisData.DocumentNumber,						
						ns02#DocumentType: payload.SendApisData_Request.ApisData.DocumentType,
						ns02#Firstname: payload.SendApisData_Request.ApisData.Firstname,
						ns02#Forenames: payload.SendApisData_Request.ApisData.Forenames,
						ns02#Gender: payload.SendApisData_Request.ApisData.Gender,
						ns02#Nationality: payload.SendApisData_Request.ApisData.Nationality,
						ns02#Surname: payload.SendApisData_Request.ApisData.Surname
					},
					ns01#Flight: {
						ns02#ApisRequired: payload.SendApisData_Request.Flight.ApisRequired,
						ns02#ArrivalTime: payload.SendApisData_Request.Flight.ArrivalTime,
						ns02#ConnectingFlight: payload.SendApisData_Request.Flight.ConnectingFlight,
						ns02#DepartureTerminal: payload.SendApisData_Request.Flight.DepartureTerminal default null,
						ns02#DepartureTime: payload.SendApisData_Request.Flight.DepartureTime,
						ns02#Destination: payload.SendApisData_Request.Flight.Destination,
						ns02#EstimatedDepartureTime: payload.SendApisData_Request.Flight.EstimatedDepartureTime,
						ns02#FlightNumber: payload.SendApisData_Request.Flight.FlightNumber,
						ns02#FlightRPH: payload.SendApisData_Request.Flight.FlightRPH,
						ns02#Id: payload.SendApisData_Request.Flight.Id,
						ns02#JourneyRPH: payload.SendApisData_Request.Flight.JourneyRPH,
						ns02#MarketingCarrier: payload.SendApisData_Request.Flight.MarketingCarrier,
						ns02#NativeFlightId: payload.SendApisData_Request.Flight.NativeFlightId,
						ns02#OpenForBoarding: payload.SendApisData_Request.Flight.OpenForBoarding,
						ns02#OpenForCheckIn: payload.SendApisData_Request.Flight.OpenForCheckIn,
						ns02#OperatingCarrier: payload.SendApisData_Request.Flight.OperatingCarrier,
						ns02#Origin: payload.SendApisData_Request.Flight.Origin,
						ns02#RequireMultipleAPISDocuments: payload.SendApisData_Request.Flight.RequireMultipleAPISDocuments,
						ns02#UTCArrivalTime: payload.SendApisData_Request.Flight.UTCArrivalTime,
						ns02#UTCDepartureTime: payload.SendApisData_Request.Flight.UTCDepartureTime,
						ns02#UTCEstimatedDepartureTime: payload.SendApisData_Request.Flight.UTCEstimatedDepartureTime,
					},
					ns01#NativePassengerId: payload.SendApisData_Request.NativePassengerId,
					ns01#Passengers: {
						ns02#Passenger: (payload.SendApisData_Request.Passengers.*Passenger map {
							ns02#Active: $.Active,
							ns02#AllowanceRetrieved: $.AllowanceRetrieved,							
							ns02#Baggage: {
								ns02#BaggageAllowance:{
									ns02#BagDropId: $.Baggage.BaggageAllowance.BagDropId,
									ns02#BaggageAllowanceTypeId: $.Baggage.BaggageAllowance.BaggageAllowanceTypeId,
									ns02#BaggageItemTypeId: $.Baggage.BaggageAllowance.BaggageItemTypeId,
									ns02#ConsumeItemWeight: $.Baggage.BaggageAllowance.ConsumeItemWeight,
									ns02#CreatedOn: $.Baggage.BaggageAllowance.CreatedOn,
									ns02#FlightId: $.Baggage.BaggageAllowance.FlightId,
									ns02#Id: $.Baggage.BaggageAllowance.Id,
									ns02#InitialBags: $.Baggage.BaggageAllowance.InitialBags,
									ns02#InitialWeight: $.Baggage.BaggageAllowance.InitialWeight,
									ns02#MaxSingleItemWeight: $.Baggage.BaggageAllowance.MaxSingleItemWeight,
									ns02#PassengerId: $.Baggage.BaggageAllowance.PassengerId,
									ns02#PoolItems: $.Baggage.BaggageAllowance.PoolItems,
									ns02#PoolWeight: $.Baggage.BaggageAllowance.PoolWeight,
									ns02#PurchasedBags: $.Baggage.BaggageAllowance.PurchasedBags,
									ns02#PurchasedWeight: $.Baggage.BaggageAllowance.PurchasedWeight,
									ns02#RemainingBags: $.Baggage.BaggageAllowance.RemainingBags,
									ns02#RemainingWeight: $.Baggage.BaggageAllowance.RemainingWeight,
									ns02#UpdateInitialAllowance: $.Baggage.BaggageAllowance.UpdateInitialAllowance,									
								},
								BaggageAllowances: {
									BaggageAllowance: ($.Baggage.BaggageAllowances.*BaggageAllowance map (item, index) -> {
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
									ns02#BaggageItem: ($.Baggage.BaggageItems.*BaggageItem map (item, index) -> {
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
								ns02#MaxSingleItemWeight: $.Baggage.MaxSingleItemWeight,
							},
							ns02#Boarded: $.Boarded,
							ns02#CheckedIn: $.CheckedIn,
							ns02#ClearanceRequired: $.ClearanceRequired,
							ns02#ClearanceStatus: $.ClearanceStatus,
							ns02#ConfirmedDga: $.ConfirmedDga,
							ns02#ConfirmedIdentity: $.ConfirmedIdentity,
							ns02#ConnectingFlightNumber: $.ConnectingFlightNumber,
							ns02#CustomProperties:{
								ns03#string: $.CustomProperties.*string
							},
							ns02#DateOfBirth: $.DateOfBirth,
							ns02#DocumentCheckRequired: $.DocumentCheckRequired,
							ns02#FirstName: $.FirstName,
							ns02#Gender: $.Gender,
							ns02#Identity: {
									ns02#LastAPIS: {
										ns02#AddressInformation: $.Identity.LastAPIS.AddressInformation,
										ns02#ContactInformation: {
											ns02#AddressLine: $.Identity.LastAPIS.ContactInformation.AddressLine,
											ns02#City: $.Identity.LastAPIS.ContactInformation.City,
											ns02#CompanyName: $.Identity.LastAPIS.ContactInformation.CompanyName,
											ns02#ContactFirstName: $.Identity.LastAPIS.ContactInformation.ContactFirstName,
											ns02#ContactLastName: $.Identity.LastAPIS.ContactInformation.ContactLastName,
											ns02#ContactTitle: $.Identity.LastAPIS.ContactInformation.ContactTitle,
											ns02#Country: $.Identity.LastAPIS.ContactInformation.Country,
											ns02#EmailAddress: $.Identity.LastAPIS.ContactInformation.EmailAddress,
											ns02#NotificationPreference: $.Identity.LastAPIS.ContactInformation.NotificationPreference,
											ns02#PostalCode: $.Identity.LastAPIS.ContactInformation.PostalCode,
											ns02#TelephoneNumber: $.Identity.LastAPIS.ContactInformation.TelephoneNumber		
										},
										ns02#CountryOfIssue: $.Identity.LastAPIS.CountryOfIssue,
										ns02#CountryOfResidence: $.Identity.LastAPIS.CountryOfResidence,
										ns02#DateOfBirth: $.Identity.LastAPIS.DateOfBirth,
										ns02#DocumentExpiryDate: $.Identity.LastAPIS.DocumentExpiryDate,
										ns02#DocumentIssueDate: $.Identity.LastAPIS.DocumentIssueDate,
										ns02#DocumentNumber: $.Identity.LastAPIS.DocumentNumber,
										ns02#DocumentType: $.Identity.LastAPIS.DocumentType,
										ns02#Firstname: $.Identity.LastAPIS.Firstname,
										ns02#Forenames: $.Identity.LastAPIS.Forenames,
										ns02#Gender: $.Identity.LastAPIS.Gender,
										ns02#ImageBytes: $.Identity.LastAPIS.ImageBytes,
										ns02#Nationality: $.Identity.LastAPIS.Nationality,
										ns02#RawCodeline: $.Identity.LastAPIS.RawCodeline,
										ns02#Surname: $.Identity.LastAPIS.Surname										
									},
								ns02#ObtainedAPIS: {		
									ns02#ApisData: {
										ns02#ContactInformation: {
											ns02#AddressLine: $.Identity.ObtainedAPIS.ApisData.ContactInformation.AddressLine,
											ns02#City: $.Identity.ObtainedAPIS.ApisData.ContactInformation.City,
											ns02#CompanyName: $.Identity.ObtainedAPIS.ApisData.ContactInformation.CompanyName,
											ns02#ContactFirstName: $.Identity.ObtainedAPIS.ApisData.ContactInformation.ContactFirstName,
											ns02#ContactLastName: $.Identity.ObtainedAPIS.ApisData.ContactInformation.ContactLastName,
											ns02#ContactTitle: $.Identity.ObtainedAPIS.ApisData.ContactInformation.ContactTitle,
											ns02#Country: $.Identity.ObtainedAPIS.ApisData.ContactInformation.Country,
											ns02#EmailAddress: $.Identity.ObtainedAPIS.ApisData.ContactInformation.EmailAddress,
											ns02#NotificationPreference: $.Identity.ObtainedAPIS.ApisData.ContactInformation.NotificationPreference,
											ns02#PostalCode: $.Identity.ObtainedAPIS.ApisData.ContactInformation.PostalCode,
											ns02#TelephoneNumber: $.Identity.ObtainedAPIS.ApisData.ContactInformation.TelephoneNumber		
										},
										ns02#CountryOfIssue: $.Identity.ObtainedAPIS.ApisData.CountryOfIssue,
										ns02#CountryOfResidence: $.Identity.ObtainedAPIS.ApisData.CountryOfResidence,
										ns02#DateOfBirth: $.Identity.ObtainedAPIS.ApisData.DateOfBirth,
										ns02#DocumentExpiryDate: $.Identity.ObtainedAPIS.ApisData.DocumentExpiryDate,
										ns02#DocumentIssueDate: $.Identity.ObtainedAPIS.ApisData.DocumentIssueDate,
										ns02#DocumentNumber: $.Identity.ObtainedAPIS.ApisData.DocumentNumber,
										ns02#DocumentType: $.Identity.ObtainedAPIS.ApisData.DocumentType,
										ns02#Firstname: $.Identity.ObtainedAPIS.ApisData.Firstname,
										ns02#Forenames: $.Identity.ObtainedAPIS.ApisData.Forenames,
										ns02#Gender: $.Identity.ObtainedAPIS.ApisData.Gender,
										ns02#ImageBytes: $.Identity.ObtainedAPIS.ApisData.ImageBytes,
										ns02#Nationality: $.Identity.ObtainedAPIS.ApisData.Nationality,
										ns02#RawCodeline: $.Identity.ObtainedAPIS.ApisData.RawCodeline,
										ns02#Surname: $.Identity.ObtainedAPIS.ApisData.Surname										
									},	
								},				
								ns02#ValidDocuments: if ($.Identity.ValidDocuments.APISDocumentSet != null) {
									ns02#APISDocumentSet: {
										ns02#IsSelected: $.Identity.ValidDocuments.APISDocumentSet.IsSelected,
										ns02#MainDocumentIssuerCountryCode: $.Identity.ValidDocuments.APISDocumentSet.MainDocumentIssuerCountryCode,
										ns02#MainDocumentType: $.Identity.ValidDocuments.APISDocumentSet.MainDocumentType
									}
								} else null
							},
							ns02#IsSelectableForBoardingPass: $.IsSelectableForBoardingPass,
							ns02#IsSelected: $.IsSelected,
							ns02#LastName: $.LastName,
							ns02#MarketingCarrierCode: $.MarketingCarrierCode,
							ns02#NativePassengerId: $.NativePassengerId,
							ns02#PassengerId: $.PassengerId,
							ns02#PassengerRPH: $.PassengerRPH,
							ns02#PassengerSequenceNumber: $.PassengerSequenceNumber,
							ns02#PaxType: $.PaxType,
							ns02#RequiresCheckin: $.RequiresCheckin,
							ns02#SSRs: {
								ns02#SSR: ($.SSRs.*SSR map (itemon, indexon) -> {
									ns02#Currency: itemon.Currency,
									ns02#FeeCode: itemon.FeeCode,
									ns02#FlightNumber: itemon.FlightNumber,
									ns02#PaxNumber: itemon.PaxNumber,
									ns02#Price: itemon.Price,
									ns02#SSRCode: itemon.SSRCode,
									ns02#SSRDescription: itemon.SSRDescription,				
								})
							},
							ns02#SeatNumber: $.SeatNumber,
							ns02#SeatPreference: {
								ns02#Name: $.SeatPreference.Name,
							}, 
													
							ns02#RequiresCheckin: $.RequiresCheckin,
							ns02#SeatNumber: $.SeatNumber,
							ns02#SeatPreference: {
								ns02#Name: $.SeatPreference.Name,
							},
							ns02#SupportsCheckin: $.SupportsCheckin,
							ns02#Title: $.Title
						})					
					}
				}
			}
		}
	}
}