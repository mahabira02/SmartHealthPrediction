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
          <li><a href="adminhome.jsp">Home</a></li>
      <li><a href="addsymptom.jsp">Add Symptoms</a></li>
         <li><a href="adddataset.jsp">Add Dataset</a></li>
      <li><a class="active" href="dataset.jsp">Dataset</a></li>
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
    
    <table border="1">
				<tr>
				<td><strong>Disease Name</strong> </td>
				<td><strong>Symptom1</strong> </td>
				<td><strong>Symptom2</strong> </td>
				<td><strong>Symptom3</strong> </td>
				<td><strong>Symptom4</strong> </td>
				<td><strong>Symptom5</strong> </td>
				<td><strong>Symptom6</strong> </td>
				<td><strong>Symptom7</strong> </td>
				<td><strong>Symptom8</strong> </td>
				<td><strong>Symptom9</strong> </td>
				<td><strong>Symptom10</strong> </td>
				
				</tr>
				<%
				Connection con = DbConnection.getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT * FROM `datainfo`");
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
				
				%>
				<tr>
				<td><%=rs.getString("disease") %> </td>
				<td><%=rs.getString("s1") %></td>
				<td><%=rs.getString("s2") %></td>
				<td><%=rs.getString("s3") %></td>
				<td><%=rs.getString("s4") %></td>
				<td><%=rs.getString("s5") %></td>
				<td><%=rs.getString("s6") %></td>
				<td><%=rs.getString("s7") %></td>
				<td><%=rs.getString("s8") %></td>
				<td><%=rs.getString("s9") %></td>
				<td><%=rs.getString("s10") %></td>
				
					</tr>
				
				<% 
				}
				
				
				%>
				
				</table>
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
