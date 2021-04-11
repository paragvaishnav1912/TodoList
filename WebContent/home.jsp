<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.itodo.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! String msg=""; %>
<%
		String err = (String) request.getAttribute("signal");
		if(err!=null){
			msg = err;%>
			<div class="alert alert-success alert-dismissible fade show mb-0" role="alert">
			  <p> <%= msg%> </p>
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		<%}
	%>
<%! String user_name=""; %>
<%
		if(session.getAttribute("loggedin")==null){
			response.sendRedirect("index.jsp");
		}
		else{
			 user_name = (String)session.getAttribute("user");
		}
%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">iTodoList</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About us</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      <div class="mx-2">
   		<a class="btn btn-success" href="logout.jsp">Logout</a>
	</div>
    </div>
  </div>
</nav>
<h1 style="color:white"></h1>
	<h2 style="color:white;font-size:3.0rem" align="center">Your TodoLists</h2>
	<a class=" btn btn-success mx-4" href="todolist.jsp?username=no&&update=no">Add Todolists</a>
<%!
int index=0;
String driver = "com.mysql.cj.jdbc.Driver";
String user = "root";
String pass = "";
String temp="";
String url = "jdbc:mysql://localhost:3306/parag";
String q = "SELECT * FROM todolist WHERE username = ? ";
%>

<div id="notes" class="row container-fluid" > 
  <% 
	if(session.getAttribute("user")!=null){
		String username = (String) session.getAttribute("user");
		Class.forName(driver);
		Connection cons = DriverManager.getConnection(url,user,pass);
      PreparedStatement pst = cons.prepareStatement(q);
      pst.setString(1, username);
      ResultSet rs = pst.executeQuery(); 	
      %>
	 <%  while(rs.next()) { %>
	 <div class="card" style="width: 21rem;margin: 12px;">
  	<div class="card-body">
      <h5 class="card-title"><%=rs.getString(1)%></h5>
      <p class="card-text mb-1 my-3"><%=rs.getString(3) %></p>
     <P class="card-text">The Excepted Date is :<%=rs.getString(4)%></P>
<div class="d-grid gap-2 d-md-block">
 <a class="btn btn-primary" href="todolist.jsp?username=<%=rs.getString(1)%>&&update=yes" style="text-decoration:none;margin-right:12px">Edit</a>
 <a class="btn btn-primary" href="addto.do?title=<%=rs.getString(1)%>"  style="text-decoration:none;margin-right:12px">Delete</a>
</div>
</div>
  </div>
      <% } %>
<%} %>
 </div>
</body>
</html>