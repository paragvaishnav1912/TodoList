package com.itodo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/addto.do")
public class todohandler extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String title= request.getParameter("title");
		Dbhandler1 db1 = new Dbhandler1();
		try {
			if(db1.delete_todo(title)) {
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			}
			else {
				out.println("ho gaya wah bete mojna kardi");
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("tt");
		String dd = request.getParameter("td");
		String st = request.getParameter("st");
		String dt = request.getParameter("dt");
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");
		PrintWriter pw = response.getWriter();
		Dbhandler1 db1;
		try 
		{
			db1 = new Dbhandler1(user);
			if(!db1.check_title(title)) 
			{
				if(db1.addtodos(title,dd,st,dt)) {
					request.setAttribute("signal", "Your Todo is successfully Addedd..");
					RequestDispatcher rd = request.getRequestDispatcher("todolist.jsp");
					rd.forward(request, response);
				}
				else {
					request.setAttribute("signal", "something went wrong");
					}		
			} 
		else {
			
			if(db1.update_todo(title, dd, st, dt)) {
				request.setAttribute("signal", "Your Todo is successfully Updated..");
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("signal", "something went wrong");
				}	
		}
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		catch (SQLException e) {
		e.printStackTrace();
			}
		catch(ParseException pe) {
			pe.printStackTrace();
		}
	}
}
