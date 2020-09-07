<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->
<style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 300px;
        width: 300px;
         border: 3px solid #000;
      }
       #map1 {
        height: 300px;
        width: 300px;
         border: 3px solid #000;
      }
      .controls {
        background-color: #fff;
        border-radius: 2px;
        border: 1px solid transparent;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        box-sizing: border-box;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        height: 29px;
        margin-left: 17px;
        margin-top: 10px;
        outline: none;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      .controls:focus {
        border-color: #4d90fe;
      }

    </style>

    
     
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
      <li><a href="result.jsp">Report</a></li>
      <li><a class="active" href="recommend.jsp">Recommendation</a></li>
      <li><a href="appointment.jsp">Appointment</a></li>
      <li><a href="index.jsp?logout">Logout</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
<script>

  
function initMap() {
	//console.log("4");
  var myLatLng = {lat: <%= session.getAttribute("lat")%>, lng: <%= session.getAttribute("lon")%>};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: myLatLng
  });
 
  var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
<%--     title:'Location: <%= session.getAttribute("lat")%>', --%>
    
    <%-- <% session.invalidate();%> --%>
<%--     title:'Category: <%= session.getAttribute("category")%> ' --%>
  });
}

    </script>
  <div id="map"></div>
  <div style="margin-left: 400px; margin-top: -290px;">
 
    <%
    String id = request.getParameter("id");
    
    Connection con = DbConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("select * from doctor where id=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
    if(rs.next())
    {
    	%>
    	  	<img src="hospital/<%=rs.getString("filename") %>" alt="" width="500px" height="300px"/>
    	 <br> <br>
    	  	 <h1>Hospital Details</h1>
    </br>
    	<table>
    	<tr>
    	<td>Hospital Name</td>
    	<td>:</td>
    	<td><%=rs.getString("hospital") %></td>
    	</tr>
    	<tr>
    	<td>Doctor Name</td>
    	<td>:</td>
    	<td><%=rs.getString("fname") %>&nbsp;</td><%-- <%=rs.getString("lname") %></td> --%>
    	</tr>
    	<tr>
    	<td>Speciality</td>
    	<td>:</td>
    	<td><%=rs.getString("specialist") %></td>
    	</tr>
    	<tr>
    	<td>Contact No</td>
    	<td>:</td>
    	<td><%=rs.getString("mobile") %></td>
    	</tr>
    	<tr>
    	<td>Address</td>
    	<td>:</td>
    	<td><%=rs.getString("address") %></td>
    	</tr>
    	<tr><td><a class="button" href="appointment?hospitalid=<%=id %>" style="color: white; background-color: green;">Fix Appointment</a></td></tr>
    	</table>
    	
  
    	<%
    }
    
    %>

   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy0s9WPPnGIRND5l3Ge5boww_SbTOEOxs&libraries=places&signed_in=true&callback=initMap"
        async defer></script>
    <br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
