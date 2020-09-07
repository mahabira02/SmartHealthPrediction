<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.smart.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
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
          <li><a href="home.jsp">Home</a></li>
      <li><a href="checkupform.jsp">Check-Up</a></li>
      <li><a href="result.jsp">Report</a></li>
      <li><a class="active" href="appointment.jsp">Appointment</a></li>
      <li><a href="index.jsp?logout">Logout</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
  
  <div align="center">
  <h1>Appointment Status</h1>
    </br></br>
    
    <table>
    <tr>
    <td>Sr no</td>
     <td>Hospital</td>
      <td>Doctor Name</td>
      <td>Appointment Date</td>
      <td>Appointment Time</td>
      <td>Status</td>
    </tr>
<%Connection con = DbConnection.getConnection();
GlobalFunction GF = new GlobalFunction();
int srno=1;
PreparedStatement ps = con.prepareStatement("select * from appointment where userid=?");
ps.setString(1, session.getAttribute("userid").toString());
ResultSet rs = ps.executeQuery();
while(rs.next())
{
	%>
	<tr>
	<td><%=srno++ %></td>
	<td><%=GF.getHospital(rs.getString("hospitalid")) %></td>
	<td><%=GF.getDoctorName(rs.getString("hospitalid")) %></td>
	<td><%=rs.getString("adate") %></td>
	<td><%=rs.getString("atime") %></td>
	<td><%=rs.getString("status") %></td>
	<%
}

%>
    
    
    </tr>
    </table>
    
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
