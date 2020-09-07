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
          <li><a href="adminhome.jsp">Home</a></li>
      <li><a class="active" href="addsymptom.jsp">Add Symptoms</a></li>
         <li><a href="adddataset.jsp">Add Dataset</a></li>
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
    <br><br>
    
    <h1>Add Symptoms</h1><br>
    <form action="addsymptom" method="post">
    <strong>Enter Symptoms : </strong><input type="text" name="symp" required>
    <input type="submit" v  value="Add"/>
    </form>
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
