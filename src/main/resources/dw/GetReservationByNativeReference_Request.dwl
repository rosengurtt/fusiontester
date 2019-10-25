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
						ns01#Session: (i.*Session map (session, sessionIndex) -> {
							ns01#EndTime: '2029-10-04T12:08:36.0398892+01:00',
							ns01#KioskId: session.KioskId,
							ns01#PNR: session.PNR,
							ns01#Price: session.Price,
							ns01#ServiceConfigId: session.ServiceConfigId,
							ns01#SessionId: session.SessionId,
							ns01#StartTime: session.StartTime,
							ns01#Status: session.Status,
							ns01#UserId: session.UserId,
							ns01#Weight: session.Weight
						}),
						ns0#AirlineReference: i.AirlineReference,
						ns0#BoardingPassInfo: (i.*BoardingPassInfo  map (boardingInfo, boardingInfoIndex) -> {
							ns01#AirlineReference: boardingInfo.AirlineReference,
							ns01#ArrivalAirport: boardingInfo.ArrivalAirport,
							ns01#BarcodeData: boardingInfo.BarcodeData,
							ns01#BookingReference: boardingInfo.BookingReference,
							ns01#DepartureAirport: boardingInfo.DepartureAirport,
							ns01#DepartureDate: boardingInfo.DepartureDate,
							ns01#FastTrack: boardingInfo.FastTrack as Boolean,
							ns01#FirstName: boardingInfo.FirstName,
							ns01#FlightNumber: boardingInfo.FlightNumber,
							ns01#IATACode: boardingInfo.IATACode,
							ns01#LastName: boardingInfo.LastName,
							ns01#Seat: boardingInfo.Seat,
							ns01#SequenceNumber: boardingInfo.SequenceNumber
						}),
						ns0#NativeReference: i.NativeReference
					})
				}
			}
		}
}