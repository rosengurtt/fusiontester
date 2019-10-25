package fusiontester.methods;


public class GetReservationByNativeReference {
	
	public static String removeThingsWeDontCompare(String xml) {		
		// Tags we don't care
		xml = xml.replaceAll("<ResponseId[\\s\\S]{39}ResponseId>","");
		xml = xml.replaceAll("<DcsRequestsIds[\\s\\S]*DcsRequestsIds>","");
		xml = xml.replaceAll("<Flight><Id>[\\s\\S]{36}</Id>","<Flight>");
		xml = xml.replaceAll("<BaggageItem><Id>[\\s\\S]{36}</Id>","<BaggageItem>");
		xml = xml.replaceAll("<Passenger><PassengerId>[\\s\\S]{36}</PassengerId>","<Passenger>");
		xml = xml.replaceAll("<BaggageAllowance><Id>[\\s\\S]{36}</Id>","<BaggageAllowance>");
		xml = xml.replaceAll("<CreatedOn[\\s\\S]{32,40}CreatedOn>","");
		xml = xml.replaceAll("<InfantId[\\s\\S]{39}InfantId>","");
		xml = xml.replaceAll("<string>TransactionFlowLink=[^<]*</string>", "");
		xml = xml.replaceAll("<AdultPassengerId[\\s\\S]{39}AdultPassengerId>","");
		return xml;
	}
}
