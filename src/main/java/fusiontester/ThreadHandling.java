package fusiontester;

public class ThreadHandling {

	public static void SleepNseconds(int i) throws InterruptedException {		
		Thread.sleep(1000* i);
	}
}
