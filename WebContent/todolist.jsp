<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">iTodoList</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Your Todo</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About us</a>
        </li>
      </ul>
      <div class="mx-2">
   		<a class="btn btn-success" href="logout.jsp">Logout</a>
	</div>
    </div>
  </div>
</nav>
<%!String msg="",title="";
	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "";
	String url = "jdbc:mysql://localhost:3306/parag";
	String get_data = "SELECT * FROM todolist WHERE title=?";
	String a="",b="",c="",d="",e="";
	String ty="";
	boolean flag=false;
%>
	<%
	try{
	if(request.getParameter("update").equals("yes")){
		flag=true;
	ty=request.getParameter("username");
	if(session.getAttribute("user")!=null)
	{
		Class.forName(driver);
		  Connection cons = DriverManager.getConnection(url,user,pass);
	      PreparedStatement pst = cons.prepareStatement(get_data);
	      pst.setString(1, ty);
	      ResultSet rs = pst.executeQuery(); 	
	      if(rs.next()){
	    	  e=rs.getString(1);
	    	  a=rs.getString(2);
	    	  b=rs.getString(3);
	    	  c=rs.getString(4);
	      }
	}
	}
	else{
			flag=false;
	}
	}
	catch(Exception e){
	e.printStackTrace();
	}
	%>
<% if(flag) {%>
	<p style="font-size:3.0rem" align="center">Edit your Todo</p>
<form action="addto.do" method="post" name="frm" style="width:350px;margin-top:120px;" class="mx-auto my-4">
    <label for="exampleInputEmail1"  class="form-label">Todo Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value="<%=e%>" name="tt" aria-describedby="emailHelp">
    <div class="mb-3">
     <label for="exampleInputEmail1"  class="form-label">Todo Discription</label>
    <input type="text" class="form-control" id="exampleInputEmail1"  value="<%=a%>"  name="td" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
 <label for="exampleInputEmail1"  class="form-label">Todo Status</label>
    <input type="text" class="form-control" id="exampleInputEmail1" value = "<%=b%>" name="st" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
     <label for="exampleInputEmail1" class="form-label">Complition Date</label>
    <input type="Date" class="form-control" name="dt" value = "<%=c%>" id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
  <button type="submit" class="btn btn-primary">Update Todo</button>
</form>
<%} 
 else { %>
 	<p style="font-size:3.0rem" align="center">Add your Todo List</p>
<form action="addto.do" method="post" name="frm" style="width:350px;margin-top:120px;" class="mx-auto my-4">
    <label for="exampleInputEmail1"  class="form-label">Todo Title</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="tt" aria-describedby="emailHelp">
    <div class="mb-3">
     <label for="exampleInputEmail1" class="form-label">Todo Discription</label>
    <input type="text" class="form-control" id="exampleInputEmail1"   name="td" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
 <label for="exampleInputEmail1"   class="form-label">Todo Status</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="st" aria-describedby="emailHelp">
    </div>
    <div class="mb-3">
     <label for="exampleInputEmail1"  class="form-label">Complition Date</label>
    <input type="Date" class="form-control" name="dt"  id="exampleInputEmail1" aria-describedby="emailHelp">
    </div>
  <button type="submit" class="btn btn-primary">Add Todo</button>
</form>

<%} %>
</body>
<script>
function validation(){
	alert("SAdf");
  var a=document.frm.tt.value;
  return
  console.log(a);
}
</script>
</html>