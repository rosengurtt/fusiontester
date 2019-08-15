package fusiontester;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.XMLUnit;

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
	public static String CompareResults(String requestType, String loggedResponse, String actualResponse, Object expectedDCScalls, Object actualDCScalls) {
			Object[] expected = ((LinkedList)expectedDCScalls).toArray();
			Object[] actual = ((LinkedList)actualDCScalls).toArray();
			
			String DCScallsComparation = compareDCScalls(expected, actual);
			
			// If the calls made to the DCSs don't match then we report a problem
			if (DCScallsComparation != "OK") {
				String retVal = DCScallsComparation + "\r\nFusion response was:\r\n"  + actualResponse;
				return retVal;
			}
			
			// Otherwise we check if the fusion response is what we expected
			return CompareFusionResponses(requestType, loggedResponse, actualResponse);
	}
	
	
	// Compares the xml of the logged response with the actual response. 
	// It removes empty or null tags and ignores some specific tags like guids created for a specific request
	private static String CompareFusionResponses(String requestType, String loggedResponse, String actualResponse) {
		try {
	        XMLUnit.setIgnoreWhitespace(true);
	        XMLUnit.setIgnoreAttributeOrder(true);
	        
			loggedResponse = removeThingsWeDontCompare(requestType, loggedResponse);
			actualResponse = removeThingsWeDontCompare(requestType, actualResponse);	        
	
	        DetailedDiff diff = new DetailedDiff(XMLUnit.compareXML(loggedResponse, actualResponse));
	        String stringDifference = diff.toString().replace("org.custommonkey.xmlunit.DetailedDiff", "");
	        
	        if (stringDifference.equals("[identical]")) {
	        	return "OK";
	        }
	        String retVal = "Fusion responses don't match.\r\nDifferences are:\r\n" + stringDifference +
	        		"\r\nExpected response was:\r\n" + loggedResponse + "\r\nActual Response was:\r\n" + actualResponse;
			return retVal;
		}
		catch (Exception ex) {
			return ex.toString() + "Error comparing " + loggedResponse + " with " + actualResponse;	
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
				if (!expectedRequestType.toLowerCase().equals(actualRequestType.toLowerCase())) {
					if (retVal.equals("OK")) retVal = "DCS types of calls don't match.\r\n";
					retVal += "Call #" + Integer.toString(i) + " expected request type was " + expectedRequestType + " but the actual type was " + actualRequestType + ".\r\n";
				}
			}
		}
		if (!retVal.equals("OK")) {
				retVal = addDCSrequestsToMessage(actual, retVal);
		}
		return retVal;
	}
	
	private static String addDCSrequestsToMessage(Object[] data, String currentMessage) {
		currentMessage += "\r\nCalls made were:\r\n\r\n";
		for (int i = 0; i < data.length; i ++) {
			Map<String,String> call = (Map<String,String>) data[i];
			currentMessage += call.get("DcsRequestXml") + "\r\n\r\n";
		}
		return currentMessage;
	}
	private static String removeThingsWeDontCompare(String requestType, String xml) {
		
		// Remove namespaces
		xml = xml.replaceAll("xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"", "");
		xml = xml.replaceAll("xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"", "");
		
		// Remove whitespace between tags including carriage returns
		xml = xml.replaceAll(">\\s+<", "><");
		xml = xml.replaceAll("\r", "").replaceAll("\n", "");
		
		// Remove useless whitespace inside tags
		xml = xml.replaceAll("[\\s]*>", ">");
		
		// Remove null nodes
		xml = xml.replaceAll("<[a-zA-Z0-9 ]*xsi:nil=\"true\"/>","");
		xml = xml.replaceAll("<[a-zA-Z0-9 ]*/>","");
		xml = xml.replaceAll("<[A-Za-z0-9 ]*></[A-Za-z0-9 ]*>","").replaceAll("<[A-Za-z0-9 ]*></[A-Za-z0-9 ]*>","");
		
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
		return xml;
	}
	public static String RemoveProblematicTagsFromFusionRequest(String FusionActualRequest){
		return FusionActualRequest.replaceAll("<ns02:LastAPIS/>", "");
	}

}
