<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<!-- CSS only -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" ></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="styles/back.css">
	<title>iTodoList</title>
</head>
<body >
<%! boolean status; %>
<%
	String exists =(String) request.getAttribute("success");
	if(exists!=null)
	{ 
	if(exists.equals("okay")){
		%> <%@ include file="success.html"%>
	<%}
	else{
		%> <%@ include file="failure.html"%>
	<%}
}	
%>
<%
	String loggedin = (String)session.getAttribute("loggedin");
	if(loggedin!=null)
	{ 
	if(loggedin.equals("ok")){
		%> 
	<%}
	else{
		%> <%@ include file="failure.html"%>
	<%}
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
          <a class="nav-link active" aria-current="page" href="home.jsp">Your Todos</a>
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
    <button class="btn btn-success mx-2" data-bs-toggle="modal" data-bs-target="#sign">signup</button>
</div>
    </div>
  </div>
</nav>
<%@ include file="signup.html" %>
<form action="log.do" method="post" class="mx-auto my-4" style="width:350px;margin-top:120px;">
<h2 class="mx-auto my-4" align="center">Login For iTodoList</h2>
  <div class="mb-3">
    <label for="exampleInputEmail1"  class="form-label">Username</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="luser" aria-describedby="emailHelp" required>
    <div id="emailHelp" class="form-text" >We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1"  class="form-label">Password</label>
    <input type="password" class="form-control" name="lpass" id="exampleInputPassword1" required>
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
</form>
<%@ include file="footer.html" %>
</body>
</html>