package ph.com.cpi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ph.com.cpi.model.Authenticator;
import ph.com.cpi.model.User;
import ph.com.cpi.model.personalUser;

public class ActionController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String ACTION = req.getParameter("action");
		RequestDispatcher dispatcher = null;
		
		if (ACTION.equals("logout")) {
			
			dispatcher = req.getRequestDispatcher("login.jsp");
			
		}
		else if (ACTION.equals("info")) {
			
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
		}
		
		else if (ACTION.equals("login")) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		Boolean newUser = true;
		Cookie[] cookies = req.getCookies();
		String message ="";
		Authenticator authenticator = new Authenticator();
		String result = authenticator.authenticate(username, password);
		
		if(result.equals("success")) {
			dispatcher = req.getRequestDispatcher("pages/personalInformation.jsp");
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
