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
		
		System.out.print("eventStart:");
		System.out.println(eventStart);
		System.out.print("savedCurrentDateTime:");
		System.out.println(savedCurrentDateTime);
		
		Date now = new Date();

		System.out.print("now:");
		System.out.println(now);
		
		long millisecondsEllapsed = now.getTime() - eventStart.getTime();

		System.out.print("millisecondsEllapsed:");
		System.out.println(millisecondsEllapsed);
		
		// I do the following correction because of problems with local time and utc time
		// There must be a cleaner way to do this instead of this hack, but I couldn't find how
		long OneHourInMilliseconds = 1000 * 3600;
		long OneMinute = 1000 * 60 * 2;
		if (millisecondsEllapsed > OneHourInMilliseconds - OneMinute) {
			millisecondsEllapsed -= OneHourInMilliseconds;
		}

		System.out.print("millisecondsEllapsed after correction:");
		System.out.println(millisecondsEllapsed);
		
		Date CalculatedCurrentDateTime = addMilliSeconds(simpleFormat.parse(savedCurrentDateTime), millisecondsEllapsed);

		System.out.print("CalculatedCurrentDateTime:");
		System.out.println(CalculatedCurrentDateTime);
		
		return simpleFormat.format(CalculatedCurrentDateTime);
	}
	
	public static Date addMilliSeconds(Date date, long milliSeconds) {
		System.out.print("Entre en addMilliSeconds.");
		    Calendar cal = Calendar.getInstance();
		    cal.setTime(date);
		    if (milliSeconds > 1000 * 60) {
		    	// If more than a minute has ellapsed, it means some external source updated the time, because there is a timeout of 45 seconds when
		    	// calling the Fusion service. In this case we return the current time, because it is probably right

				System.out.print("It looks like the system time has been reset externally. Keeping the time as it is.");
				System.out.println(new Date());
				
		    	return new Date();
		    }
		    else {
		    	System.out.print("Entre al else (milliSeconds > 1000 * 60");
		    	cal.add(Calendar.MILLISECOND, (int)milliSeconds);
			    return cal.getTime();
		    }
	}
	
	public static boolean IsErrorWasDueToSystemTimeChanges(String errorDescription, String eventDateTime)  {
		
		String ErrorMessage = "HTTP POST on resource ''http://local.fusion.aero:80/FusionService.svc'' failed: Timeout exceeded.";
		
		if (errorDescription.equals(ErrorMessage)) {
			System.out.println("Timeout calling Fusion because of system time changes");
			return true;
		}
		
		try {
			SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			Date eventStart = simpleFormat.parse(eventDateTime.substring(0,23));
			
			Date now = new Date();
			long millisecondsEllapsed = now.getTime() - eventStart.getTime();
			long oneMinute = 60 * 1000;
			
			if (millisecondsEllapsed > oneMinute) {
				System.out.println("The time when executing the Fusion request was not the time of the event and this is the likely cause for the error");
				return true;
			}
		}
		catch (Exception ex) {}
		return false;		
	}
	
	// Before starting a job, we verify that the system time was not somehow left with the value of the time of an event
	// We know that the real current time can not be older than the time the batch started.
	public static boolean CheckTheCurrentTimeLooksCorrect(String startBatchJobDateTime) throws ParseException {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date batchStart = simpleFormat.parse(startBatchJobDateTime.substring(0,23));		
		Date now = new Date();

		System.out.print("batchStart:");
		System.out.println(batchStart);

		if (now.getTime() < batchStart.getTime()) return false;
		return true;
	}
	
}
