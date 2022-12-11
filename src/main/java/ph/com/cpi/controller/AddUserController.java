package ph.com.cpi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddUserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		RequestDispatcher dispatcher = null;

		try {

			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String role = req.getParameter("role");
			
			System.out.println(username);
			System.out.println(email);
			System.out.println(password);
			System.out.println(role);
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
			conn = DriverManager.getConnection(url);
	
			String query = "INSERT INTO USERS_3 (role_id, username, password, email) VALUES (?, ?, ?, ?)";
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, role);
			stmt.setString(2, username);
			stmt.setString(3, password);
			stmt.setString(4, email);
			
			Integer res = stmt.executeUpdate();
			if(res > 0) {
				System.out.println("Data inserted!");
			}
			
		conn.commit();
		
		} catch (Exception e) {
		try {
				conn.rollback();
			} catch (Exception e2) {
				e.printStackTrace();
			}
			System.out.println("An exception occured.");
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("Error occured while closing connection.");
				e.printStackTrace();
			}
		}
	}
}
