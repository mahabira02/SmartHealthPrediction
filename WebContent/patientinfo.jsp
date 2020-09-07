<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.*"%>
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
      <li><a class="active" href="patientinfo.jsp">Edit details</a></li>
      <li><a href="appointment.jsp">Appointment Status</a></li>
      <li><a href = "feedback.jsp">Feedback Form</a></li>
      <li><a href="index.jsp?logout">Logout</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
  
  <div align="center">
    <br><br>
    <h1>Patient details update form</h1><br>
    
    <form action="patientupdate" name="addnewuser" method="post" onsubmit="return validation()">
								<table cellspacing="1"  cellpadding="5" style="width:50%; margin-left:auto;margin-right:auto;">
								
                                 
                                <tr class="tablerow">
									<td>First Name</td>
									<td>:</td>
									<%
											Connection con = DbConnection.getConnection();
											PreparedStatement ps = con.prepareStatement("SELECT fname FROM `patient` where id=?");
											ps.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs = ps.executeQuery();
											if (rs.next()) {
												String fname = rs.getString("fname");
										%>
									<td><input type="text" name="fname" id="fname" required placeholder="abc" value="<%=fname%>" required></input></td>
									<%
											}
										%>
								</tr>
								<tr class="tablerow">
									<td>Last Name</td>
									<td>:</td>
									<%
											PreparedStatement ps2 = con.prepareStatement("SELECT lname FROM `patient` where id=?");
											ps2.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs2 = ps2.executeQuery();
											if (rs2.next()) {
												String lname = rs2.getString("lname");
										%>
									<td><input type="text" name="lname" id="lname" required placeholder="xyz" value="<%=lname%>" required></input></td>
									<%
											}
										%>
								</tr>
								
								<tr class="tablerow">
									<td>Date of Birth</td>
									<td>:</td>
									<%
											PreparedStatement ps3 = con.prepareStatement("SELECT dob FROM `patient` where id=?");
											ps3.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs3 = ps3.executeQuery();
											if (rs3.next()) {
												String dob = rs3.getString("dob");
										%>
									<td><input type="date" name="dob" id="dob" required maxlength="10" placeholder="02/12/1990" value="<%=dob%>" required></input></td>
							<%
											}
										%>
									</tr>
								
								<tr class="tablerow">
									<td>Address</td>
									<td>:</td>
									<%
											PreparedStatement ps4 = con.prepareStatement("SELECT address FROM `patient` where id=?");
											ps4.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs4 = ps4.executeQuery();
											if (rs4.next()) {
												String address = rs4.getString("address");
										%>
									<td><input type="text" name="address" id="address" required placeholder="" value=<%=address%> required></input></td>
									<%
											}
										%>
								</tr>
								
								<tr class="tablerow">
									<td>Contact Number</td>
									<td>:</td>
									<%
											PreparedStatement ps5 = con.prepareStatement("SELECT mobile FROM `patient` where id=?");
									        ps5.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs5 = ps5.executeQuery();
											if (rs5.next()) {
												String mobile = rs5.getString("mobile");
										%>
									<td><input type="text"  name="mobile" id="mobile"  pattern="[7|8|9][0-9]{9}" maxlength="10" title="Phone number Start with 7 or 8 or 9" placeholder="0123456789" value="<%=mobile %>" required></input></td>
										<%
											}
										%>
									</tr>
								
								<tr class="tablerow">
									<td>Email</td>
									<td>:</td>
									<%
											PreparedStatement ps6 = con.prepareStatement("SELECT email FROM `patient` where id=?");
									        ps6.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs6 = ps6.executeQuery();
											if (rs6.next()) {
												String email = rs6.getString("email");
										%>
									<td><input type="email" name="email" id="email" required onchange="validatefrom()" placeholder="abc@gmail.com" value="<%=email%>" required></input></td>
									<%
											}
										%>
										</tr>
								<!-- <tr class="tablerow">
									<td>Place of Employment</td>
									<td>:</td>
									<td><input type="text" name="placeofemployement" id="placeofemployement" required></input></td>
								</tr> -->
								<!-- <tr class="tablerow">
									<td>Occupation</td>
									<td>:</td>
									<td><select required>
  										<option value="student">Student</option>
  										<option value="bussiness">Business</option>
  										<option value="doctor">Doctor</option>
  										<option value="home maker">Home Maker &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
										</select>
									<input type="text" name="occupation" id="occupation"></input></td>
								</tr> -->
								<tr class="tablerow">
									<td>Emergency Contact Name</td>
									<td>:</td>
									<%
											PreparedStatement ps7 = con.prepareStatement("SELECT ename FROM `patient` where id=?");
									        ps7.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs7 = ps7.executeQuery();
											if (rs7.next()) {
												String ename = rs7.getString("ename");
										%>
									<td><input type="text" name="emname" id="emname" value="<%=ename%>" required></input></td>
								<%
											}
										%>
										</tr>
								<tr class="tablerow">
									<td>Emergency Contact Number</td>
									<td>:</td>
									
									<%
											PreparedStatement ps8 = con.prepareStatement("SELECT eno FROM `patient` where id=?");
									        ps8.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs8 = ps8.executeQuery();
											if (rs8.next()) {
												String eno = rs8.getString("eno");
										%>
								<td><input type="text" name="emnumber" id="numbersOnly" pattern="[7|8|9][0-9]{9}" maxlength="10" title="Phone number Start with 7 or 8 or 9" placeholder="0123456789" value="<%=eno%>" required></input></td>
								<%
											}
										%>
									</tr>
									<tr class="tablerow">
									<td>Blood Group</td>
									<td>:</td>
										<%
											PreparedStatement ps9 = con.prepareStatement("SELECT bloodgroup FROM `patient` where id=?");
									        ps9.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs9 = ps9.executeQuery();
											if (rs9.next()) {
												String bloodgroup = rs9.getString("bloodgroup");
										%>
									<td><select name="bloodgroup" required>
									    <option value="<%=bloodgroup%>"><%=bloodgroup%></option>
  										<option value="O+">O+</option>
  										<option value="O-">O-</option>
  										<option value="B+">B+</option>
  										<option value=B-"">B-</option>
  										<option value="AB+">AB+</option>
  										<option value="AB-">AB-</option>
  										<option value="A+">A+</option>
  										<option value="A-">A- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
										</select>
									<!-- <input type="text" name="bloodgrp" id="bloodgrp"></input></td> -->
								
									<%
											}
										%>
										</tr>
								<tr class="tablerow">
									<td>Allergies to Food</td>
									<td>:</td>
									<%
											PreparedStatement ps10 = con.prepareStatement("SELECT alltofood FROM `patient` where id=?");
									        ps10.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs10 = ps10.executeQuery();
											if (rs10.next()) {
												String alltofood = rs10.getString("alltofood");
										%>
									<td><input type="text" name="alltofood" id="alltofood" value="<%=alltofood%>" required></input></td>
								<%
											}
										%>
								</tr>
								<tr class="tablerow">
									<td>Allergies to Medicine</td>
									<td>:</td>
									<%
											PreparedStatement ps11 = con.prepareStatement("SELECT alltomedicine FROM `patient` where id=?");
									        ps11.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs11 = ps11.executeQuery();
											if (rs11.next()) {
												String alltomedicine = rs11.getString("alltomedicine");
										%>
									<td><input type="text" name="alltomedicine" id="alltomedicine" value="<%=alltomedicine%>" required></input></td>
								<%
											}
										%>
								</tr>
								<!-- <tr class="tablerow">
									<td>Insurance Policy</td>
									<td>:</td>
									<td><input type="text" name="inspol" id="inspol" required></input></td>
								</tr> -->
								
							<%-- 	<tr class="tablerow">
									<td>Password</td>
									<td>:</td>
									<%
											PreparedStatement ps12 = con.prepareStatement("SELECT password FROM `patient` where id=?");
									        ps12.setString(1,(String)session.getAttribute("userid"));
											ResultSet rs12 = ps12.executeQuery();
											if (rs12.next()) {
												String password = rs12.getString("password");
										%>
									<td><input type="password" name="password" id="numbersOnly"  maxlength="8" value="<%=password%>" required></input></td>
								<%
											}
										%>
								</tr> --%>
								<tr class="tableheader">
									<td colspan="3"><input type="submit" name="Update" value="Update details" required>
					
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
