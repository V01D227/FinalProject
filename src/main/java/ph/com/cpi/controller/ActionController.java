package ph.com.cpi.controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import ph.com.cpi.model.Authenticator;
import ph.com.cpi.model.DBConnect;
import ph.com.cpi.model.RandomString;
import ph.com.cpi.model.SendEmail;
import ph.com.cpi.model.User;




public class ActionController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String ACTION = req.getParameter("action");
		RequestDispatcher dispatcher = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		Authenticator authenticator = new Authenticator();

		if (ACTION.equals("logout")) {

			dispatcher = req.getRequestDispatcher("login.jsp");

		}  else if (ACTION.equals("forgotpassword")) {

			dispatcher = req.getRequestDispatcher("pages/forgotPassword.jsp");

		} else if (ACTION.equals("forgotpass")) {

			String username = req.getParameter("username");
			String email = req.getParameter("email");

			String result = authenticator.authentiateUsernameEmail(username, email);

				if (result.equals("success")) {
	
					RandomString np = new RandomString();
					String newpassword = np.Random();
	
					System.out.println("newpass = " + newpassword);
					
					DBConnect db = new DBConnect("training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com", "ORCL", "TRNG", "cpi12345");
					conn = db.getConnection();
					try  {
						String queryName = "UPDATE users_3 SET password = ? WHERE username= ? and email= ?";
						pstmt = conn.prepareStatement(queryName);
						pstmt.setString(1, newpassword);
						pstmt.setString(2, username);
						pstmt.setString(3, email);
						
						Integer res = pstmt.executeUpdate();
						
					    conn.commit();
					} catch (Exception e) {
						System.out.println(e);
					}
					
					SendEmail sm = new SendEmail();
					
					sm.email(email, newpassword);
					
					dispatcher = req.getRequestDispatcher("login.jsp");
	
				} else {
					dispatcher = req.getRequestDispatcher("pages/notmatch.jsp");
				}

		} else if (ACTION.equals("login")) {
			
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			Boolean newUser = true;
			Cookie[] cookies = req.getCookies();
			String message ="";
			
			String result = authenticator.authenticate(username, password);
			
			if(result.equals("success")) {
				

				String ePoint = null;
				Statement stmt;
				try {
					
					DBConnect db = new DBConnect("training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com", "ORCL", "TRNG", "cpi12345");
				
					conn = db.getConnection();
					stmt = conn.createStatement();    
					ResultSet rs = stmt.executeQuery("SELECT endpoint "
							+ "FROM user_roles_3 "
							+ "INNER JOIN users_3 ON users_3.role_id=USER_ROLES_3.ROLE_ID "
							+ "WHERE USERS_3.USER_ID='"+username+"'");
					while (rs.next()) {
					ePoint = rs.getString("endpoint");
					 System.out.println("endpoint = " + ePoint);
					}
					rs.close();
					stmt.close();  
				}catch(Exception e) {
					System.out.println(e);
				}
				ePoint = "Producer";
				System.out.print(ePoint);
				
				if(ePoint.equals("Administrator")) {
				
				dispatcher = req.getRequestDispatcher("pages/AdminPage.jsp");
			
				} else if(ePoint.equals("Producer")) {
					
					dispatcher = req.getRequestDispatcher("pages/ProducerPage.jsp");
			
				} else if(ePoint.equals("Order Taker")) {
						
					dispatcher = req.getRequestDispatcher("pages/OrderTakerPage.jsp");
											
				} else if(ePoint.equals("Auditor")) {
							
					dispatcher = req.getRequestDispatcher("pages/AuditorPage.jsp");
					
				}
			
					User user = new User(username, password);
					req.setAttribute("user", user);
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
		}
		dispatcher.forward(req, resp);
	}
}
