package fusiontester.methods;


public class GetReservationByNativeReference {
	
	public static String removeThingsWeDontCompare(String xml) {		
		// Tags we don't care
		xml = xml.replaceAll("<ResponseId[\\s\\S]{39}ResponseId>","");
		xml = xml.replaceAll("<DcsRequestsIds[\\s\\S]*DcsRequestsIds>","");
		xml = xml.replaceAll("<Flight><Id>[\\s\\S]{36}</Id>","<Flight>");
		xml = xml.replaceAll("<BaggageItem><Id>[\\s\\S]{36}</Id>","<BaggageItem>");
		xml = xml.replaceAll("<BaggageAllowance><Id>[\\s\\S]{36}</Id>","<BaggageAllowance>");
		xml = xml.replaceAll("<CreatedOn[\\s\\S]{32,40}CreatedOn>","");
		xml = xml.replaceAll("<InfantId[\\s\\S]{39}InfantId>","");
		xml = xml.replaceAll("<string>TransactionFlowLink=[^<]*</string>", "");
		xml = xml.replaceAll("<AdultPassengerId[\\s\\S]{39}AdultPassengerId>","");
		xml = xml.replaceAll("<BaggageAllowanceId[\\s\\S]{39}BaggageAllowanceId>","");
		xml = xml.replaceAll("<PassengerId[\\s\\S]{39}PassengerId>","");
		xml = xml.replaceAll("<RegisteredTime[\\s\\S]{0,38}RegisteredTime>","");
		xml = xml.replaceAll("<PrintedTime[\\s\\S]{0,38}PrintedTime>","");
		return xml;
	}
}
