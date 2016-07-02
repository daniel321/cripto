package getCommands;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

public class CommandManager {
	public static final String path     = "C:\\ProgramData\\recieve\\test.au3";
	public static final String progPath = "C:\\ProgramData\\recieve\\AutoIt3.lnk";
	
	public static final String cmdLine = progPath + " " + path;
	
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
