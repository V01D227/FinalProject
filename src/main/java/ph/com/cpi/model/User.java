package ph.com.cpi.model;

public class User {
	
	private String username;
	private String password;
	private String endpoint;
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public String getEndpoint() {
		return endpoint;
	}
	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
