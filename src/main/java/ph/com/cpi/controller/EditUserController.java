package ph.com.cpi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EditUserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String ACTION = req.getParameter("action");
		
		if (ACTION.equals("edituser")) {
			
			try {
	
				String username = req.getParameter("username");
				String email = req.getParameter("email");
				String roleS = req.getParameter("role");
				String status = req.getParameter("status");
				String useridS = req.getParameter("userid");
				
				
				int role = Integer.parseInt(roleS);
				int userid = Integer.parseInt(useridS);
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
				conn = DriverManager.getConnection(url);
		
				String query = "UPDATE USERS_3 SET username = ?, email = ?, role_id = ?, user_status = ? WHERE user_id = ?";
				stmt = conn.prepareStatement(query);
				
				stmt.setString(1, username);
				stmt.setString(2, email);
				stmt.setInt(3, role);
				stmt.setString(4, status);
				stmt.setInt(5, userid);
				
				Integer res = stmt.executeUpdate();
				
				if(res > 0) {
					System.out.println("User Updated!");
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
}
