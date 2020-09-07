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
          <li><a class="active" href="#">Home</a></li>
      <li><a href="patient.jsp">Patient</a></li>
      <li><a href="doctor.jsp">Doctor</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
  
  <div align="center">
    <br><br>
    <h1>Patient Registration</h1><br>
    
    <form action="patientregister" name="addnewuser" method="post" onsubmit="return validation()">
								<table cellspacing="1"  cellpadding="5" style="width:50%; margin-left:auto;margin-right:auto;">
								
                                 
                                <tr class="tablerow">
									<td>First Name</td>
									<td>:</td>
									<td><input type="text" name="fname" id="fname" required placeholder="abc" required></input></td>
								</tr>
								<tr class="tablerow">
									<td>Last Name</td>
									<td>:</td>
									<td><input type="text" name="lname" id="lname" required placeholder="xyz" required></input></td>
								</tr>
								
								<tr class="tablerow">
									<td>Date of Birth</td>
									<td>:</td>
									<td><input type="date" name="dob" id="dob" required maxlength="10" placeholder="02/12/1990" required></input></td>
								</tr>
								
								<tr class="tablerow">
									<td>Address</td>
									<td>:</td>
									<td><input type="text" name="address" id="address" required placeholder="" required></input></td>
								</tr>
								
								<tr class="tablerow">
									<td>Contact Number</td>
									<td>:</td>
									<td><input type="text"  name="mobile" id="mobile"  pattern="[7|8|9][0-9]{9}" maxlength="10" title="Phone number Start with 7 or 8 or 9" placeholder="0123456789" required></input></td>
									</tr>
								
								<tr class="tablerow">
									<td>Email</td>
									<td>:</td>
									<td><input type="email" name="email" id="email" required onchange="validatefrom()" placeholder="abc@gmail.com" required></input></td>
								</tr>
								<!-- <tr class="tablerow">
									<td>Place of Employment</td>
									<td>:</td>
									<td><input type="text" name="placeofemployement" id="placeofemployement" required></input></td>
								</tr> -->
								<tr class="tablerow">
									<td>Emergency Contact Name</td>
									<td>:</td>
									<td><input type="text" name="emname" id="emname" required></input></td>
								</tr>
								<tr class="tablerow">
									<td>Emergency Contact Number</td>
									<td>:</td>
									<td><input type="text" name="emnumber" id="numbersOnly" pattern="[7|8|9][0-9]{9}" maxlength="10" title="Phone number Start with 7 or 8 or 9" placeholder="0123456789" required></input></td>
									</tr>
									<tr class="tablerow">
									<td>Blood Group</td>
									<td>:</td>
									<td><select name="bloodgroup" required>
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
								</tr>
								<tr class="tablerow">
									<td>Allergies to Food</td>
									<td>:</td>
									<td><input type="text" name="alltofood" id="alltofood" required></input></td>
								</tr>
								<tr class="tablerow">
									<td>Allergies to Medicine</td>
									<td>:</td>
									<td><input type="text" name="alltomedicine" id="alltomedicine" required></input></td>
								</tr>
								<!-- <tr class="tablerow">
									<td>Insurance Policy</td>
									<td>:</td>
									<td><input type="text" name="inspol" id="inspol" required></input></td>
								</tr> -->
								
								<tr class="tablerow">
									<td>Password</td>
									<td>:</td>
									<td><input type="password" name="password" id="numbersOnly"  maxlength="8" required></input></td>
								</tr>
								<tr class="tableheader">
									<td colspan="3"><input type="submit" name="Login" value="Register" required>
									<a href="patient.jsp"><input type="button" name="Login" value="Login"></input></a></td>
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
