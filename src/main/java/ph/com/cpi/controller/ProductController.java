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

import ph.com.cpi.model.Product;

public class ProductController extends HttpServlet {
	
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
			
			String query = "SELECT * FROM PRODUCT_3";
			ArrayList<Product> productList = new ArrayList<Product>();
			
			if (conn == null) 
				System.out.println("Connection Failed!"+conn);
			else
			{
				System.out.println("Connection Successful!"+conn);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				while(rs.next()) 
				{
					
					Product productObject = new Product();
					productObject.setProductID(rs.getInt("product_id"));
					productObject.setProductName(rs.getString("product_name"));
					productObject.setProductDesc(rs.getString("product_description"));
					productObject.setProductPic(rs.getString("product_picture"));
					productObject.setProductStatus(rs.getString("product_status"));
					productObject.setPrice(rs.getFloat("price"));
					productList.add(productObject);
				}
				req.setAttribute("productData", productList);
				dispatcher = req.getRequestDispatcher("adminpages/AdminProducts.jsp");
				dispatcher.forward(req,  resp);
			}
			
		} catch (Exception e) {
			System.out.println("Failed to connect to database!");
			e.printStackTrace();
		}
	}
}
