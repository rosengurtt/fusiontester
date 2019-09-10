package fusiontester;


import java.util.ArrayList;
import java.util.HashMap;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class UIhelpers {

		public static Object FormatTestForStoredProc(String payload) {
			HashMap<String, String> retVal = new HashMap<String, String>();
			JsonNode jsonPayload = null;
			if (payload != null && payload.length() > 0) {
				try {
					ObjectMapper mapper = new ObjectMapper();
					jsonPayload = mapper.readTree(payload);

					String includeAirports = convertArrayToString(jsonPayload.get("IncludeAirports"));
					retVal.put("IncludeAirports", includeAirports);
					
					String includeAirlines = convertArrayToString(jsonPayload.get("IncludeAirlines"));
					retVal.put("IncludeAirlines", includeAirlines);		
					
					String includeFusionRequestTypes = convertArrayToString(jsonPayload.get("IncludeFusionRequestTypes"));
					retVal.put("IncludeFusionRequestTypes", includeFusionRequestTypes);		
					
					retVal.put("TestName", getStringValue(jsonPayload, "TestName"));	
					retVal.put("TestDescription", getStringValue(jsonPayload, "TestDescription"));
					retVal.put("TestCreator", getStringValue(jsonPayload, "TestCreator"));
					retVal.put("FromDate", getStringValue(jsonPayload, "FromDate"));
					retVal.put("ToDate", getStringValue(jsonPayload, "ToDate"));
				}
				catch (Exception ex) {
					int i =5;
				}
			}			
			return retVal;
		}
		 private static String convertArrayToString(JsonNode jsonArray) {
				String retVal = "";
				for (final JsonNode airport : jsonArray) {
					retVal += "'"+ airport.textValue() + "',";
				}
				if (retVal.length() > 0) {
					retVal =  retVal.substring(0, retVal.length() - 1);
				}
				// If the user selected several items and "ALL" as well, remove "ALL".
				if (retVal.toLowerCase().startsWith("'all'") && !retVal.toLowerCase().equals("'all'"))
					retVal = retVal.substring("'ALL,'".length(), retVal.length());
				return retVal;
		 }
		 private static String getStringValue(JsonNode jsonPayload, String key) {
			 JsonNode value =jsonPayload.get(key);
			 if (value != null) return value.asText();
			 return "";
		 }
}

