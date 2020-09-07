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
          <li><a class="active" href="doctorhome.jsp">Home</a></li>
      <li><a href="appointmentdoctor.jsp">Patients Appointment</a></li>
       <li><a href="appointmentdetails.jsp">Appointment Details</a></li>
      <li><a href="index.jsp?logout">logout</a></li>
     
    </ul>
  </div>
</div>

<div id="wrapper">
  
  <div id="featured"> 
 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
      
</div>
  
  <div align="center">
   <br></br>
   
   <h2 style = "text-align:center">Welcome <%=session.getAttribute("fname") %></h2> 
   
    
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
