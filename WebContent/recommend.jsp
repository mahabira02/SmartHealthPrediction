<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="KnnAlgorithm.NearestNeighbour"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%@include file="title.jsp" %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 7]><script type="text/javascript" src="unitpngfix.js"></script><![endif]-->
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAC6Huf5C12dqsrvqo6Ea0nH1QG3bgcA4E&callback=initMap" type="text/javascript"></script><script type="text/javascript">// <![CDATA[
//var markers = [{"lat":"17.454000","lng":"78.434952"},{"title":"shilparamam","lat":"17.452665","lng":"78.435608","description":"Mumbai formerly Bombay, is the capital city of the Indian state of Maharashtra."},{"title":"image hospitals","lat":"17.452421","lng":"78.435715","description":"Pune is the seventh largest metropolis in India, the second largest in the state of Maharashtra after Mumbai."}];
var markers = <%=session.getAttribute("str")%>;

window.onload = function () {
var mapOptions = {
center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
zoom: 10,
mapTypeId: google.maps.MapTypeId.ROADMAP
};
var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
var infoWindow = new google.maps.InfoWindow();
var lat_lng = new Array();
var latlngbounds = new google.maps.LatLngBounds();
for (i = 0; i < markers.length; i++) {
var data = markers[i]
var myLatlng = new google.maps.LatLng(data.lat, data.lng);
lat_lng.push(myLatlng);
var marker = new google.maps.Marker({
position: myLatlng,
map: map,
title: data.title
});
latlngbounds.extend(marker.position);
(function (marker, data) {
google.maps.event.addListener(marker, "click", function (e) {
infoWindow.setContent(data.description);
infoWindow.open(map, marker);
});
})(marker, data);
}
map.setCenter(latlngbounds.getCenter());
map.fitBounds(latlngbounds);

}

// ]]></script>
 
   
     
 
 
</head>
<body>
<%
if(request.getParameter("success")!=null)
{
	out.println("<script>alert('Book Appointment Successfull')</script>");
	out.println("<script>alert('Appointment Details will be send on your mail id')</script>");
}
if(request.getParameter("present")!=null)
{
	out.println("<script>alert('You Already Book Appointment')</script>");
}
%>
<div id="header">
  <div id="headerInner"><br />
    <%@include file="logo.jsp" %>
  </div>
  <div id="nav">
    <ul>
          <li><a href="home.jsp">Home</a></li>
      <li><a href="result.jsp">Report</a></li>
      <li><a class="active" href="recommend.jsp">Recommendation</a></li>
      <li><a href="index.jsp?logout">Logout</a></li>
     
    </ul>
  </div>
</div>
<div id="wrapper">
  
  <div id="featured"> 
  <img  src="images/health.jpg" alt="" width="100%" height="200" />
     
</div>
  
  
  <div id="dvMap" style="width: 300px; height: 300px;" ></div>
   <div style="margin-left: 400px; margin-top: -256px;">
    <%
    Connection con = DbConnection.getConnection();
    String clat = session.getAttribute("clat").toString();
    String clon = session.getAttribute("clon").toString();
    String disease = session.getAttribute("result").toString();
    NearestNeighbour near = new NearestNeighbour();
    double dist=0;
   
    PreparedStatement ps = con.prepareStatement("select * from doctor");
    //ps.setString(1, disease);
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
    	String id = rs.getString("id");
    	String lat = rs.getString("lat");
    	String lon = rs.getString("lon");
    	
    	 dist = near.distance(Double.parseDouble(clat), Double.parseDouble(clon), Double.parseDouble(lat), Double.parseDouble(lon), "K");
    	
    	PreparedStatement pp = con.prepareStatement("update doctor set dist=? where id=?");
    	pp.setString(1,Double.toString(dist));
    	pp.setString(2, id);
    	pp.executeUpdate();
    	
    }
    
    %>
    <h1>Recommended Hospital</h1></br>
    <table border="1" cellpadding="5" cellspacing="5">
    <tr>
    <th>Sr No</th>
    <th>Hospital Name</th>
    <!-- <th>Doctor Name</th>
    <th>Speciality</th>
    <th>Address</th> -->
    <th>Details</th>
    
    </tr>
    <%
    int srno=1;
    //System.out.println(disease);
    PreparedStatement ps1 = con.prepareStatement("select * from doctor where specialist=? order by dist");
    ps1.setString(1, disease);
    ResultSet rs1 = ps1.executeQuery();
    while(rs1.next())
    {
    	%>
    	<tr>
    	<td><%=srno++ %></td>
    	<td><%=rs1.getString("hospital") %></td>
    	<%-- <td><%=rs.getString("fname") %>&nbsp;<%=rs.getString("lname") %></td>
    	<td><%=rs.getString("specialist") %></td>
    	<td><%=rs.getString("address") %></td> --%>
<%--     	<td><a href="seedetails.jsp?id=<%=rs1.getString("id")%>&lat=<%=rs1.getString("lat")%>&lon=<%=rs1.getString("lon")%>">See Deatils</a></td> --%>
    	<td><a href="seedetails?id=<%=rs1.getString("id")%>&lat=<%=rs1.getString("lat")%>&lon=<%=rs1.getString("lon")%>">See Deatils</a></td>
    	<%
    	
    }
    %>
    </tr>
   
    </table>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy0s9WPPnGIRND5l3Ge5boww_SbTOEOxs&libraries=places&callback=initAutocomplete"
         async defer></script>
    <br><br><br><br><br><br>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
