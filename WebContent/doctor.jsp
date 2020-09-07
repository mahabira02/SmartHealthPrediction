<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->
</head>
<body>
<div id="header">
  <div id="headerInner"><br />
    <%@include file="logo.jsp" %>
  </div>
  <div id="nav">
    <ul>
          <li><a href="index.jsp">Home</a></li>
      <li><a href="patient.jsp">Patient</a></li>
      <li><a  class="active" href="doctor.jsp">Doctor</a></li>
      <li><a href="admin.jsp">Admin</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
  
  <div align="center">
    <br><br>
     <h1> Welcome to Doctor's Login Page</h1><br>
    <form action="doctorlogin" method="post">
   <table>
   <tr>
   <td>Email: </td>
   <td><input type="text" name="email" required></td>
   </tr>
<tr>
   <td>Password: </td>
   <td><input type="password" name="password" required></td>
   </tr>   
   
   <tr>
   <td><input type="submit" name="Login" value="Login"></td>
   <td><a href="doctorregistration.jsp"><input type="button" name="Registration" value="Registration"></a></td>
   </tr>
   </table>
   
								</form>
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
