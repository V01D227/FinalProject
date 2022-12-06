package ph.com.cpi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ph.com.cpi.model.User;

public class CheckSessionController extends HttpServlet{
	
	private static final long serialVersionUID = -5309170239201733916L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			RequestDispatcher dispatcher = null;
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			if (user != null) {
				req.setAttribute("user", user);
				dispatcher = req.getRequestDispatcher("personalInformation.jsp");
				dispatcher.forward(req, resp);
			} else {
				req.setAttribute("loginMessage", "Please Login");
				dispatcher = req.getRequestDispatcher("login.jsp");
				dispatcher.forward(req, resp);
			}
	}

}
