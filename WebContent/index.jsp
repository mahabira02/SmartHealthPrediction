<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->
</head>
<body>
<%
if(request.getParameter("logout")!=null)
{
	session.invalidate();
	out.println("<script>alert('Logout Successfully')</script>");
}
%>
<div id="header">
  <div id="headerInner"><br />
    <%@include file="logo.jsp" %>
  </div>
  <div id="nav">
    <ul>
          <li><a class="active" href="#">Home</a></li>
      <li><a href="patient.jsp">Patient</a></li>
      <li><a href="doctor.jsp">Doctor</a></li>
      <li><a href="admin.jsp">Admin</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
</div>
<pre><h1> Hello!!! </h1></pre>
<p><space><h1><center>Welcome to online Health Prediction System</center></h1></space></p>
  
  <div align="center">
    <br><br>
    
    
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
