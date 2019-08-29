package fusiontester;

public class ThreadHandling {

	public static void SleepNseconds(long i) throws InterruptedException {		
		Thread.sleep(Math.round(i/4));
	}
}
