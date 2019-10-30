package fusiontester;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;


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
	
	// This function is used to restore the system time to the current time
	// To do that we count how many milliseconds elapsed since we set back the time, and we add
	// that number of milliseconds to the saved "current date time".
	// It is possible that the system time has been set externally to the right current time, and in that case the number of milliseconds
	// passed to addMilliSeconds will be giagantic. In that case, we don't set the time to the real current time, because it is already right
	public static Date addMilliSeconds(Date date, long milliSeconds) {
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
	
	// This function is used to recover from a situation where we have set the system time to the time of the Fusion event we are 
	// running, and for whatever reason the system time was not restored to the real current time after Fusion completed
	// We wait a maximum of time that corresponds to the fusion tester timeout
	public static boolean CheckSystemTimeIsRestored(String eventDateTime, String currentDateTime, long timeOutInMilliseconds)   {
		System.out.print("Entre en CheckTimeIsRestoreds.");
		try {

			SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			Date storedCurrentDateTime = simpleFormat.parse(currentDateTime.substring(0,23));
			Date storedEventDateTime = simpleFormat.parse(eventDateTime.substring(0,23));
			
			long sleepingTimeInMilliseconds = 50; //We sleep some time before testing again to avoid creating unnecessary load to the CPU
			long maxIterations = timeOutInMilliseconds / sleepingTimeInMilliseconds;
			int iteration = 0;
			long oneHourInMilliseconds = 1000 * 60 * 60; 	// We assume the time of the event is at the very least an hour in the past
															// If the time difference is longer than an hour, it is because we are comparing
															// with the time of the event
					
			while (iteration < maxIterations) {
				Thread.sleep(sleepingTimeInMilliseconds); 
				Date systemDate = new Date();
				long elapsedTimeInMillisecondsFromCurrentTime = java.lang.Math.abs(storedCurrentDateTime.getTime() - systemDate.getTime());					
				
				if (elapsedTimeInMillisecondsFromCurrentTime < oneHourInMilliseconds) {
					System.out.print("CheckSystemTimeIsRestored() found out that the system time was not reset after a timeout\n");
					return true;	
				}
				
				iteration += 1;
			}
			System.out.print("CheckTimeIsRestoreds is returning false\n");
			// If we reached this point, it means that we have reached the time out and the system time is still the time of the event
			return false;
		}
		catch (Exception ex) {
			System.out.print(ex.getMessage());
		}
		System.out.print("CheckTimeIsRestoreds is returning true because it raised an exception\n");
		// Fail safe. If there is any issue, assume that there is no need to change the system time
		return true;
		
	}
	
	public static boolean IsErrorWasDueToSystemTimeChanges(String errorDescription, String eventDateTime)  {
		
		String ErrorMessage1 = "HTTP POST on resource ''http://local.fusion.aero:80/FusionService.svc'' failed: Timeout exceeded.";
		String ErrorMessage2 = "HTTP POST on resource 'http://local.fusion.aero:80/FusionService.svc' failed: Remotely closed.";
		
		System.out.println("An error happened when calling Fusion. The errorDescription is:\n" + errorDescription + "\n\n");
		
		if (errorDescription.equals(ErrorMessage1)) {
			System.out.println("Timeout calling Fusion because of system time changes");
			return true;
		}
		
		try {
			SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			Date eventStart = simpleFormat.parse(eventDateTime.substring(0,23));
			
			Date now = new Date();
			long millisecondsEllapsed = now.getTime() - eventStart.getTime();
			// The timeout is less than a minute, but due to summer time, the difference somehow may be 1 hour
			long oneHourPlusOneMinute = 60 * 1000 + 3600 * 1000;
			
			if (millisecondsEllapsed > oneHourPlusOneMinute) {
				System.out.println("The time when executing the Fusion request was not the time of the event and this is the likely cause for the error");
				System.out.print("millisecondsEllapsed: ");
				System.out.println(millisecondsEllapsed);
				return true;
			}
		}
		catch (Exception ex) {}
		return false;		
	}
	
	// Before starting a job, we verify that the system time was not somehow left with the value of the time of an event
	// We know that the real current time can not be older than the time the batch started.
	public static boolean CheckTheCurrentTimeLooksCorrect(String startBatchJobDateTime) throws ParseException {
		System.out.println("Running CheckTheCurrentTimeLooksCorrect");
		
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		Date batchStart = simpleFormat.parse(startBatchJobDateTime.substring(0,23));		
		Date now = new Date();

		long oneSecond = 60 * 1000;
		long timeDif = now.getTime() - batchStart.getTime() + oneSecond;
		System.out.println("Time difference in milliseconds:" + Long.toString(timeDif));

		// We add a second just in case. If the system time was sent to the time of an event, this is at least hours before the current time
		if (timeDif > 0) {
			System.out.println("CheckTheCurrentTimeLooksCorrect says time looks OK");
			return true;
		}
		else {
			System.out.println("CheckTheCurrentTimeLooksCorrect says time looks wrong (because now < time batch started)");
			return false;
		}
	}
	
	public static int GenerateRandomNumber(int min, int max) {
		Random rand = new Random();
		return rand.nextInt(max - min + 1) + min;
	}
	public static void SleepVariableMilliSeconds(int min, int max) throws InterruptedException {
		Random rand = new Random();
		Thread.sleep(rand.nextInt(max - min + 1) + min);
	}
	
}
