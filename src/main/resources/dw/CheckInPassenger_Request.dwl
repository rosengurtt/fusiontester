%dw 2.0
output application/xml
skipNullOn = "everywhere"
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
						ns02#Flight: {
							ns02#ApisRequired: payload.CheckInPassenger_Request.Flights.Flight.ApisRequired as String default null,
							ns02#ArrivalTime: payload.CheckInPassenger_Request.Flights.Flight.ArrivalTime as String default null,
							ns02#ConnectingFlight: payload.CheckInPassenger_Request.Flights.Flight.ConnectingFlight as String default null,
							ns02#DepartureTime: payload.CheckInPassenger_Request.Flights.Flight.DepartureTime as String default null,
							ns02#Destination: payload.CheckInPassenger_Request.Flights.Flight.Destination,
							ns02#FlightNumber: payload.CheckInPassenger_Request.Flights.Flight.FlightNumber as String default null,
							ns02#FlightRPH: payload.CheckInPassenger_Request.Flights.Flight.FlightRPH as String default null,
							ns02#Id: payload.CheckInPassenger_Request.Flights.Flight.Id,
							ns02#JourneyRPH: payload.CheckInPassenger_Request.Flights.Flight.JourneyRPH as String default null,
							ns02#MarketingCarrier: payload.CheckInPassenger_Request.Flights.Flight.MarketingCarrier,
							ns02#OpenForBoarding: payload.CheckInPassenger_Request.Flights.Flight.OpenForBoarding as String default null,
							ns02#OpenForCheckIn: payload.CheckInPassenger_Request.Flights.Flight.OpenForCheckIn as String default null,
							ns02#OperatingCarrier: payload.CheckInPassenger_Request.Flights.Flight.OperatingCarrier,
							ns02#Origin: payload.CheckInPassenger_Request.Flights.Flight.Origin,
							ns02#RequireMultipleAPISDocuments: payload.CheckInPassenger_Request.Flights.Flight.RequireMultipleAPISDocuments as String default null,
							ns02#UTCArrivalTime: payload.CheckInPassenger_Request.Flights.Flight.UTCArrivalTime as String default null,
							ns02#UTCDepartureTime: payload.CheckInPassenger_Request.Flights.Flight.UTCDepartureTime as String default null
						}
					},
					ns01#Passengers: (payload.CheckInPassenger_Request.*Passengers map {
						ns02#Passenger: {
							ns02#Active: $.Passenger.Active as String default null,
							ns02#AllowanceRetrieved: $.Passenger.AllowanceRetrieved as String default null,
							ns02#Boarded: $.Passenger.Boarded as String default null,
							ns02#CheckedIn: $.Passenger.CheckedIn as String default null,
							ns02#ClearanceRequired: $.Passenger.ClearanceRequired as String default null,
							ns02#ClearanceStatus: $.Passenger.ClearanceStatus,
							ns02#ConfirmedDga: $.Passenger.ConfirmedDga as String default null,
							ns02#ConfirmedIdentity: $.Passenger.ConfirmedIdentity as String default null,
							ns02#ConnectingFlightNumber: $.Passenger.ConnectingFlightNumber as String default null,
							ns02#DateOfBirth: $.Passenger.DateOfBirth as String default null,
							ns02#DocumentCheckRequired: $.Passenger.DocumentCheckRequired as String default null,
							ns02#FirstName: $.Passenger.FirstName,
							ns02#Identity: {
								ns02#ObtainedAPIS: {
									ns02#ApisData: {
										ns02#CountryOfResidence: $.Passenger.Identity.ObtainedAPIS.ApisData.CountryOfResidence,
										ns02#DateOfBirth: $.Passenger.Identity.ObtainedAPIS.ApisData.DateOfBirth as String default null,
										ns02#DocumentExpiryDate: $.Passenger.Identity.ObtainedAPIS.ApisData.DocumentExpiryDate as String default null,
										ns02#DocumentIssueDate: $.Passenger.Identity.ObtainedAPIS.ApisData.DocumentIssueDate as String default null,
										ns02#DocumentType: $.Passenger.Identity.ObtainedAPIS.ApisData.DocumentType
									}
								},
								ns02#ValidDocuments: {
									ns02#APISDocumentSet: {
										ns02#IsSelected: $.Passenger.Identity.ValidDocuments.APISDocumentSet.IsSelected as String default null,
										ns02#MainDocumentIssuerCountryCode: $.Passenger.Identity.ValidDocuments.APISDocumentSet.MainDocumentIssuerCountryCode default "",
										ns02#MainDocumentType: $.Passenger.Identity.ValidDocuments.APISDocumentSet.MainDocumentType
									}
								}
							},
							ns02#IsSelectableForBoardingPass: $.Passenger.IsSelectableForBoardingPass as String default null,
							ns02#IsSelected: $.Passenger.IsSelected as String default null,
							ns02#LastName: $.Passenger.LastName,
							ns02#MarketingCarrierCode: $.Passenger.MarketingCarrierCode,
							ns02#NativePassengerId: $.Passenger.NativePassengerId as String default null,
							ns02#PassengerId: $.Passenger.PassengerId,
							ns02#PassengerRPH: $.Passenger.PassengerRPH as String default null,
							ns02#PassengerSequenceNumber: $.Passenger.PassengerSequenceNumber as String default null,
							ns02#PaxType: $.Passenger.PaxType,
							ns02#RequiresCheckin: $.Passenger.RequiresCheckin as String default null,
							ns02#SeatNumber: $.Passenger.SeatNumber,
							ns02#SupportsCheckin: $.Passenger.SupportsCheckin as String default null
						}						
					})
				}
			}
		}
	}
}