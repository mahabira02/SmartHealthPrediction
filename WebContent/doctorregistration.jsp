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
        height: 100%;
        border: 3px solid #000;
      }
.controls {
  margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

.pac-container {
  font-family: Roboto;
}

#type-selector {
  color: #fff;
  background-color: #4d90fe;
  padding: 5px 11px 0px 11px;
}

#type-selector label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

    </style>
    <title>Places Searchbox</title>
    <style>
      #target {
        width: 345px;
      }
    </style>
    
    
    
    
    
    
    <style type="text/css">
        #map {height:400px;width:500px}
    </style>
     <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />


 <script src="http://maps.google.com/maps/api/js?sensor=true"></script> 
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
 
 
 
 <style type="text/css">
        #map_canvas {height:600px;width:800px}
    </style>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
    
    
    
    
    
        <script>

function initAutocomplete() {
	
	
     var markersArray = [];
     
     function initMap()
     {
         var latlng = new google.maps.LatLng(document.getElementById('map'));
         var myOptions = {
             zoom: 15,
             center: latlng,
             mapTypeId: google.maps.MapTypeId.ROADMAP
         };
         map = new google.maps.Map(document.getElementById("pac-input"), myOptions);

         // add a click event handler to the map object
         google.maps.event.addListener(map, "click", function(event)
         {
             // place a marker
             placeMarker(event.latLng);

             // display the lat/lng in your form's lat/lng fields
             document.getElementById("latFld").value = event.latLng.lat();
             document.getElementById("lngFld").value = event.latLng.lng();
         });
     }
     function placeMarker(location) {
         // first remove all markers if there are any
         deleteOverlays();

         var marker = new google.maps.Marker({
             position: location, 
             map: map
         });

         // add marker in markers array
         markersArray.push(marker);

         //map.setCenter(location);
     }

     // Deletes all markers in the array by removing references to them
     function deleteOverlays() {
         if (markersArray) {
             for (i in markersArray) {
                 markersArray[i].setMap(null);
             }
         markersArray.length = 0;
         }
     }
     
     
     
     
     
  var map = new google.maps.Map(document.getElementById('map'), 
		  {
	  
	  
    center: {lat: 12.9716, lng: 77.5946},
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  google.maps.event.addListener(map, "click", function(event)
	         {
	             // place a marker
	             placeMarker(event.latLng);

	             // display the lat/lng in your form's lat/lng fields
	             document.getElementById("latFld").value = event.latLng.lat();
	             document.getElementById("lngFld").value = event.latLng.lng();
	         });

  // Create the search box and link it to the UI element.
  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];
  // [START region_getplaces]
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };
      
      // Create a marker for each place.
      markers.push(new google.maps.Marker({
    	 
        map: map,
        icon: icon,
        title: place.name,
        
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });
  // [END region_getplaces]
  
  function placeMarker(location) {
         // first remove all markers if there are any
         deleteOverlays();

         var marker = new google.maps.Marker({
             position: location, 
             map: map
         });

         // add marker in markers array
         markersArray.push(marker);
         

         //map.setCenter(location);
     }

     // Deletes all markers in the array by removing references to them
     function deleteOverlays() {
         if (markersArray) {
             for (i in markersArray) {
                 markersArray[i].setMap(null);
                 
             }
         markersArray.length = 0;
         }
     }
}


    </script>

</head>
<body>
<%
if(request.getParameter("present")!=null)
{
	out.println("<script>alert(Already Present'')</script>");
}
%>
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
  
  <div>
    <br><br>
    <input id="pac-input" class="controls" type="text" placeholder="Search">
    <div id="map"></div>
    
    <div style="margin-left: 510px; margin-top: -360px;">
    <h1>New Doctor Registration</h1><br>
    <form action="registration" method="post" enctype="multipart/form-data">
    <table>
   <tr> 
    <td> Latitude: </td>
     <td><input type="text" id="latFld" name="latFld" placeholder="Latitude" required></td>
     </tr>
 <tr>
 <td> Longitude: </td>
 <td><input type="text" id="lngFld" name="lngFld" placeholder="Longitude" required></td>
 </tr> 
  
  
   <tr>
									
									<td>First Name</td>
									
									<td><input type="text" name="fname" id="fname" required></input></td>
								</tr>
								<tr>
									<td>RegistrationNumber</td>
									
									<td><input type="text" name="RegistrationNumber" id="RegistrationNumber" required></input></td>
								</tr>
								<tr>
									<td>Specialist</td>
									<td><select name="domain">
									<option value="">---Select---</option>
									<%Connection con = DbConnection.getConnection();
									PreparedStatement ps = con.prepareStatement("select * from datainfo");
									ResultSet rs =ps.executeQuery();
									while(rs.next()){
									%>
									<option value="<%=rs.getString("disease") %>"><%=rs.getString("disease") %></option>
									<%
									}
									%>
									</select>
									</td>
								</tr>
								<tr>
									<td>Experience</td>
									
									<td><input type="text" name="exp" id="exp" required></input></td>
								</tr>
								
								<tr>
									<td>Contact Number</td>
									
									<td><input type="text" name="contactNo" id="contactNo" placeholder="01234567890" maxlength="13" required></input></td>
								</tr>
								<tr>
									<td>Email</td>
									
									<td><input type="email" name="email" id="email" placeholder="abc@gmail.com" required></input></td>
								</tr>
								<tr>
									<td>Hospital Name</td>
									
									<td><input type="text" name="hospital" id="hospital" required></input></td>
								</tr>
								<tr>
									<td>Upload Certificate</td>
									
									<td><input type="file" name="file" id="file" required></input></td>
								</tr>
								
								<tr>
									<td>Address</td>
									
									<td><input type="area" name="area" id="area" required></input></td>
								</tr>
								<tr>
									<td>City</td>
									
									<td><input type="city" name="city" id="city" required></input></td>
								</tr>
								<tr>
									<td>State</td>
									
									<td><input type="state" name="state" id="state" required></input></td>
								</tr>
								<tr>
									<td>Password</td>
									
									<td><input type="password" name="password" maxlength="8" required></input></td>
				</tr>
				<!-- <tr>
								<td>Registration Number</td>
								<td><input type="text" name="RegistrationNumber" id="RegistrationNumber" required></input></td></tr>
								<tr> -->
									<td colspan="3"><input type="submit" name="Login" value="Register"></input>
									<!-- <a href="police_login.jsp"> Login !</a></td> -->
								</tr>
								</table>
								</form>
    </div>
    
    <br><br><br>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDy0s9WPPnGIRND5l3Ge5boww_SbTOEOxs&libraries=places&callback=initAutocomplete"
         async defer></script>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">
  
  
</div>

</body>
</html>
