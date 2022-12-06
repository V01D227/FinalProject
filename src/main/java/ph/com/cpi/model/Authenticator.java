package ph.com.cpi.model;

public class Authenticator {
	
	public String authenticate(String username, String password) {
		if("cpi".equals(username) && "admin".equals(password)) {
			return "success";
		} else {
			return "failed";
		}
	}
}
