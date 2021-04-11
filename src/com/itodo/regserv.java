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
@WebServlet("/regpls")
public class regserv extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String user = request.getParameter("emi");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		String success =  "okay";
		Dbhandler db = new Dbhandler();
		if(repass.equals(pass)) 
		{
			try {
				if(db.adduser(user,pass)) {
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					request.setAttribute("success","okay");
					rd.forward(request, response);
				}
				else {
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					request.setAttribute("success","nahi");
					rd.forward(request, response);
				}
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("success","nahi");
			rd.forward(request, response);
		}
	}

}
