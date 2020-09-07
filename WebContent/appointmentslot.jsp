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
          <li><a href="doctorhome.jsp">Home</a></li>
      <li><a class="active" href="appointmentdoctor.jsp">Patients Appointment</a></li>
      <li><a href="index.jsp?logout">logout</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
  
  <div align="center">
    </br></br>
    <%
    String id = request.getParameter("id");
    String userid = request.getParameter("userid");
    String hospitalid = request.getParameter("hospitalid");
    //System.out.println(id+"="+userid+"="+hospitalid);
    %>
    <form action="appointmentslot" method="post">
    Appointment Date : <input type="date"" name="date" required/>
    Appointment Time : <input type="time" name="time" required/>
    <input type="hidden" name="id" value="<%=id%>"/>
    <input type="hidden" name="userid" value="<%=userid%>"/>
    <input type="hidden" name="hospitalid" value="<%=hospitalid%>"/>
   &nbsp;&nbsp;&nbsp; <input type="submit" value="Submit"/>
    
    </form>
    
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
