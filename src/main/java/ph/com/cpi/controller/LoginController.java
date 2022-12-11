package ph.com.cpi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ph.com.cpi.model.Product;
import ph.com.cpi.model.User;
import ph.com.cpi.model.UserList;

public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		Connection conn;
		ResultSet rs;
		PreparedStatement stmt = null;
		RequestDispatcher dispatcher = null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
			conn = DriverManager.getConnection(url);
			
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			Boolean newUser = true;
			Cookie[] cookies = req.getCookies();
			String message ="";
			
			String query = "SELECT ur.endpoint FROM USER_ROLES_3 ur, USERS_3 u WHERE u.role_id = ur.role_id AND u.username = ? AND u.password = ?";
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, username);
			stmt.setString(2, password);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				

				String ePoint = rs.getString("endpoint");
				System.out.print(ePoint);
				
				switch(ePoint) {
				
					case "Administrator":
						
						try {
							String query2 = "SELECT u.user_id, u.role_id, ur.endpoint, u.username, u.password, u.email FROM USERS_3 u, USER_ROLES_3 ur WHERE u.role_id = ur.role_id";
							ArrayList<UserList> userlist = new ArrayList<UserList>();
							
							System.out.println("Connection Successful!"+conn);
							Statement cstmt = conn.createStatement();
							rs = cstmt.executeQuery(query2);
							while(rs.next()) 
							{

								UserList ulObject = new UserList();
								ulObject.setUserID(rs.getInt("user_id"));
								ulObject.setRoleID(rs.getInt("role_id"));
								ulObject.setEndpoint(rs.getString("endpoint"));
								ulObject.setUsername(rs.getString("username"));
								ulObject.setPassword(rs.getString("password"));
								ulObject.setEmail(rs.getString("email"));
								userlist.add(ulObject);
								
							}
							
							dispatcher = req.getRequestDispatcher("adminpages/AdminUserList.jsp");
							req.setAttribute("userData", userlist);
							
							HttpSession session = req.getSession();
							session.setAttribute("userlist", userlist);
							
						} catch (Exception e) {
							System.out.println("Failed to connect to database!");
							e.printStackTrace();
						}
					 break;
						
					case "Producer": dispatcher = req.getRequestDispatcher("pages/ProducerPage.jsp"); break;
						
					case "Order Taker": dispatcher = req.getRequestDispatcher("pages/OrderTakerPage.jsp"); break;
										
					case "Auditor": dispatcher = req.getRequestDispatcher("pages/AuditorPage.jsp"); break;
										
					default : break;
				}
				
				User user = new User(username, password);
				req.setAttribute("user", user);
				req.setAttribute("ep", ePoint);
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				
				if(cookies != null) {
					for(Cookie cookie: cookies) {
						if((cookie.getName().equals("repeatUser")) && (cookie.getValue().equals("yes"))) {
							newUser = false;
							break;
						}
					}
				}
				if(newUser) {
					Cookie returnUserCookie = new Cookie("repeatUser","yes");
					returnUserCookie.setMaxAge(1000);
					resp.addCookie(returnUserCookie);
					message = "Welcome new user " + user.getUsername() + "!";
				} else {
					message = "Welcome back user " + user.getUsername() + "!";
				}
				
				req.setAttribute("message", message);
				
			} else {
				dispatcher = req.getRequestDispatcher("pages/error.jsp");
			}
		} catch (Exception e) {
			System.out.println("Failed to connect to database!");
			e.printStackTrace();
		}
		dispatcher.forward(req, resp);
	}
}
