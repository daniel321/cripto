package main;

import getCommands.CommandManager;
import getCommands.CommandUpdater;

public class Main {
	static int tsleep = 5;

	public static void main(String[] args) {
		CommandManager manager = new CommandManager();
		CommandUpdater updater = new CommandUpdater();

		while (true) {

			try {
				System.out.printf("dormido\n");
				Thread.sleep(tsleep * 1000); // 1000 milliseconds is one second.
				manager.commandClean();
			} catch (InterruptedException ex) {
				Thread.currentThread().interrupt();
			}

			System.out.printf("despierto\n");
			updater.updateCommands();
			// manager.printCommand();
			manager.commandRun();
		}
	}

}
