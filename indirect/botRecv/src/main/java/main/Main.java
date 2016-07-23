package main;

import java.io.IOException;

import javax.mail.MessagingException;

import getCommands.CommandManager;
import getCommands.CommandUpdater;

public class Main {
	static int tsleep = 5;

	public static void main(String[] args) throws MessagingException, IOException {
		CommandManager manager = new CommandManager();
		CommandUpdater updater = new CommandUpdater();

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
