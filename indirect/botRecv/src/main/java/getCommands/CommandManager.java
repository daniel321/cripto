package getCommands;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

public class CommandManager {
	public static final String root = "C:\\ProgramData\\recieve";
	public static final String path = root + "\\test.au3";
	public static final String progPath = root + "\\AutoIt3.lnk";

	public static final String cmdLine = progPath + " " + path;

	public void printCommand() {
		BufferedReader br;
		try {
			br = new BufferedReader(new FileReader(path));
			String line = null;
			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void commandRun() {
		ProcessBuilder pb = new ProcessBuilder("cmd", "/c", cmdLine);
		try {
			Process p = pb.start();
			p.waitFor();
		} catch (IOException | InterruptedException e) {
			System.out.println(e);
		}
	}

	public void commandClean() throws IOException {
		try (FileOutputStream str = new FileOutputStream(path, true)) {
			str.getChannel().truncate(0);
		}
	}
}
