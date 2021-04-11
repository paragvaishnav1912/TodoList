package com.itodo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/log.do")
public class logindo extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("luser");
		String pass = request.getParameter("lpass");
		PrintWriter pw = response.getWriter();
		Dbhandler db = new Dbhandler();
		try {
			HttpSession session = request.getSession(false);
			if(db.checkuser(user,pass)) {
				
				session.setAttribute("loggedin", "ok");
				session.setAttribute("user", user);
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						rd.forward(request, response);
			}
			else {
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
						rd.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
