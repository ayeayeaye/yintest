<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#map_wrap {
    height: 700px;
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
    var mapOptions = {
        mapTypeId: 'roadmap'
    };
                    
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_can"), mapOptions);
    map.setTilt(45);
   
        var markers = [
            <c:forEach var="dev" items="${devList}" varStatus="status">
                    ['<c:out value="${dev.deviceId}" />',
                <c:out value="${dev.GPSLat}" />,
                <c:out value="${dev.GPSLong}" />,
                    ],
            </c:forEach>];  
 

    // Info Window Content    
        var infoWindowContent = [
        	<c:forEach var="dev" items="${devList}" varStatus="status">
        	
            ['<div id = "container" style = "width: 400px; height: 250px; margin: 0 auto">' +
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
            title: markers[i][0]
        }); 

        	//marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');
			

        
         // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
                
                var title = {
                        text: 'Monthly Average Temperature'   
                     };
                     var subtitle = {
                        text: 'Source: WorldClimate.com'
                     };
                     var xAxis = {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                     };
                     var yAxis = {
                        title: {
                           text: 'Temperature (\xB0C)'
                        }
                     };
                     var plotOptions = {
                        line: {
                           dataLabels: {
                              enabled: true
                           },   
                           enableMouseTracking: false
                        }
                     };
                     var series = [{
                           name: 'Tokyo',
                           data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3,
                              13.9, 9.6]
                        }, 
                        {
                           name: 'London',
                           data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 
                              6.6, 4.8]
                        }
                     ];
            
                     var json = {};
                     json.title = title;
                     json.subtitle = subtitle;
                     json.xAxis = xAxis;
                     json.yAxis = yAxis;  
                     json.series = series;
                     json.plotOptions = plotOptions;
                     
                     $('#container').highcharts(json); 
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
