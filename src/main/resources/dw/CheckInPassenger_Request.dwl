%dw 2.0
output application/xml skipNullOn = "everywhere"
ns a http://www.w3.org/2005/08/addressing
ns ns0 http://www.w3.org/2003/05/soap-envelope
ns ns01 http://services.fusion.aero
ns ns02 http://schemas.datacontract.org/2004/07/Fusion.Integration
---
{
	ns0#Envelope: {
		ns0#Header: {
			a#Action @(ns0#mustUnderstand: "1"): "http://services.fusion.aero/IFusionService/CheckInPassenger",
			a#MessageID: "urn:uuid:e933edc2-19c0-4e4e-87c2-8628bc7bf3b7",
			a#ReplyTo: {
				a#Address: "http://www.w3.org/2005/08/addressing/anonymous"
			},
			a#To @(ns0#mustUnderstand: "1"): "http://local.fusion.aero/FusionService.svc"
		},
		ns0#Body: {
			ns01#CheckInPassenger: {
				ns01#request: {
					ns02#DepartureAirportCode: payload.CheckInPassenger_Request.DepartureAirportCode,
					ns02#IataAirlineCode: payload.CheckInPassenger_Request.IataAirlineCode,
					ns02#MACAddress: payload.CheckInPassenger_Request.MACAddress,
					ns02#RequestId: payload.CheckInPassenger_Request.RequestId,
					ns02#RequestSourceName: payload.CheckInPassenger_Request.RequestSourceName,
					ns02#RequestType: payload.CheckInPassenger_Request.RequestType,
					ns02#TestRequest: payload.CheckInPassenger_Request.TestRequest as String default null,
					ns02#Session: {
						ns02#EndTime: payload.CheckInPassenger_Request.Session.EndTime as String default null,
						ns02#KioskId: payload.CheckInPassenger_Request.Session.KioskId,
						ns02#PNR: payload.CheckInPassenger_Request.Session.PNR,
						ns02#Price: payload.CheckInPassenger_Request.Session.Price as String default null,
						ns02#ServiceConfigId: payload.CheckInPassenger_Request.Session.ServiceConfigId,
						ns02#SessionId: payload.CheckInPassenger_Request.Session.SessionId,
						ns02#StartTime: payload.CheckInPassenger_Request.Session.StartTime as String default null,
						ns02#Status: payload.CheckInPassenger_Request.Session.Status,
						ns02#UserId: payload.CheckInPassenger_Request.Session.UserId,
						ns02#Weight: payload.CheckInPassenger_Request.Session.Weight as String default null
					},
					ns01#BagCountToCheckIn: payload.CheckInPassenger_Request.BagCountToCheckIn as String default null,
					ns01#Flights: {
						ns02#Flight: (payload.CheckInPassenger_Request.Flights.*Flight map {
							ns02#ApisRequired: $.ApisRequired as String default null,
							ns02#ArrivalTime: $.ArrivalTime as String default null,
							ns02#ConnectingFlight: $.ConnectingFlight as String default null,
							ns02#DepartureTime: $.DepartureTime as String default null,
							ns02#Destination: $.Destination,
							ns02#FlightNumber: $.FlightNumber as String default null,
							ns02#FlightRPH: $.FlightRPH as String default null,
							ns02#Id: $.Id,
							ns02#JourneyRPH: $.JourneyRPH as String default null,
							ns02#MarketingCarrier: $.MarketingCarrier,
							ns02#OpenForBoarding: $.OpenForBoarding as String default null,
							ns02#OpenForCheckIn: $.OpenForCheckIn as String default null,
							ns02#OperatingCarrier: $.OperatingCarrier,
							ns02#Origin: $.Origin,
							ns02#RequireMultipleAPISDocuments: $.RequireMultipleAPISDocuments as String default null,
							ns02#UTCArrivalTime: $.UTCArrivalTime as String default null,
							ns02#UTCDepartureTime: $.UTCDepartureTime as String default null
						})
					},
					ns01#Passengers: {
						ns02#Passenger: (payload.CheckInPassenger_Request.Passengers.*Passenger map {
							ns02#Active: $.Active as String default null,
							ns02#AllowanceRetrieved: $.AllowanceRetrieved as String default null,
							ns02#Boarded: $.Boarded as String default null,
							ns02#CheckedIn: $.CheckedIn as String default null,
							ns02#ClearanceRequired: $.ClearanceRequired as String default null,
							ns02#ClearanceStatus: $.ClearanceStatus,
							ns02#ConfirmedDga: $.ConfirmedDga as String default null,
							ns02#ConfirmedIdentity: $.ConfirmedIdentity as String default null,
							ns02#ConnectingFlightNumber: $.ConnectingFlightNumber as String default null,
							ns02#DateOfBirth: $.DateOfBirth as String default null,
							ns02#DocumentCheckRequired: $.DocumentCheckRequired as String default null,
							ns02#FirstName: $.FirstName,
							ns02#Identity: {
									ns02#LastAPIS: {
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
										ns02#DateOfBirth: $.Identity.LastAPIS.DateOfBirth as String default null,
										ns02#DocumentExpiryDate: $.Identity.LastAPIS.DocumentExpiryDate as String default null,
										ns02#DocumentIssueDate: $.Identity.LastAPIS.DocumentIssueDate as String default null,
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
										ns02#DateOfBirth: $.Identity.ObtainedAPIS.ApisData.DateOfBirth as String default null,
										ns02#DocumentExpiryDate: $.Identity.ObtainedAPIS.ApisData.DocumentExpiryDate as String default null,
										ns02#DocumentIssueDate: $.Identity.ObtainedAPIS.ApisData.DocumentIssueDate as String default null,
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
								ns02#ValidDocuments: {
									ns02#APISDocumentSet: {
										ns02#IsSelected: $.Identity.ValidDocuments.APISDocumentSet.IsSelected as String default null,
										ns02#MainDocumentIssuerCountryCode: $.Identity.ValidDocuments.APISDocumentSet.MainDocumentIssuerCountryCode default "",
										ns02#MainDocumentType: $.Identity.ValidDocuments.APISDocumentSet.MainDocumentType
									}
								}
							},
							ns02#IsSelectableForBoardingPass: $.IsSelectableForBoardingPass as String default null,
							ns02#IsSelected: $.IsSelected as String default null,
							ns02#LastName: $.LastName,
							ns02#MarketingCarrierCode: $.MarketingCarrierCode,
							ns02#NativePassengerId: $.NativePassengerId as String default null,
							ns02#PassengerId: $.PassengerId,
							ns02#PassengerRPH: $.PassengerRPH as String default null,
							ns02#PassengerSequenceNumber: $.PassengerSequenceNumber as String default null,
							ns02#PaxType: $.PaxType,
							ns02#RequiresCheckin: $.RequiresCheckin as String default null,
							ns02#SeatNumber: $.SeatNumber,
							ns02#SupportsCheckin: $.SupportsCheckin as String default null
						})					
					}
				}
			}
		}
	}
}