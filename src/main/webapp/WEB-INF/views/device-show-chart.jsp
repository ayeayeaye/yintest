<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#map_wrap {
	width: 100%;
    height: 90%;
}

#map_can {
    width: 100%;
    height: 100%;
}
</style>

    
<div id="map_wrap">
    <div id="map_can" class="mapping"></div>
</div>

      <script src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"> </script>
      <script src = "https://code.highcharts.com/highcharts.js"></script>  

<script>
jQuery(function($) {
    // Asynchronously Load the map API 
    var script = document.createElement('script');
    script.src = "//maps.googleapis.com/maps/api/js?key=AIzaSyBFkKUwqyptoPdD1WtERr5kK-6T7TELA3U&callback=initialize";
    document.body.appendChild(script);
});

function initialize() {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = { mapTypeId: 'roadmap' };
                    
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_can"), mapOptions);
    map.setTilt(45);
   
        var markers = [
            <c:forEach var="custPro" items="${custProList}" varStatus="status">
                ['DeviceID = <c:out value="${custPro.device.deviceId}" />',
/*                 <c:out value="${custPro.device.GPSLat}" />,
                   <c:out value="${custPro.device.GPSLong}" />, */
                    <c:out value="${custPro.address.lat}" />,
                    <c:out value="${custPro.address.longt}" />,
                    '<c:out value="${custPro.device.devStatus}" />',
                    ],
            </c:forEach>];  
 

    // Info Window Content    
        var infoWindowContent = [
        	<c:forEach var="custPro" items="${custProList}" varStatus="status">
        	
            ['<img style="float:left; width:150px;height: 100px; border: solid 1px;" src="<%= request.getContextPath()%>/photo/${custPro.photo.facePhoto}">'+
            '<div class="info_content"style="width: 490px; height: 100px; margin-left:160px;" >'+

             '<p>Device ID:<b><c:out value="${custPro.device.deviceId}" /></b></p>'+
             '<p>Customer ID:<b><c:out value="${custPro.customer.custId}" />(<c:out value="${custPro.customer.custName}" />)</b></p>'+
             '<p>Customer Address:<b><c:out value="${custPro.address.roadName}" /></b></p>'+
             
            '</div>'+
            '<hr>'+
            '<div id = "container1" style = " float:left; width: 300px; height: 300px; border:solid 1px;">' +
            '</div>'+
            '<div id = "container2" style = " float:right; width: 300px; height: 300px; border:solid 1px;">' +         
            '</div>'] ,
           
            
            </c:forEach>];
        
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    
	//<c:set var="mark" value="onMarker.png"/>
  
 	
	
     // Loop through our array of markers & place each one on the map     
    for( i = 0; i < markers.length; i++ ) {
        
    	var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);

        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0],

            
        }); 

        
        var devst = markers[i][3];
        if(devst == 'On')
    	{
        	marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');
    	}
        else
        {
        	marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
        }
        
       
			

        
         // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);	
               
                var title1 = {
                        text: 'This is the title'   
                     };
                     var subtitle1 = {
                        text: 'This is subtitle'
                     };
                     var xAxis1 = {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                     };
                     var yAxis1 = {
                        title: {
                           text: 'mA1'
                        }
                     };                     

                     var plotOptions1 = {
                        line: {
                           dataLabels: {
                              enabled: false
                           },  
                           color:'#f45042',                        	  
                           enableMouseTracking: true
                        }
                     };
/* 				     var plotLines1= {
							color: '#f45042'
					}; */
                     var series1 = [{
                           name: 'Example device',
                           data: [1111,888, 1266, 1415, 1812, 1115, 1512, 1665, 1983, 1183, 1309, 1186]
                        }
                     ];
                
                     var json1 = {};
                     json1.title = title1;
                     json1.subtitle = subtitle1;
                     json1.xAxis = xAxis1;
                     json1.yAxis = yAxis1;  
                     json1.series = series1;
                     json1.plotOptions = plotOptions1;

                     
                     $('#container1').highcharts(json1); 
                     
                     //2-Start
                 var title2 = {
                        text: 'This is the title 2'   
                     };
                     var subtitle2 = {
                        text: 'This is subtitle 2'
                     };
                     var xAxis2 = {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                     };
                     var yAxis2 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions2 = {
                        line: {
                           dataLabels: {
                              enabled: false
                           },   
                           enableMouseTracking: true
                        }
                     };
                     var series2 = [{
                           name: 'Example device',
                           data: [1311, 1188, 1196, 1115, 1983, 1186, 1115, 1512, 1665, 1812, 1183, 1309 ]
                        }
                     ];
                
                     var json2 = {};
                     json2.title = title2;
                     json2.subtitle = subtitle2;
                     json2.xAxis = xAxis2;
                     json2.yAxis = yAxis2;  
                     json2.series = series2;
                     json2.plotOptions = plotOptions2;
                     
                     $('#container2').highcharts(json2); 
                     
                     //2-End
            }
        })

        (marker, i)); 
        
        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(10);
        google.maps.event.removeListener(boundsListener);
    });
    
}
</script>
