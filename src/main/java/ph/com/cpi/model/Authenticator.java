package ph.com.cpi.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Authenticator {
	
	public String authenticate(String username, String password) {
		
		Connection conn = null;
		String status = "failed";
		try {
			
			DBConnect db = new DBConnect("training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com", "ORCL", "TRNG", "cpi12345");
			
			conn = db.getConnection();
			
			
			
			String sql = "SELECT * FROM users_3 WHERE username = '"+username+"' and password = '"+password+"'";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			stmt.close();
			
			
			if(rs.next()) {
				status = "success";
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
		
		
	}
}
