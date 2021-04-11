package com.itodo;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class Dbhandler1
{
	public String username;
	Dbhandler1(String username){
		this.username=username;
	}
	Dbhandler1(){}
	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "";
	String url = "jdbc:mysql://localhost:3306/parag";
	SimpleDateFormat f = new SimpleDateFormat("yyyy-mm-dd");
	public boolean addtodos(String tt,String de,String ss, String dd) throws ClassNotFoundException,SQLException, ParseException{
		java.util.Date con = f.parse(dd);
		Class.forName(driver);
		String quer = "INSERT INTO todolist VALUES (?,?,?,?,?)";
		java.sql.Date d = new java.sql.Date(con.getTime());
		Connection cons = DriverManager.getConnection(url,user,pass);
		PreparedStatement pds = cons.prepareStatement(quer);
		pds.setString(1,tt);
		pds.setString(2,de);
		pds.setString(3,ss);
		pds.setDate(4,d);
		pds.setString(5, username);
		int rdf=pds.executeUpdate();
		if(rdf>0) {
			return true;
		}
		return false;
	}
	public boolean check_title(String title) throws ClassNotFoundException,SQLException, ParseException{
		String query = "SELECT * FROM todolist WHERE title=?";
		Class.forName(driver);
		  Connection cons = DriverManager.getConnection(url,user,pass);
	      PreparedStatement pst = cons.prepareStatement(query);
	      pst.setString(1, title);
	      ResultSet rs = pst.executeQuery();
	      if(rs.next()) {
	    	  return true;
	      }
	      else {
	    	  return false;
	      }
	}
	public boolean update_todo(String tt,String de,String ss, String dd) throws ClassNotFoundException,SQLException, ParseException{
		java.util.Date con = f.parse(dd);
		java.sql.Date d = new java.sql.Date(con.getTime());
		String query = "update todolist set desc_todo=?,status_todo=?,comp_data=? WHERE title=? ";
		Class.forName(driver);
		  Connection c = DriverManager.getConnection(url,user,pass);
	      PreparedStatement p = c.prepareStatement(query);
	      p.setString(1, de);
	      p.setString(2, ss);
	      p.setDate(3, d);
	      p.setString(4, tt);
	      int s=p.executeUpdate();
	      if(s>0) {
	    	  return true;
	      }
	      else {
	    	  return false;
	      }
	      }
	public boolean delete_todo(String tt)  throws ClassNotFoundException,SQLException, ParseException{
		String query = "DELETE FROM todolist WHERE title=?";
		Class.forName(driver);
		  Connection c = DriverManager.getConnection(url,user,pass);
	      PreparedStatement p = c.prepareStatement(query);
	      p.setString(1, tt);
	      if(p.executeUpdate()>0) {
	    	  return true;
	    	  }
	return false;
	}
}

