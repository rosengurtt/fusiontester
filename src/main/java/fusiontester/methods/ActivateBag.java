package fusiontester.methods;

public class ActivateBag {
	public static String removeThingsWeDontCompare(String xml) {		
		// Tags we don't care
		xml = xml.replaceAll("<ResponseId[\\s\\S]{38,40}ResponseId>","");
		xml = xml.replaceAll("<BaggageItemId[\\s\\S]{38,40}BaggageItemId>","");
		xml = xml.replaceAll("<CreatedOn[\\s\\S]{32,40}CreatedOn>","");
		return xml;
	}
}

