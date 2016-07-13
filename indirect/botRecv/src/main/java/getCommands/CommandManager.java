package getCommands;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.nio.channels.FileChannel;

public class CommandManager {
	public static final String root     = "C:\\ProgramData\\recieve";
	public static final String path     = root + "\\test.au3";
	public static final String progPath = root + "\\AutoIt3.lnk";

	public static final String cmdLine = progPath + " " + path;
	
	public void printCommand(){
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
		ProcessBuilder pb = new ProcessBuilder("cmd", "/c",cmdLine);
		try {
			Process p = pb.start();
			p.waitFor();
		}catch (IOException | InterruptedException e) {
			 System.out.println(e);
		}		
	}
	
	@SuppressWarnings("resource")
	public void commandClean(){
		FileChannel outChan = null;
	    try {
	    	outChan = new FileOutputStream(path, true).getChannel();
			outChan.truncate(0);
			outChan.close();
		} catch (IOException e) {} 
	}
}
