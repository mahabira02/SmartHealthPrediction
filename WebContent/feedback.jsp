<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<title>Feedback Form</title>
</head>

<body>
<br>
<br>
<center><h><h1>Feedback Form</h1></h></center>

<form action="feedback" method="post" />
 <div id="nav">
    <ul>
          
      <li><a href="home.jsp">Home</a></li>
      </ul>
      </div>
     
 <tr class="tablerow">
									<td>Email</td>
									<td>:</td>
									<td><input type="email" name="email" placeholder="abc@gmail.com" value="<%=session.getAttribute("email")%>" required></input></td>
								</tr>
						<%-- <input type="hidden" id="feedback" name="feedback" value="<%=session.getAttribute("email")%>"> --%>
						<tr class ="tablerow">			
						 <center><h2>Enter your experience</h2></center>
						<br>
						
    <pre><td ><center><textarea id="feedback" name="feedback" placeholder="Write something.." style="height:300px;width: 50%;"></textarea></center><td></tr></pre>

                                    <br></br>
									<center><td colspan="4"><input type="submit" name="Submit" value="feedback" required></center>
									<a href="feedback"></a></td>
								</tr>

</form>
</form>
</body>
</html>