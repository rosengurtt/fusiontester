package dcsemulator.newSkies;

public class NewSkiesOutputTweaks {

	private static String addNamespaceToTag(String tag, String namespace, String text) {
		text = text.replaceAll("<" + tag + " ", "<" + tag + " xmlns=\\\"" + namespace + "\\\" ");
		return text.replaceAll("<" + tag + ">", "<" + tag + " xmlns=\\\"" + namespace + "\\\">");
	}

	public static String fixNamespaces(String airlineCode, String text) {
		String namespaceCommon = "http://schemas.navitaire.com/WebServices/DataContracts/Common";
		String namespaceBooking = "http://schemas.navitaire.com/WebServices/DataContracts/Booking";
		String namespaceOperation = "http://schemas.navitaire.com/WebServices/DataContracts/Operation";
		String nsBookingService = "http://schemas.navitaire.com/WebServices/ServiceContracts/BookingService";
		String nsOperationService = "http://schemas.navitaire.com/WebServices/ServiceContracts/OperationService";

		// The space after the word 'Booking' in the next statement is important, don't remove it
		if (text.startsWith("<Booking ")) {
			text = addNamespaceToTag("Booking", namespaceBooking, text); 
			if (airlineCode.toLowerCase().equals("ad")){
				text = addNamespaceToTag("State", namespaceCommon, text);
				text = addNamespaceToTag("OtherServiceInfoList", namespaceCommon, text);
				text = addNamespaceToTag("CarrierCode", namespaceCommon, text);
				text = addNamespaceToTag("FlightNumber", namespaceCommon, text);
			}
			if (airlineCode.toLowerCase().equals("w6") || airlineCode.toLowerCase().equals("w9")){
				text = addNamespaceToTag("State", namespaceCommon, text);
				text = addNamespaceToTag("OtherServiceInfoList", namespaceCommon, text);
				text = addNamespaceToTag("CarrierCode", namespaceCommon, text);
				text = addNamespaceToTag("FlightNumber", namespaceCommon, text);
				text = addNamespaceToTag("POS", namespaceCommon, text);
				text = addNamespaceToTag("SourcePOS", namespaceCommon, text);
				text = addNamespaceToTag("RecordLocators", namespaceCommon, text);
			//	text = addNamespaceToTag("FlightDesignator", namespaceCommon, text);
			//	text = addNamespaceToTag("ExtensionData", namespaceCommon, text);
			}	
			// The next line deduplicates any case where we added an already existing namespace
			String namespaceText = "xmlns=\"" + namespaceCommon + "\"";
			text = text.replace(namespaceText + " " + namespaceText, namespaceText);
		}
		// These are strange cases. The xml tag in the wire doesn't match the deserialized object in C#
		else if (text.startsWith("<CheckInBaggageResponseData")) {	
			text = text.replaceAll("CheckInBaggageResponseData", "checkInBaggageRespData");
			text = addNamespaceToTag("checkInBaggageRespData", namespaceOperation, text);
		}
		else if (text.startsWith("<SeatSellResponseData")) {	
			text = text.replaceAll("SeatSellResponseData", "seatSellRespData");
			text = addNamespaceToTag("seatSellRespData", namespaceBooking, text);
		}
		else if (text.startsWith("<AddPaymentToBookingResponseData")){
			text = text.replaceAll("<AddPaymentToBookingResponseData[^>]*>","<AddPaymentToBookingResponse xmlns=\"" + 
					nsBookingService + "\"><BookingPaymentResponse xmlns=\"" + namespaceBooking + "\">");
			text = text.replaceAll("</AddPaymentToBookingResponseData>","</BookingPaymentResponse></AddPaymentToBookingResponse>" + 
					"");
		}
		
		text = addNamespaceToTag("BookingUpdateResponseData", namespaceBooking, text);
		text = addNamespaceToTag("ProcessBaggageResponseData", namespaceOperation, text);
		text = addNamespaceToTag("CheckInPassengersResponseData", namespaceOperation, text);
		text = addNamespaceToTag("GetBarCodedBoardingPassesMultipleResponse", nsOperationService, text);
		return text;
	}
}
