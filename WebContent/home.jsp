<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.*"%>
<head>

<title><%@include file="title.jsp" %></title>


<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->

</head>
<body>
<div id="header">

  <div id="headerInner"><br />
    <tr><%@include file="logo.jsp" %><tr></tr><td></td>
     <h3 style = "text-align:right"><%@include file="patientsession.jsp" %></h3>

</td>
  </div>
  <div id="nav">
    <ul>
          <li><a class="active" href="home.jsp">Home</a></li>
      <li><a href="checkupform.jsp">Check-Up</a></li>
      <li><a href="patientinfo.jsp">Edit details</a></li>
      <li><a href="appointment.jsp">Appointment Status</a></li>
      <li><a href="index.jsp?logout">Logout</a></li>
      <li><a href = "feedback.jsp">Feedback Form</a></li>
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
<h2 style = "text-align:right">Welcome to Your Home Page</h2>
<div>
    <table cellspacing="1"  cellpadding="5" style="width:30%; margin-left:auto;margin-right:auto;">
                                <tr class="tablerow">
									<td>Name</td>
						
									<%
								
											Connection con = DbConnection.getConnection();
											PreparedStatement ps = con.prepareStatement("SELECT fname FROM `patient` where id=?");
											ps.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs = ps.executeQuery();
											if (rs.next()) {
												String fname = rs.getString("fname");
										%>
									<td><%=fname%></td>
									<%
							}
										%>
										
										<tr class="tablerow">
									<td>Date of Birth</td>
					
									<%
											PreparedStatement ps3 = con.prepareStatement("SELECT dob FROM `patient` where id=?");
											ps3.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs3 = ps3.executeQuery();
											if (rs3.next()) {
												String dob = rs3.getString("dob");
										%>
									<td><%=dob%></td>
							<%
											}
										%>
									</tr>
									<tr class="tablerow">
									<td>Address</td>
									<%
											PreparedStatement ps4 = con.prepareStatement("SELECT address FROM `patient` where id=?");
											ps4.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs4 = ps4.executeQuery();
											if (rs4.next()) {
												String address = rs4.getString("address");
										%>
									<td><%=address%></td>
									<%
											}
										%>
								</tr>
								
								<tr class="tablerow">
									<td>Contact Number</td>
									
									<%
											PreparedStatement ps5 = con.prepareStatement("SELECT mobile FROM `patient` where id=?");
									        ps5.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs5 = ps5.executeQuery();
											if (rs5.next()) {
												String mobile = rs5.getString("mobile");
										%>
									<td><%=mobile %></td>
										<%
											}
										%>
									</tr>
								
								<tr class="tablerow">
									<td>Email</td>
									
									<%
											PreparedStatement ps6 = con.prepareStatement("SELECT email FROM `patient` where id=?");
									        ps6.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs6 = ps6.executeQuery();
											if (rs6.next()) {
												String email = rs6.getString("email");
										%>
									<td><%=email%></td>
									<%
											}
										%>
										</tr>
										</div>
  </div>
  <div class="clear"></div>
</div>
<div id="footer"> 
</div>

</body>
</html>
