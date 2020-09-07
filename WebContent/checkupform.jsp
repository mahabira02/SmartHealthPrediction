<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#r2").hide();
		$("#r3").hide();
		$("#r4").hide();
		$("#r5").hide();
		$("#show").click(function() {
			if($("#r2").is(":hidden")){
				$("#r2").show();
            } else{
            	if($("#r3").is(":hidden")){
    				$("#r3").show();
                } else{
                	if($("#r4").is(":hidden")){
        				$("#r4").show();
                    } else{
                    	if($("#r5").is(":hidden")){
            				$("#r5").show();
                                        $("#show").hide();
                        } else{
                            alert("limit exceeded");
                        }
                    }
                }
            }
		
		});
	});
</script>
<title><%@include file="title.jsp"%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->
</head>
<body>

	<div id="header">
		<div id="headerInner">
			<br />
			<%@include file="logo.jsp"%>
		</div>
		
		<div id="nav">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a class="active" href="checkupform.jsp">Check-Up</a></li>
				<li><a href="result.jsp">Report</a></li>
				<li><a href="appointment.jsp">Appointment</a></li>
				<li><a href="index.jsp?logout">Logout</a></li>

			</ul>
		</div>
	</div>
	<div id="wrapper">

		<div id="featured">
			<img src="images/health.jpg" alt="" width="100%" height="200" />

		</div>

		<div align="center">
			<br><br></br>
 <h3 align:center>Enter Your Symptoms</h3>
					<form action="Iterative" name="drpatiententry" method="post">
						<table align="center">
							<tr>
							<!-- 	<td><strong>Symptom1</strong></td> -->
								<td><select name="s1" required>
										<option value="">---Select---</option>
										<%
											Connection con = DbConnection.getConnection();
											PreparedStatement ps = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs = ps.executeQuery();
											while (rs.next()) {
												String symptomkey = rs.getString("symptomkey");
												String symptomname = rs.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>
										<%-- 	<input type="hidden" name="s1val" value="<%=symptomname%>"> --%>

										<%
											}
										%>
								</td >
								<!-- <td><strong>Symptom2</strong></td> -->
								<td><select name="s2" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs2 = ps2.executeQuery();
											while (rs2.next()) {
												String symptomkey = rs2.getString("symptomkey");
												String symptomname = rs2.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>
							</tr>
							<tr id="r2">
								<!-- <td><strong>Symptom3</strong></td> -->
								<td><select name="s3" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps3 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs3 = ps3.executeQuery();
											while (rs3.next()) {
												String symptomkey = rs3.getString("symptomkey");
												String symptomname = rs3.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>
								<!-- <td><strong>Symptom4</strong></td> -->
								<td><select name="s4" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps4 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs4 = ps4.executeQuery();
											while (rs4.next()) {
												String symptomkey = rs4.getString("symptomkey");
												String symptomname = rs4.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>
							</tr>
							<tr id="r3">
								<!-- <td><strong>Symptom5</strong></td> -->
								<td><select name="s5" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps5 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs5 = ps5.executeQuery();
											while (rs5.next()) {
												String symptomkey = rs5.getString("symptomkey");
												String symptomname = rs5.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>

								<!-- <td><strong>Symptom6</strong></td> -->
								<td><select name="s6" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps6 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs6 = ps6.executeQuery();
											while (rs6.next()) {
												String symptomkey = rs6.getString("symptomkey");
												String symptomname = rs6.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>


							</tr>
							<tr id="r4">
								<!-- <td><strong>Symptom7</strong></td> -->
								<td><select name="s7" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps7 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs7 = ps7.executeQuery();
											while (rs7.next()) {
												String symptomkey = rs7.getString("symptomkey");
												String symptomname = rs7.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>
								<!-- <td><strong>Symptom8</strong></td> -->
								<td><select name="s8" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps8 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs8 = ps8.executeQuery();
											while (rs8.next()) {
												String symptomkey = rs8.getString("symptomkey");
												String symptomname = rs8.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>
							</tr>
							<tr id="r5">
							<!-- 	<td><strong>Symptom9</strong></td> -->
								<td><select name="s9" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps9 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs9 = ps9.executeQuery();
											while (rs9.next()) {
												String symptomkey = rs9.getString("symptomkey");
												String symptomname = rs9.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}
										%>
								</select></td>
								<!-- <td><strong>Symptom10</strong></td> -->
								<td><select name="s10" required>

										<%
											//Connection con = DbConnection.getConnection();
											PreparedStatement ps10 = con.prepareStatement("SELECT * FROM `symptomskey`");
											ResultSet rs10 = ps10.executeQuery();
											while (rs10.next()) {
												String symptomkey = rs10.getString("symptomkey");
												String symptomname = rs10.getString("symptomname");
										%>
										<option value="<%=symptomkey%>,<%=symptomname%>"><%=symptomname%></option>


										<%
											}

											String result = (String) session.getAttribute("result");
											System.out.println("result : " + result);
										%>
								</select></td>
							</tr>
						</table>

						<table align="center">
							<tr align="center">
								<td><input type="submit" value="Check disease" /></td>
								<td><input type="reset" /></td>
								<button type="button" id="show">add more symptoms</button>
							</tr>
						</table>
					</form> <br><br><br>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer"></div>

</body>
</html>
