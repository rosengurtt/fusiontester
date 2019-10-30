package dcsemulator.Lufthansa;

public class LufthansaOutputTweaks {

	public static String fixNamespaces(String text) {
		text = text.replaceAll("(<IATA_Passenger[a-zA-Z]*RS)", "$1 xmlns=\"http://www.iata.org/IATA/2007/00\"");
		text = text.replaceAll("(<IATA_Baggage[a-zA-Z]*RS)", "$1 xmlns=\"http://www.iata.org/IATA/2007/00\"");
		return text;	
	}
	
}
