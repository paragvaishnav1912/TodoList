package com.itodo;
import java.sql.*;
public class Dbhandler {
	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "";
	String url = "jdbc:mysql://localhost:3306/parag";
	String usern="";
	public boolean adduser(String username,String password) throws ClassNotFoundException, SQLException {
		Class.forName(driver);
		String query = "INSERT INTO jk VALUES(?, ?)";
		String query1 = "SELECT * FROM jk WHERE username=?";
		boolean flag=false;
		Connection con = DriverManager.getConnection(url,user,pass);
		PreparedStatement ps = con.prepareStatement(query1);
		ps.setString(1,username);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			flag=false;
		}
		else {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,username);
			pst.setString(2, password);
			int r=pst.executeUpdate();
			if(r>0) {
				
				flag=true;
			}
		}
		return flag;
	}
	public boolean checkuser(String username,String password) throws ClassNotFoundException,SQLException{
		Class.forName(driver);
		String query = "SELECT * FROM jk WHERE USERNAME=? AND PASSWORD=?";
		Connection con = DriverManager.getConnection(url,user,pass);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1,username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return true;
		}
		return false;
	}
	
}