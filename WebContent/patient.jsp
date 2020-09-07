<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->



<script type="text/javascript">
     function initGeolocation()
     {
        if( navigator.geolocation )
        {
           // Call getCurrentPosition with success and failure callbacks
           navigator.geolocation.getCurrentPosition( success, fail );
        }
        else
        {
           alert("Sorry, your browser does not support geolocation services.");
        }
     }

     function success(position)
     {

         document.getElementById('lon').value = position.coords.longitude;
         document.getElementById('lat').value = position.coords.latitude;
         
         
         
     }

     function fail()
     {
        // Could not obtain location
     }
     
   </script>
</head>
<body  onLoad="initGeolocation();">

<%
if(request.getParameter("forgetpassword")!=null)
{
	session.invalidate();
	out.println("<script>alert('Password Reset Link Sent Successfully')</script>");
}
%>  

<div id="header">
  <div id="headerInner"><br />
    <%@include file="logo.jsp" %>
  </div>
  <div id="nav">
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a class="active" href="patient.jsp">Patient</a></li>
      <li><a href="doctor.jsp">Doctor</a></li>
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
   <h1>Welcome to Patient Login Page</h1><br>
   <form action="patientlogin" method="post"onsubmit="return validLogin();">
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
       <td> <input type="hidden" id="lat" name="lat" value=""></td>
         <td>  <input type="hidden" id="lon" name="lon" value=""></td>
        </tr>  
   <tr>
   <td><input type="submit" name="Login" value="Login"></td>
   <td><a href="patientregistration.jsp"><input type="button" name="Registration" value="Registration"></a></td>
   </tr>
   <tr class="tablerow">
  
   <td><a href="forgetNewPage.jsp"><input type="button" name="forgetNewPage" value="Forget Password"></a></td>
   <!-- <form action="forgetNewPage" method="post" />
   <td colspan="3"><input type="submit" name="forgetNewPage" value="Forget Password" required>
									<a href="forgetNewPage"></a></td> -->
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
