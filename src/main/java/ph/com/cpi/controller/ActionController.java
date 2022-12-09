package ph.com.cpi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ph.com.cpi.model.User;


public class ActionController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn;
		ResultSet rs;
		PreparedStatement stmt = null;
		
		String ACTION = req.getParameter("action");
		RequestDispatcher dispatcher = null;
		
		if (ACTION.equals("logout")) {
			HttpSession session = req.getSession();
			session.invalidate();
			dispatcher = req.getRequestDispatcher("login.jsp");
		}
		else if (ACTION.equals("signin")) {
			
			dispatcher = req.getRequestDispatcher("login.jsp");
			
		}
		else if (ACTION.equals("login")) {
			
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
						
							case "Administrator": dispatcher = req.getRequestDispatcher("adminpages/AdminPage.jsp");break;
								
							case "Producer": dispatcher = req.getRequestDispatcher("pages/ProducerPage.jsp"); break;
								
							case "Order Taker": dispatcher = req.getRequestDispatcher("pages/OrderTakerPage.jsp"); break;
												
							case "Auditor": dispatcher = req.getRequestDispatcher("pages/AuditorPage.jsp"); break;
												
							default : break;
						}
						
						User user = new User(username, password);
						req.setAttribute("epoint", user);
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
		}
		dispatcher.forward(req, resp);
	}
}
