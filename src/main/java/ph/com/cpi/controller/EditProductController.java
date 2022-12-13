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


public class EditProductController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {

			String productID = req.getParameter("productID");
			String productName = req.getParameter("productName");
			String productDesc = req.getParameter("productDesc");
			String productPic = req.getParameter("productPic");
			String productStatus = req.getParameter("productStatus");
			String productPrice = req.getParameter("productPrice");
			
			float price = Float.parseFloat(productPrice);
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
			conn = DriverManager.getConnection(url);
	
			String query = "UPDATE PRODUCT_3 SET product_name = ?, product_description = ?, product_picture = ?, product_status = ?, price = ? WHERE product_id = ?";
			stmt = conn.prepareStatement(query);
		
			stmt.setString(1, productName);
			stmt.setString(2, productDesc);
			stmt.setString(3, productPic);
			stmt.setString(4, productStatus);
			stmt.setFloat(5, price);
			stmt.setString(6, productID);
			
			Integer res = stmt.executeUpdate();
			
			if(res > 0) {
				System.out.println("Product Updated!");
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
