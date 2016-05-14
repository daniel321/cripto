import java.io.*;
import java.net.*;
import java.nio.file.*;

class Impl {
	public static final String path = "C:\\Users\\daniel\\Desktop\\recieve\\test.au3";
	public static final String cmdLine = "C:\\Users\\daniel\\Desktop\\recieve\\AutoIt3.lnk C:\\Users\\daniel\\Desktop\\recieve\\test.au3";
	public static final int port = 9500;	
	
	public void test(){
		truncateAndAdd(addSleep(50));
		agregaLinea(addClick(700, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(800, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(900, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(1000, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(1100, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(1000, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(900, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(800, 300));
		agregaLinea(addSleep(50));
		agregaLinea(addClick(700, 300));
		agregaLinea(addSleep(50));
		run();		
		
		ejecutarLinea(addClick(700, 300));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 400));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 500));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 600));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 700));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 600));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 500));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 400));
		ejecutarLinea(addSleep(25));
		ejecutarLinea(addClick(700, 300));
		ejecutarLinea(addSleep(25));
	}
	
	public String addClick(int x,int y) {
		return ("MouseClick(\"left\", " + x + ", " + y + ")\n");
	}
	
	public String addSleep(int t) {
		return ("sleep(" + t + ")\n");
	}
	
	@SuppressWarnings("deprecation")
	public void processMsgs(){
		ServerSocket serverSock = null;
        String line;
        Socket clientSocket = null;

        try {
           serverSock = new ServerSocket(port);
        }
        catch (IOException e) {
           System.out.println(e);
        }   

		while(true){
			try {
				clientSocket = serverSock.accept();
				line = new DataInputStream(clientSocket.getInputStream()).readLine();
				ejecutarLinea(line);
				//System.out.println(line);
				
				clientSocket.close();
			}   
			catch (IOException e) {
				System.out.println(e);
			}
		}
	}
	
	public void run() {
		ProcessBuilder pb = new ProcessBuilder("cmd", "/c",cmdLine);
		try {
			Process p = pb.start();
			p.waitFor();
		}catch (IOException | InterruptedException e) {
			 System.out.println(e);
		}		
	}
	
	public void agregaLinea(String line) {
		try {
			Files.write(Paths.get(path), line.getBytes(), StandardOpenOption.APPEND);
		}catch (IOException e) {
			 System.out.println(e);
		}
	}

	public void truncateAndAdd(String line){
		try {
			Files.write(Paths.get(path), line.getBytes(), StandardOpenOption.TRUNCATE_EXISTING);
		}catch (IOException e) {
			 System.out.println(e);
		}
	}
	
	public void ejecutarLinea(String line) {
		truncateAndAdd(line);
		run();
	}
}