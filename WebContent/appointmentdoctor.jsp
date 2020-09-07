<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.util.DbConnection"%>
<%@page import="com.smart.GlobalFunction"%>
<%@page import="java.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->
</head>
<body>
<%
if(request.getParameter("success")!=null)
{
	out.println("<script>alert('Appointment Deatils send on Patients mail id')</script>");
}
if(request.getParameter("fail")!=null)
{
	out.println("<script>alert('Failed... Please try again')</script>");
}
if(request.getParameter("present")!=null)
{
	out.println("<script>alert('Already Allocated Appointment to another patient')</script>");
}
%>
<div id="header">
  <div id="headerInner"><br />
    <%@include file="logo.jsp" %>
  </div>
  <div id="nav">
    <ul>
          <li><a href="doctorhome.jsp">Home</a></li>
      <li><a class="active" href="appointmentdoctor.jsp">Patients Appointment</a></li>
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
    <h1>Appointment Status</h1>
    </br></br>
    
    <table>
    <tr>
    <td>Sr no</td>
     <td>Patient Name</td>
      <td>Disease</td>
      <td>Status</td>
    </tr>
<%Connection con = DbConnection.getConnection();
GlobalFunction GF = new GlobalFunction();
int srno=1;
PreparedStatement ps = con.prepareStatement("select * from appointment where hospitalid=? and status='waiting'");
ps.setString(1, session.getAttribute("userid").toString());
ResultSet rs = ps.executeQuery();
while(rs.next())
{
	%>
	<tr>
	<td><%=srno++ %></td>
	<td><%=GF.getFullName(rs.getString("userid")) %></td>
	<td><%=rs.getString("disease") %></td>
	<td><a href="appointmentslot.jsp?id=<%= rs.getString("id") %>&userid=<%=rs.getString("userid")%>&hospitalid=<%=rs.getString("hospitalid")%>">Accept</a></td>
	<%
}

%>
    <tr>
    
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
