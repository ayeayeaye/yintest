<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#map_wrapper {
    height: 700px;
}

#map_canvas {
    width: 100%;
    height: 100%;
}
</style>

    
<div id="map_wrapper">
    <div id="map_canvas" class="mapping"></div>
</div>

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
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);
   
        var markers = [
            <c:forEach var="row" items="${addList}" varStatus="status">
                    ['<c:out value="${row.roadName}" />',
                <c:out value="${row.lat}" />,
                <c:out value="${row.longt}" />,
                    ],
            </c:forEach>];  
      
    // Info Window Content    
    var infoWindowContent = [
    	<c:forEach var="add" items="${addList}" varStatus="status">
    	
        ['<div class="info_content">' +
            '<p> <c:out value="${add.custAddModel.custName}" /> <br> <c:out value="${add.custAddModel.nric}" /> <br> <c:out value="${add.custAddModel.mobile}" /></p>' +
        '</div>'] ,
       
        
        </c:forEach>];
        
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
     // Loop through our array of markers & place each one on the map  
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        }); 
        
        // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

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
