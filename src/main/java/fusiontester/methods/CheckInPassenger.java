package fusiontester.methods;

public class CheckInPassenger {

	public static String removeThingsWeDontCompare(String xml) {		
		// Tags we don't care
		xml = xml.replaceAll("<Id[\\s\\S]{36,40}Id>","");
		xml = xml.replaceAll("<DcsRequestsIds[\\s\\S]*DcsRequestsIds>","");
		xml = xml.replaceAll("<ResponseId[\\s\\S]{38,40}ResponseId>","");
		xml = xml.replaceAll("<RequestId[\\s\\S]{38,40}RequestId>","");
		xml = xml.replaceAll("<CreatedOn[\\s\\S]{32,40}CreatedOn>","");
		xml = xml.replaceAll("<PassengerId>[\\s\\S]{36}</PassengerId>","");
		return xml;
	}
}
