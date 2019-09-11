%dw 2.0
output application/xml 
ns a http://www.w3.org/2005/08/addressing
ns s http://www.w3.org/2003/05/soap-envelope
ns ns0 http://services.fusion.aero
ns ns01 http://schemas.datacontract.org/2004/07/Fusion.Integration
ns i http://www.w3.org/2001/XMLSchema-instance
---

{
	s#Envelope:{
		s#Header: 
			{
	          a#Action @(s#mustUnderstand: "1"): "http://services.fusion.aero/IFusionService/GetReservationByNativeReference",
	          a#MessageID: "urn:uuid:e933edc2-19c0-4e4e-87c2-8628bc7bf3b7",
	          a#ReplyTo: {
	          	a#Address: "http://www.w3.org/2005/08/addressing/anonymous"
	          },
	          a#To @(s#mustUnderstand: "1"): "http://local.fusion.aero/FusionService.svc"
	     	},
	     s#Body:
			{
				ns0#GetReservationByNativeReference: {
					ns0#request: {
						ns01#DepartureAirportCode: payload.GetReservationByNativeReference_Request.DepartureAirportCode,
						ns01#IataAirlineCode: payload.GetReservationByNativeReference_Request.IataAirlineCode,
						ns01#MACAddress: payload.GetReservationByNativeReference_Request.MACAddress,
						ns01#RequestId: payload.GetReservationByNativeReference_Request.RequestId,
						ns01#RequestSourceName: payload.GetReservationByNativeReference_Request.RequestSourceName,
						ns01#RequestType: payload.GetReservationByNativeReference_Request.RequestType,
						ns01#TestRequest: payload.GetReservationByNativeReference_Request.TestRequest as Boolean,
						ns01#Session: {
							ns01#EndTime: '2119-08-06T09:41:13.1896001Z' as DateTime,
							ns01#KioskId: payload.GetReservationByNativeReference_Request.Session.KioskId,
							ns01#PNR: payload.GetReservationByNativeReference_Request.Session.PNR,
							ns01#Price: payload.GetReservationByNativeReference_Request.Session.Price,
							ns01#ServiceConfigId: payload.GetReservationByNativeReference_Request.Session.ServiceConfigId,
							ns01#SessionId: payload.GetReservationByNativeReference_Request.Session.SessionId,
							ns01#StartTime: payload.GetReservationByNativeReference_Request.Session.StartTime,
							ns01#Status: payload.GetReservationByNativeReference_Request.Session.Status,
							ns01#UserId: payload.GetReservationByNativeReference_Request.Session.UserId,
							ns01#Weight: payload.GetReservationByNativeReference_Request.Session.Weight
						},
						ns0#AirlineReference: payload.GetReservationByNativeReference_Request.AirlineReference,
						ns0#BoardingPassInfo: {
							ns01#AirlineReference: payload.GetReservationByNativeReference_Request.BoardingPassInfo.AirlineReference,
							ns01#ArrivalAirport: payload.GetReservationByNativeReference_Request.BoardingPassInfo.ArrivalAirport,
							ns01#BarcodeData: payload.GetReservationByNativeReference_Request.BoardingPassInfo.BarcodeData,
							ns01#BookingReference: payload.GetReservationByNativeReference_Request.BoardingPassInfo.BookingReference,
							ns01#DepartureAirport: payload.GetReservationByNativeReference_Request.BoardingPassInfo.DepartureAirport,
							ns01#DepartureDate: payload.GetReservationByNativeReference_Request.BoardingPassInfo.DepartureDate,
							ns01#FastTrack: payload.GetReservationByNativeReference_Request.BoardingPassInfo.FastTrack as Boolean,
							ns01#FirstName: payload.GetReservationByNativeReference_Request.BoardingPassInfo.FirstName,
							ns01#FlightNumber: payload.GetReservationByNativeReference_Request.BoardingPassInfo.FlightNumber,
							ns01#IATACode: payload.GetReservationByNativeReference_Request.BoardingPassInfo.IATACode,
							ns01#LastName: payload.GetReservationByNativeReference_Request.BoardingPassInfo.LastName,
							ns01#Seat: payload.GetReservationByNativeReference_Request.BoardingPassInfo.Seat as String,
							ns01#SequenceNumber: payload.GetReservationByNativeReference_Request.BoardingPassInfo.SequenceNumber
						},
						ns0#NativeReference: payload.GetReservationByNativeReference_Request.NativeReference
					}
				}
			}
		}
}