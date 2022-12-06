package ph.com.cpi.model;

import java.sql.Connection; 
import java.sql.DriverManager;

public class DBConnect {
	private String server;
	private String database;
	private String user;
	private String password;
	


public DBConnect(String server, String dbName, String username, String password){
	this.server = server;
	this.database = dbName;
	this.user = username;
	this.password= password;
}

public Connection getConnection() {
	Connection conn = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:" + this.getUser() + "/" + this.getPassword() + "@" + this.getServer() + ":1521:" + this.getDatabase();
		System.out.println("Successfully connected to database");
		conn = DriverManager.getConnection(url);
		if(conn != null) {
			System.out.println("Successfully connected to database");
			
		}
	}catch(Exception e) {
		System.out.println(e.getMessage());
		System.out.println("Failed to connect to database!");
	}
	return conn;
	}


public String getServer() {
	return server;
}

public void setServer(String server) {
	this.server = server;
}

public String getDatabase() {
	return database;
}

public void setDatabase(String database) {
	this.database = database;
}

public String getUser() {
	return user;
}

public void setUser(String user) {
	this.user = user;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}



}

