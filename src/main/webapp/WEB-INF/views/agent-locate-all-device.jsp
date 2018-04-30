<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#map_wrapper {
	width: 100%;
    height: 100%;
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
			            <c:forEach var="address" items="${addressList}" varStatus="status">
			                [
			                '<c:out value="${address.addressCustModel.custName}" />',
			                <c:out value="${address.lat}" />,
			                <c:out value="${address.longt}" />,
			                ],
			            </c:forEach>
                     ];  

        
    // Info Window Content 
    	 var infoWindowContent1 = [
						    		<c:forEach var="photo" items="${photoList}" varStatus="status">		        	
						        		[
						        			'<img style="float:left; width:200px; " src="<%= request.getContextPath()%>/photo/${photo.facePhoto}"/>'      				 
						       			] ,						
						   		   </c:forEach>
        			           ];
    
  	var infoWindowContent2 = [
			        		<c:forEach var="address" items="${addressList}" varStatus="status">		        	
			            		[
			            			'<div class="info_content"style="margin-left:220px; margin-bottom:20px;" >' +
			                		'<p><b>Name</b>:<c:out value="${address.addressCustModel.custName}" /></p>' + 
			                		'<p><b>NRIC</b>:<c:out value="${address.addressCustModel.nric}" /></p>'+
			                		'<p><b>MOBILE</b>:<c:out value="${address.addressCustModel.mobile}" /></p>' + 
			           				 '</div>' 
			           				 
			           			] ,
    
		           		 </c:forEach>
			            	];
    

    
<%--         var infoWindowContent = [
        	<c:forEach var="address" items="${addressList}" varStatus="status">
        	
            ['<img style="float:left; width:200px; " src="<%= request.getContextPath()%>/photo/${cuspro.photo.facePhoto}">'+
            	'<div class="info_content"style="margin-left:220px; margin-bottom:20px;" >' +
                '<p><b>Name</b>:<c:out value="${address.addressCustModel.custName}" /></p>' + 
                '<p><b>NRIC</b>:<c:out value="${address.addressCustModel.nric}" /></p>'+
                '<p><b>MOBILE</b>:<c:out value="${address.addressCustModel.mobile}" /></p>' + 
            '</div>'] ,
           
            
            </c:forEach>]; --%>
        
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
	<c:set var="mark" value="onMarker.png"/>
  
     // Loop through our array of markers & place each one on the map     
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0],
            icon : "<%= request.getContextPath()%>/logo/${mark}"
        }); 
        
         // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent1[i][0]+infoWindowContent2[i][0] );
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
