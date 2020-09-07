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
          <li><a href="home.jsp">Home</a></li>
      <li><a class="active" href="result.jsp">Report</a></li>
      <li><a href="recommend.jsp">Recommendation</a></li>
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
    
<%
String s1 = (String)session.getAttribute("s1");
String s2 = (String)session.getAttribute("s2");
String s3 = (String)session.getAttribute("s3");
String s4 = (String)session.getAttribute("s4");
String s5 = (String)session.getAttribute("s5");
String s6 = (String)session.getAttribute("s6");
String s7 = (String)session.getAttribute("s7");
String s8 = (String)session.getAttribute("s8");
String s9 = (String)session.getAttribute("s9");
String s10 = (String)session.getAttribute("s10");
		
String s1val = (String)session.getAttribute("s1val");
String s2val = (String)session.getAttribute("s2val");
String s3val = (String)session.getAttribute("s3val");
String s4val = (String)session.getAttribute("s4val");
String s5val = (String)session.getAttribute("s5val");
String s6val = (String)session.getAttribute("s6val");
String s7val = (String)session.getAttribute("s7val");
String s8val = (String)session.getAttribute("s8val");
String s9val = (String)session.getAttribute("s9val");
String s10val = (String)session.getAttribute("s10val");

/* System.out.println("s1val : "+s1val);
System.out.println("s2val : "+s2val);
System.out.println("s3val : "+s3val);
System.out.println("s4val : "+s4val);
System.out.println("s5val : "+s5val);
System.out.println("s6val : "+s6val);
System.out.println("s7val : "+s7val);
System.out.println("s8val : "+s8val);
System.out.println("s9val : "+s9val);
System.out.println("s10val : "+s10val);

System.out.println("Symptom1==="+s1);
System.out.println("Symptom2==="+s2);
System.out.println("Symptom3==="+s3);
System.out.println("Symptom4==="+s4);
System.out.println("Symptom5==="+s5);
System.out.println("Symptom6==="+s6);
System.out.println("Symptom7==="+s7);
System.out.println("Symptom8==="+s8);
System.out.println("Symptom9==="+s9);
System.out.println("Symptom10==="+s10);
 */


%>


<table  border="1" cellspacing="5" cellpadding="5">

<tr>
<td>Symptoms </td><td>Symptoms</td>
</tr>

<tr>
<td>1</td><td><%=s1val %></td>
</tr>
<tr>
<td> 2</td><td><%=s2val %></td>
</tr>
<tr>
<td> 3</td><td><%=s3val %></td>
</tr>
<tr>
<td> 4</td><td><%=s4val %></td>
</tr>
<tr>
<td> 5</td><td><%=s5val %></td>
</tr>
<tr>
<td> 6</td><td><%=s6val %></td>
</tr>
<tr>
<td> 7</td><td><%=s7val %></td>
</tr>
<tr>
<td> 8</td><td><%=s8val %></td>
</tr>
<tr>
<td> 9</td><td><%=s9val %></td>
</tr>
<tr>
<td> 10</td><td><%=s10val %></td>
</tr>
<tr>
<td>Disease </td><td><%=session.getAttribute("result") %></td>
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
