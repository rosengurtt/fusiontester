package fusiontester;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.XMLUnit;

public class ProcessData {

	// It splits the data in n arrays, so each array can be processed in parallel
	public static Object[] splitRowsToRun(Object data, int parallelRuns) {
		LinkedList linkedListData = (LinkedList)data;
		Object[] allItems = linkedListData.toArray();
		Object[] dataForRuns = (parallelRuns < allItems.length)? new Object[parallelRuns]: new Object[allItems.length];
		int runLength = (int)Math.ceil(allItems.length / (double)parallelRuns);
		
		int from = 0;
		for (int n = 0; n < parallelRuns; n++) {
			int to = ((from + runLength) < allItems.length) ? from + runLength: allItems.length;
			dataForRuns[n] = Arrays.copyOfRange(allItems, from, to);
			if (to >= allItems.length) {
				return dataForRuns;
			}
			from += runLength;
		}
		return dataForRuns;
	}
	

	
	public static String getFusionRequestIdToProcess(Object mapItem) {
		Map<String, String> item = (Map<String, String>)mapItem;
		return item.get("FusionRequestId");
		
	}
	
	public static String CompareFusionResponses(String requestType, String loggedResponse, String actualResponse) {
		try {
	        XMLUnit.setIgnoreWhitespace(true);
	        XMLUnit.setIgnoreAttributeOrder(true);
	        
			loggedResponse = removeThingsWeDontCompare(requestType, loggedResponse);
			actualResponse = removeThingsWeDontCompare(requestType, actualResponse);	        

	        DetailedDiff diff = new DetailedDiff(XMLUnit.compareXML(loggedResponse, actualResponse));
	        String stringDifference = diff.toString();
	        
	        if (stringDifference.equals("org.custommonkey.xmlunit.DetailedDiff[identical]")) {
	        	return "OK";
	        }
			return diff.toString();
		}
		catch (Exception ex) {}
		return "Error comparing " + loggedResponse + " with " + actualResponse;		
		
	}
	
	private static String removeThingsWeDontCompare(String requestType, String xml) {
		
		// Remove namespaces
		xml = xml.replaceAll("xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"", "");
		xml = xml.replaceAll("xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"", "");
		
		// Remove whitespace between tags including carriage returns
		xml = xml.replaceAll(">\\s+<", "><");
		xml = xml.replaceAll("\r", "").replaceAll("\n", "");
		
		// Remove null nodes
		xml = xml.replaceAll("<[a-zA-Z0-9 ]*xsi:nil=\"true\"/>","");
		xml = xml.replaceAll("<[a-zA-Z0-9 ]*/>","");
		xml = xml.replaceAll("<[A-Za-z0-9 ]*></[A-Za-z0-9 ]*>","").replaceAll("<[A-Za-z0-9 ]*></[A-Za-z0-9 ]*>","");
		
		// RequestType dependent cleaning
		if (requestType.toLowerCase().equals("GetReservationByNativeReference".toLowerCase())) {
			return GetReservationByNativeReference.removeThingsWeDontCompare(xml);
		}
		return xml;
	}
	

}
