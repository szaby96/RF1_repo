package main;

import static spark.Spark.get;
import static spark.Spark.port;

public class Main {
	
	static final int PORT = 8081;

	public static void main(String[] args) {
		port(PORT);
		
		get("/hello", (req, res) -> "Hello from our Java Spark server");
	}

}
