package fusiontester;

import java.io.StringWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.XMLUnit;
import org.dom4j.DocumentHelper;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import fusiontester.methods.ActivateBag;
import fusiontester.methods.BuyAllowance;
import fusiontester.methods.CheckInPassenger;
import fusiontester.methods.GetBagLicensePlate;
import fusiontester.methods.GetReservationByNativeReference;
import fusiontester.methods.QuoteBag;

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
	
	// Compares the result of running the Fusion request agains the emulator and reports any differences
	// It checks not only that the final Fusion response looks the same as the logged response, it also checks that the calls
	// to the DCSs made by Fusion match the calls made originally when the data was logged
	public static HashMap<String,String>  CompareResults(String requestType, String loggedResponse, String actualResponse, Object expectedDCScalls, Object actualDCScalls) {
			Object[] expected = ((LinkedList)expectedDCScalls).toArray();
			Object[] actual = ((LinkedList)actualDCScalls).toArray();
			
			int NumberOfDifferences = 0;
			int DCScallsMatch = 1;
			String DcsComparison = compareDCScalls(expected, actual);
			String message = "OK";
			String actualDCScallsCleaned = "";
			String expectedDCScallsCleaned = "";
			HashMap<String,String> retVal = new HashMap<String,String>();
			
			loggedResponse = removeThingsWeDontCompare(requestType, loggedResponse);
			actualResponse = removeThingsWeDontCompare(requestType, actualResponse);
			
			if (DcsComparison != "OK") {	
				DCScallsMatch = 0;
				message = DcsComparison;
				actualDCScallsCleaned = GetDCScallsInAstring(actual);
				expectedDCScallsCleaned = GetDCScallsInAstring(expected);
			}
			
			DetailedDiff diff = CompareFusionResponses(requestType, loggedResponse, actualResponse);
			if (diff == null) {
				message = "Error comparing " + loggedResponse + " with " + actualResponse;
			}
			else if (!diff.identical()) {
				message = diff.toString().replace("org.custommonkey.xmlunit.DetailedDiff", "");
				NumberOfDifferences = diff.getAllDifferences().size();
				retVal.put("ExpectedResponseCleaned", prettyPrintXml(loggedResponse));
				retVal.put("ActualResponseCleaned", prettyPrintXml(actualResponse));
				actualDCScallsCleaned = GetDCScallsInAstring(actual);
				expectedDCScallsCleaned = GetDCScallsInAstring(expected);
			}
			else {
				retVal.put("ExpectedResponseCleaned", "");
				retVal.put("ActualResponseCleaned", "");
			}
			
			retVal.put("Message", message);
			retVal.put("actualDCScallsCleaned", actualDCScallsCleaned);
			retVal.put("expectedDCScallsCleaned", expectedDCScallsCleaned);
			retVal.put("NumberOfDifferences", Integer.toString(NumberOfDifferences));
			retVal.put("DCScallsMatch", Integer.toString(DCScallsMatch));
			return retVal;			
	}
	

	
	// Compares the xml of the logged response with the actual response. 
	// It removes empty or null tags and ignores some specific tags like guids created for a specific request
	private static DetailedDiff CompareFusionResponses(String requestType, String loggedResponse, String actualResponse) {
		try {
	        XMLUnit.setIgnoreWhitespace(true);
	        XMLUnit.setIgnoreAttributeOrder(true);   
			
	        return new DetailedDiff(XMLUnit.compareXML(loggedResponse, actualResponse));
		}
		catch (Exception ex) {
			return null;	
		}
	}
	
	
	
	// Compares the calls made by Fusion to the DCSs when running the tests with the calls logged when the original command was run in prod
	// It returns "OK" if the number and types of calls match (it doesn' currently compare the contents of the requests)
	// If it finds a different number or requests, or the types don't match, returns a message with info about the problem and the complete
	// list of actual requests made to the DCSs
	private static String compareDCScalls(Object[] expected, Object[] actual)
	{
		String retVal = "OK";
		if (actual.length != expected.length) {
			retVal = "DCS number of calls don't match. There were " + actual.length + " DCS calls, but " + expected.length + 
					" were expected.\r\n";
		}
		else {
			for (int i =0; i < expected.length; i++) {				
				Map<String,String> expectedCall = (Map<String,String>) expected[i];
				Map<String,String> actualCall = (Map<String,String>) actual[i];
				String expectedRequestType = expectedCall.get("RequestType");
				String actualRequestType = actualCall.get("DCSrequestType");
				// We compare now the request type
				// We use "contains" rather than "equals" because the actual request type may be a list of possible request types
				if (actualRequestType == null || !actualRequestType.toLowerCase().contains(expectedRequestType.toLowerCase())) {
					if (retVal.equals("OK")) retVal = "DCS types of calls don't match.\r\n";
					retVal += "Call #" + Integer.toString(i) + " expected request type was " + expectedRequestType + " but the actual type was " + actualRequestType + ".\r\n";
				}
			}
		}
		return retVal;
	}
	

	private static String GetDCScallsInAstring(Object[] data) {
		String retVal = "";
		for (int i = 0; i < data.length; i ++) {
			Map<String,String> call = (Map<String,String>) data[i];
			String callString = call.get("DcsRequestXml");
			// Remove soap header
			callString = callString.replaceAll("<[a-z]?[:]?Envelope [\\s\\S]*<[a-z]?[:]?Body[^>]*>", "");
			callString = callString.replaceAll("</[a-z]?[:]?Body>[.]*</[a-z]?[:]?Envelope>", "");
			// Remove namespaces
			callString = callString.replaceAll("xmlns[:]{0,1}[a-z]*=\"[^\"]*\"", "");
			callString = callString.replaceAll("xsi:nil", "nil");
			callString = callString.replaceAll("<[^:^>]*:", "<");
			callString = callString.replaceAll("</[^:^>]*:", "</");
			// Remove line with xml version
			callString = prettyPrintXml(callString) + "\n\n";	
			callString = callString.replaceAll("<\\?xml[^\\?]*\\?>", "");		
			retVal += callString;
		}
		return retVal;
	}
	private static String removeThingsWeDontCompare(String requestType, String xml) {	
		xml = RemoveNamespaces(xml);		
		xml = RemoveWhitespaceBetweenTags(xml);
		xml = RemoveNullNodes(xml);
		
		// RequestType dependent cleaning
		if (requestType.toLowerCase().equals("GetReservationByNativeReference".toLowerCase())) {
			return GetReservationByNativeReference.removeThingsWeDontCompare(xml);
		}
		else if (requestType.toLowerCase().equals("GetBagLicensePlate".toLowerCase())) {
			return GetBagLicensePlate.removeThingsWeDontCompare(xml);
		}
		else if (requestType.toLowerCase().equals("QuoteBag".toLowerCase())) {
			return QuoteBag.removeThingsWeDontCompare(xml);
		}
		else if (requestType.toLowerCase().equals("BuyAllowance".toLowerCase())) {
			return BuyAllowance.removeThingsWeDontCompare(xml);
		}
		else if (requestType.toLowerCase().equals("CheckInPassenger".toLowerCase())) {
			return CheckInPassenger.removeThingsWeDontCompare(xml);
		}
		else if (requestType.toLowerCase().equals("ActivateBag".toLowerCase())) {
			return ActivateBag.removeThingsWeDontCompare(xml);
		}
		return xml;
	}
	
	private static String RemoveNullNodes(String xml) {	
		// We iterate, because there are cases of nodes that have inside only null nodes. So in one cycle we remove the inner node
		// and in the next the oute one.
		for (int i=0; i < 5; i ++) {
			xml = xml.replaceAll("<[a-zA-Z0-9 ]*xsi:nil=\"true\"/>", "");
			xml = xml.replaceAll("<[a-zA-Z0-9 ]*/>", "");
			xml = xml.replaceAll("<[A-Za-z0-9 ]*></[A-Za-z0-9 ]*>", "");	
		}
		return xml;
	}
	private static String RemoveNamespaces(String xml) {
		xml = xml.replaceAll("xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"", "");
		xml = xml.replaceAll("xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"", "");
		return xml;
	}
	private static String RemoveWhitespaceBetweenTags(String xml) {
		xml = xml.replaceAll(">[\\s]*<", "><");
		return  xml.replaceAll("[\\s]*>", ">");
	}
	
	public static String RemoveProblematicTagsFromFusionRequest(String FusionActualRequest){
		return FusionActualRequest.replaceAll("<ns02:LastAPIS/>", "");
	}

	public static String prettyPrintXml(String xml) {
	    final StringWriter sw;

	    try {
	        final OutputFormat format = OutputFormat.createPrettyPrint();
	        final org.dom4j.Document document = DocumentHelper.parseText(xml);
	        sw = new StringWriter();
	        final XMLWriter writer = new XMLWriter(sw, format);
	        writer.write(document);
	    }
	    catch (Exception e) {
	        //throw new RuntimeException("Error pretty printing xml:\n" + xml, e);
	    	return xml;
	    }
	    return sw.toString();
	}
	

	
	public static String FormatCurrentDateTime(String currentDateTime) {
		String aux =  currentDateTime.replace("T",  " ");
		aux = aux.substring(0,"yyyy-mm-dd ss:ss:ss".length());
		return "\"" + aux + "\"";		
	}
}
