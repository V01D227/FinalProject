package ph.com.cpi.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ph.com.cpi.model.Product;
import ph.com.cpi.model.UserList;

public class UserListController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn;
		ResultSet rs;
		Statement stmt;

		RequestDispatcher dispatcher = null;
		
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
			conn = DriverManager.getConnection(url);
			
			String query = "SELECT u.user_id, u.role_id, ur.endpoint, u.username, u.password, u.email FROM USERS_3 u, USER_ROLES_3 ur WHERE u.role_id = ur.role_id";
			ArrayList<UserList> userlist = new ArrayList<UserList>();
			
			if (conn == null) 
				System.out.println("Connection Failed!"+conn);
			else
			{
				System.out.println("Connection Successful!"+conn);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
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
				req.setAttribute("userData", userlist);
				dispatcher = req.getRequestDispatcher("adminpages/AdminUserList.jsp");
				dispatcher.forward(req,  resp);
			}
			
		} catch (Exception e) {
			System.out.println("Failed to connect to database!");
			e.printStackTrace();
		}
		
	}
}
