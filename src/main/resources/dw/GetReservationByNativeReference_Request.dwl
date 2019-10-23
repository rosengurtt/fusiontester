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
					ns0#request: (payload.*GetReservationByNativeReference_Request map (i, index) -> {
						ns01#DepartureAirportCode: i.DepartureAirportCode,
						ns01#IataAirlineCode: i.IataAirlineCode,
						ns01#MACAddress: i.MACAddress,
						ns01#RequestId: i.RequestId,
						ns01#RequestSourceName: i.RequestSourceName,
						ns01#RequestType: i.RequestType,
						ns01#TestRequest: i.TestRequest as Boolean,
						ns01#Session: {
							ns01#EndTime: '2119-08-06T09:41:13.1896001Z' as DateTime,
							ns01#KioskId: i.Session.KioskId,
							ns01#PNR: i.Session.PNR,
							ns01#Price: i.Session.Price,
							ns01#ServiceConfigId: i.Session.ServiceConfigId,
							ns01#SessionId: i.Session.SessionId,
							ns01#StartTime: i.Session.StartTime,
							ns01#Status: i.Session.Status,
							ns01#UserId: i.Session.UserId,
							ns01#Weight: i.Session.Weight
						},
						ns0#AirlineReference: i.AirlineReference,
						ns0#BoardingPassInfo: {
							ns01#AirlineReference: i.BoardingPassInfo.AirlineReference,
							ns01#ArrivalAirport: i.BoardingPassInfo.ArrivalAirport,
							ns01#BarcodeData: i.BoardingPassInfo.BarcodeData,
							ns01#BookingReference: i.BoardingPassInfo.BookingReference,
							ns01#DepartureAirport: i.BoardingPassInfo.DepartureAirport,
							ns01#DepartureDate: i.BoardingPassInfo.DepartureDate,
							ns01#FastTrack: i.BoardingPassInfo.FastTrack as Boolean,
							ns01#FirstName: i.BoardingPassInfo.FirstName,
							ns01#FlightNumber: i.BoardingPassInfo.FlightNumber,
							ns01#IATACode: i.BoardingPassInfo.IATACode,
							ns01#LastName: i.BoardingPassInfo.LastName,
							ns01#Seat: i.BoardingPassInfo.Seat,
							ns01#SequenceNumber: i.BoardingPassInfo.SequenceNumber
						},
						ns0#NativeReference: i.NativeReference
					})
				}
			}
		}
}