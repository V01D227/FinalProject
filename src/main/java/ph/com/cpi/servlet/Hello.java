package ph.com.cpi.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {
	
	private static final long serialVersionUID = 8193022877411737735L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String title = "Hello " + firstName;
		
		out.println("<html>" +
					"<head><title>" + title + "</title></head>" +
					"<body>" +
					"<h1>Hello </h1><h2>" + lastName + ", " + firstName + "</h2>" +
					"<h3>example.</h3>" +
					"</html>") ;
	}
}
