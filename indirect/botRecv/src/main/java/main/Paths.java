package main;

public class Paths {
	private String root;
	
	public Paths(String root) {
		this.root = root;
	}
	
	public String root() {
		return root;
	}
	
	public String date() {
		return root + "\\date.txt";
	}
	
	public String autoIt3_executable() {
		return root + "\\AutoIt3.lnk";
	}
	
	public String autoIt3_script() {
		return root + "\\test.au3";
	}
}
