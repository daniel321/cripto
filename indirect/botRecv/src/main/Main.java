package main;

import getCommands.CommandManager;
import getCommands.CommandUpdater;

public class Main {
	static int tsleep = 30;
	
	public static void main(String[] args){
		CommandManager manager = new CommandManager();
		CommandUpdater updater = new CommandUpdater();
		
		while(true){
		
			try {
			    Thread.sleep(tsleep*1000);                 //1000 milliseconds is one second.
			} catch(InterruptedException ex) {
			    Thread.currentThread().interrupt();
			}
			
			System.out.printf("despierto\n");			
			updater.updateCommands();
			manager.commandRun();
			manager.commandClean();
		}
	}
	
}
