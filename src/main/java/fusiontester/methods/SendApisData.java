package fusiontester.methods;

public class SendApisData {

	public static String removeThingsWeDontCompare(String xml) {		
		// Tags we don't care
		xml = xml.replaceAll("<ResponseId[\\s\\S]{38,40}ResponseId>","");
		xml = xml.replaceAll("<DcsRequestsIds[\\s\\S]*DcsRequestsIds>","");
		return xml;
	}
}
