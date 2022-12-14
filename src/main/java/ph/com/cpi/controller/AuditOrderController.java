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

import ph.com.cpi.model.AuditOrder;
import ph.com.cpi.model.Product;

public class AuditOrderController  extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Connection conn;
		ResultSet rs;
		Statement stmt;

		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:TRNG/cpi12345@training-db.cosujmachgm3.ap-southeast-1.rds.amazonaws.com:1521:ORCL";
			conn = DriverManager.getConnection(url);
			
			String query = "SELECT * FROM AUDIT_ORDER_3";
			ArrayList<AuditOrder> AuditOrderList = new ArrayList<AuditOrder>();
			
			if (conn == null) 
				System.out.println("Connection Failed!"+conn);
			else
			{
				System.out.println("Connection Successful!"+conn);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				while(rs.next()) 
				{
					
					AuditOrder auditOrderObject = new AuditOrder();
					auditOrderObject.setItemChangeID(rs.getInt("itemchange_id"));
					auditOrderObject.setUsername(rs.getString("username"));
					auditOrderObject.setItemID(rs.getString("item_id"));
					auditOrderObject.setFieldChanged(rs.getString("field_changed"));
					auditOrderObject.setOldValue(rs.getString("old_vale"));
					auditOrderObject.setNewValue(rs.getString("new_value"));
					auditOrderObject.setChangeDate(rs.getString("change_date"));
					AuditOrderList.add(auditOrderObject);
				}
				req.setAttribute("auditOrderData", AuditOrderList);
				dispatcher = req.getRequestDispatcher("auditorpages/AuditorPage.jsp");
				dispatcher.forward(req,  resp);
			}
			
		} catch (Exception e) {
			System.out.println("Failed to connect to database!");
			e.printStackTrace();
		}
	}		
}
