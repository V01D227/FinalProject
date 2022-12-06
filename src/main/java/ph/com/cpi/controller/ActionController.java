package ph.com.cpi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ph.com.cpi.model.Authenticator;
import ph.com.cpi.model.Product;
import ph.com.cpi.model.DBConnect;
import ph.com.cpi.model.User;
import ph.com.cpi.model.personalUser;

public class ActionController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Connection conn = null;
		ResultSet rs = null;
		
		String ACTION = req.getParameter("action");
		RequestDispatcher dispatcher = null;
		
		if (ACTION.equals("logout")) {
			
			dispatcher = req.getRequestDispatcher("login.jsp");
		}
		
		else if (ACTION.equals("order")) {

			try {
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
				conn = DriverManager.getConnection(url);
				
				String query = "SELECT * FROM PRODUCT_3";
				PreparedStatement stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				req.setAttribute("rs", rs);
				
				while(rs.next()) {
					
					String productID = rs.getString("product_id");
					String productName = rs.getString("product_name");
					String productDesc = rs.getString("product_description");
					String productPic = rs.getString("product_picture");
					String productStatus = rs.getString("product_description");
					float price = rs.getFloat("price");
					
					dispatcher = req.getRequestDispatcher("pages/Order.jsp");
					Product product = new Product(productID, productName, productDesc, productPic, productStatus, price);
					req.setAttribute("product", product);
				
				} 
				
				
			} catch (Exception e) {
				System.out.println("Failed to connect to database!");
				e.printStackTrace();
			}
		}
		else if (ACTION.equals("info")) {

		} else if (ACTION.equals("info")) {

			String firstname = req.getParameter("firstname");
			String middlename = req.getParameter("middlename");
			String lastname = req.getParameter("lastname");
			String birthday = req.getParameter("birthday");
			String age = req.getParameter("age");
			String salary = req.getParameter("salary");
			String pets = req.getParameter("pets");
			
			dispatcher = req.getRequestDispatcher("pages/displayInformation.jsp");
			personalUser personal = new personalUser(firstname, middlename, lastname, birthday, age, Double.parseDouble(salary), pets);
			req.setAttribute("personalInfo", personal);
			
		} else if (ACTION.equals("login")) {
			
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			Boolean newUser = true;
			Cookie[] cookies = req.getCookies();
			String message ="";
			
			
			Authenticator authenticator = new Authenticator();
			String result = authenticator.authenticate(username, password);
			
			if(result.equals("success")) {
				

				String ePoint = null;
				Statement stmt;
				try {
					
					DBConnect db = new DBConnect("training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com", "ORCL", "TRNG", "cpi12345");
					
					/*
					 * conn = db.getConnection(); String sql = "SELECT endpoint " +
					 * "FROM user_roles_3" +
					 * "INNER JOIN users_3 ON users_3.role_id=USER_ROLES_3.ROLE_ID" +
					 * "WHERE USERS_3.USER_ID='"+username+"'"; PreparedStatement stmt =
					 * conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery();
					 * 
					 * if (rs.next()) { System.out.println(rs.getString("endpoint")); ePoint =
					 * rs.getString("endpoint"); }
					 * 
					 * conn.close();
					 */
					conn = db.getConnection();
					stmt = conn.createStatement();    
					rs = stmt.executeQuery("SELECT endpoint "
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
		dispatcher.forward(req,  resp);
	}
}
