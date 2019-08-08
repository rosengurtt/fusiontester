package fusiontester;

import java.util.HashMap;

public class ProcessInput {
	
	public static HashMap setSearchParams(HashMap<String,String> inputData) {
		HashMap<String, String> retVal = new HashMap<String, String>();
		retVal.put("Airline", "%");
		retVal.put("Airport", "%");
		retVal.put("Airport", "%");
		retVal.put("StartDate", "2019-06-14 01:56:48");
		retVal.put("EndDate", "2019-06-14 01:59:53");
		retVal.put("DatabaseName", "FusionRequest");
		retVal.put("TableName", "FusionRequests");
		return retVal;
	}

}
