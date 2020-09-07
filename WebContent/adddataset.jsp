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
<%
if(request.getParameter("success")!=null)
{
	out.println("<script>alert('Added Succssfully')</script>");
}
if(request.getParameter("present")!=null)
{
	out.println("<script>alert('Already Present')</script>");
}
%>
<div id="header">
  <div id="headerInner"><br />
    <%@include file="logo.jsp" %>
  </div>
  <div id="nav">
    <ul>
          <li><a href="adminhome.jsp">Home</a></li>
      <li><a href="addsymptom.jsp">Add Symptoms</a></li>
       <li><a class="active" href="adddataset.jsp">Add Dataset</a></li>
      <li><a href="dataset.jsp">Dataset</a></li>
      <li><a href="index.jsp?logout">Logout</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
  
  <div align="center">
    <h1>Add Dataset</h1>
    </br></br>
    
    <form action="adddataset" method="post">
	Disease : <input type="text" name="disease" required/><br/><br />
	
	<table align="center">
			<tr>
			<td><strong>Symptom1</strong></td>
			<td>
			
			<select name="s1" required>
			<option value="">---Select---</option>
			<%
		
			Connection con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				String symptomkey = rs.getString("symptomkey");
				String symptomname = rs.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
		<%-- 	<input type="hidden" name="s1val" value="<%=symptomname%>"> --%>
			
			<%
			}
			%>

			</td>
			<td><strong>Symptom2</strong></td>
			<td>
			<select name="s2" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps2 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next())
			{
				String symptomkey = rs2.getString("symptomkey");
				String symptomname = rs2.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			</tr>
			<tr>
			<td><strong>Symptom3</strong></td>
			<td>
			<select name="s3" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps3 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs3 = ps3.executeQuery();
			while(rs3.next())
			{
				String symptomkey = rs3.getString("symptomkey");
				String symptomname = rs3.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			<td><strong>Symptom4</strong></td>
			<td>
			<select name="s4" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps4 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs4 = ps4.executeQuery();
			while(rs4.next())
			{
				String symptomkey = rs4.getString("symptomkey");
				String symptomname = rs4.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			</tr>
			<tr>
			<td><strong>Symptom5</strong></td>
			<td>
			<select name="s5" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps5 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs5 = ps5.executeQuery();
			while(rs5.next())
			{
				String symptomkey = rs5.getString("symptomkey");
				String symptomname = rs5.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			
			<td><strong>Symptom6</strong></td>
			<td>
			<select name="s6" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps6 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs6 = ps6.executeQuery();
			while(rs6.next())
			{
				String symptomkey = rs6.getString("symptomkey");
				String symptomname = rs6.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			
			
			</tr>
			<tr>
			<td><strong>Symptom7</strong></td>
			<td>
			<select name="s7" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps7 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs7 = ps7.executeQuery();
			while(rs7.next())
			{
				String symptomkey = rs7.getString("symptomkey");
				String symptomname = rs7.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			<td><strong>Symptom8</strong></td>
			<td>
			<select name="s8" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps8 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs8 = ps8.executeQuery();
			while(rs8.next())
			{
				String symptomkey = rs8.getString("symptomkey");
				String symptomname = rs8.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			</tr>
			<tr>
			<td><strong>Symptom9</strong></td>
			<td>
			<select name="s9" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps9 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs9 = ps9.executeQuery();
			while(rs9.next())
			{
				String symptomkey = rs9.getString("symptomkey");
				String symptomname = rs9.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			%>
			</select>
			</td>
			<td><strong>Symptom10</strong></td>
			<td>
			<select name="s10" required>
			
			<%
			//Connection con = DbConnection.getConnection();
			PreparedStatement ps10 = con.prepareStatement("SELECT * FROM `symptomskey`");
			ResultSet rs10 = ps10.executeQuery();
			while(rs10.next())
			{
				String symptomkey = rs10.getString("symptomkey");
				String symptomname = rs10.getString("symptomname");
				
			%>
			<option value="<%=symptomkey%>"><%=symptomname %></option>
			
			
			<%
			}
			
		
			
			%>
			</select>
			</td>
			</tr>
			</table>

			<table align="center">
			<tr align="center">
			<td><input type="submit" value="Submit"/> </td>
			<td><input type="reset" /> </td>
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
