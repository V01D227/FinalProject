package ph.com.cpi.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet extends HttpServlet{
	
	private static final long serialVersionUID = -58298444197757633L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><body>");
		pw.println("Hello Servlet!");
		pw.println("</body></html>");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		
		pw.println("<html><body>");
		pw.println("Hello Servlet Post!");
		pw.println("</body></html>");
	}
}
