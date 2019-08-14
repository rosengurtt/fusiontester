package fusiontester;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class Helpers {

	public static void SleepNmilliSeconds(long i) throws InterruptedException {		
		Thread.sleep(Math.round(i));
	}
	
	
	public static String SaveCurrentDateTime() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date());
	}
	public static long GetNumberOfSecondsFromDate(String oldDate) throws ParseException {
		oldDate = oldDate.substring(0, 19);		
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


		Date d1 = simpleFormat.parse(oldDate);
		Date d2 = new Date();
		long numberOfSeconds = (d2.getTime() - d1.getTime()) / 1000;		
		return numberOfSeconds;
	}
	
	
	public static String GetCurrentTimeFromSavedInfo(String eventDateTime, String savedCurrentDateTime) throws ParseException {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date eventStart = simpleFormat.parse(eventDateTime.substring(0,23));
		Date now = new Date();
		long millisecondsEllapsed = now.getTime() - eventStart.getTime();
		
		// I do the following correction because of problems with local time and utc time
		// There must be a cleaner way to do this instead of this hack, but I couldn't find how
		long OneHourInMilliseconds = 1000 * 3600;
		if (millisecondsEllapsed > OneHourInMilliseconds) {
			millisecondsEllapsed -= OneHourInMilliseconds;
		}
		
		Date CalculatedCurrentDateTime = addMilliSeconds(simpleFormat.parse(savedCurrentDateTime), (int)millisecondsEllapsed);
		
		return simpleFormat.format(CalculatedCurrentDateTime);
	}
	  public static Date addMilliSeconds(Date date, int seconds) {
		    Calendar cal = Calendar.getInstance();
		    cal.setTime(date);
		    cal.add(Calendar.MILLISECOND, seconds);
		    return cal.getTime();
		  }
	
}
