package fusiontester.methods;

public class GetBagLicensePlate {
	public static String removeThingsWeDontCompare(String xml) {		
		// Tags we don't care
		xml = xml.replaceAll("<DcsRequestsIds[\\s\\S]*DcsRequestsIds>","");
		xml = xml.replaceAll("<ResponseId[\\s\\S]{39}ResponseId>","");
		xml = xml.replaceAll("<LicensePlate>[\\s\\S]{4,10}</LicensePlate>","");
		// Remove the 'Z' in dates
		xml = xml.replaceAll("<([A-Za-z0-9]*Date)>([0-9:T.-]*)Z</\\1>","<$1>$2</$1>");
		return xml;
	}
}
