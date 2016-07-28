package getCommands;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

import main.Paths;

public class CommandManager {
	public final Paths paths;

	public CommandManager(Paths paths) {
		this.paths = paths;
	}

	public void printCommand() {
		BufferedReader br;
		try {
			br = new BufferedReader(new FileReader(paths.autoIt3_script()));
			String line = null;
			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void commandRun() {
		String cmdLine = paths.autoIt3_executable() + " " + paths.autoIt3_script();
		ProcessBuilder pb = new ProcessBuilder("cmd", "/c", cmdLine);
		try {
			Process p = pb.start();
			p.waitFor();
		} catch (IOException | InterruptedException e) {
			System.out.println(e);
		}
	}

	public void commandClean() throws IOException {
		try (FileOutputStream str = new FileOutputStream(paths.autoIt3_script(), true)) {
			str.getChannel().truncate(0);
		}
	}
}
