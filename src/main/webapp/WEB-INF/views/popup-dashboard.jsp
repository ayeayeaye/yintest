<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#map_wrapper_dashboard {
    height: 100%;
}

#map_canvas_dashboard {
    height: 100%;
}

</style>
 

<div id="map_wrapper_dashboard">
    <div id="map_canvas_dashboard" class="mapping"></div>
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
    		zoom: 3,
    	mapTypeId: google.maps.MapTypeId.ROADMAP
    };
                    
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas_dashboard"), mapOptions);
    map.setTilt(45);
 
    var markers = [
			            <c:forEach var="cust" items="${custList}" varStatus="status">
			                [
			                '<c:out value="${cust.custName}" />',
			                <c:out value="${cust.cusAddress.lat}" />,
			                <c:out value="${cust.cusAddress.longt}" />,
			                ],
			            </c:forEach>
                     ];  
        
//Data for Highcharts
   var chargingDayList = [
			            <c:forEach var="devStaList" items="${devStaProList}">
			           [
				            <c:forEach var="devChargingSta" items="${devStaList.chargingDayList}" >
				                [
				                <c:out value="${devChargingSta}"/>,				                
				                ],
				            </c:forEach>
				        ],
			            </c:forEach>
                     ];  
   
   var dcDayList = [
       <c:forEach var="devStaList" items="${devStaProList}">
      [
           <c:forEach var="devDCSta" items="${devStaList.dcDayList}" >
               [
               <c:out value="${devDCSta}"/>,				                
               ],
           </c:forEach>
       ],
       </c:forEach>
    ]; 
   
   var usbDayList = [
       <c:forEach var="devStaList" items="${devStaProList}">
      [
           <c:forEach var="devUSBSta" items="${devStaList.usbDayList}" >
               [
               <c:out value="${devUSBSta}"/>,				                
               ],
           </c:forEach>
       ],
       </c:forEach>
    ]; 
   var powerDayList = [
       <c:forEach var="devStaList" items="${devStaProList}">
      [
           <c:forEach var="devPowerSta" items="${devStaList.powerDayList}" >
               [
               <c:out value="${devPowerSta}"/>,				                
               ],
           </c:forEach>
       ],
       </c:forEach>
    ];
   var batteryDayList = [
       <c:forEach var="devStaList" items="${devStaProList}">
      [
           <c:forEach var="devBatterySta" items="${devStaList.batteryDayList}" >
               [
               <c:out value="${devBatterySta}"/>,				                
               ],
           </c:forEach>
       ],
       </c:forEach>
    ];
    // Info Window Content 
          var infoWindowContent = [
        	<c:forEach var="cust" items="${custList}" varStatus="status">      	
            [           
           		'<img style="float:left; width:150px; height: 120px; border: solid 1px;" src="<%= request.getContextPath()%>/photo/${cust.custPhoto.facePhoto}">'+
	           		'<div style="width:440px; margin-left:160px;" >'+ 
	           			'<table class="table table-bordered table-striped">'+	 
	           				'<tr>'+	
	           					'<td>'+
			           				 '<p>Device ID :<b><c:out value="${cust.custDevice.deviceId}" /></b></p>'+
						             '<p>Customer ID :<b><c:out value="${cust.custId}" /></b></p>'+
						             '<p>Name :<b><c:out value="${cust.custName}" /></b></p>'+
					             '</td>'+						             
				             '</tr>'+			             
			             '</table>' +
	                '</div>'+
	                /* UserProfile - Start */
	           		'<div style="width:600px;" >'+ 
           			'<table class="table table-bordered table-striped">'+	 
           				'<tr style="background-color:#99bffc;">'+
           					'<td colspan="2">'+
           						'UserProfile' +
		            		 '</td>'+						             
		             	'</tr>'+

           				'<tr>'+	
	           				'<td>'+
		           				 '<p>NRIC :<b><c:out value="${cust.nric}" /></b></p>'+
					             '<p>Email :<b><c:out value="${cust.email}" /></b></p>'+
					             '<p>Mobile :<b><c:out value="${cust.mobile}" /></b></p>'+
				             '</td>'+
		           			'<td>'+
		           				 '<p>Address :<b><c:out value="${cust.cusAddress.roadName}" /></b></p>'+
					              '<p>GPS Latitude :<b> <c:out value="${cust.cusAddress.lat}" /> </b><p>'+
					              '<p>GPS Longitude : <b>'+
					              <c:out value="${cust.cusAddress.longt}" />+
					              '</b></p>'+
				             '</td>'+						             
			             '</tr>'+	
	           			 '<tr>'+	
		           			'<td>'+
		           				 '<p>Job :<b><c:out value="${cust.job}" /></b></p>'+
					             '<p>Income :<b><c:out value="${cust.income}" /></b></p>'+
					             '<p>Education :<b><c:out value="${cust.education}" /></b></p>'+
				             '</td>'+	
			           		'<td>'+
		           				 '<p>Adult Number :<b><c:out value="${cust.noAdult}" /></b></p>'+
					             '<p>Child Number :<b><c:out value="${cust.noChild}" /></b></p>'+
					             '<p>House Type :<b><c:out value="${cust.houseType}" /></b></p>'+
				             '</td>'+						             
			             '</tr>'+				             
		             '</table>' +
                '</div>'+
                /* UserProfile - End */
	           		'<div style="width:600px;" >'+ 
           			'<table class="table table-bordered table-striped">'+	 
           				'<tr style="background-color:#99bffc;">'+
           					'<td colspan="5">'+
           						'Device Information' +
		            		 '</td>'+						             
		             	'</tr>'+

           				'<tr>'+	
           					'<td>'+
					             '<p>Status :<b><c:out value="${cust.custId}" /></b></p>'+
					             '<p>GPS Latitude :<b><c:out value="${cust.custDevice.GPSLat}" /></b></p>'+
					             '<p>GPS Longitude :<b><c:out value="${cust.custDevice.GPSLong}" /></b></p>'+					             
				             '</td>'+						             
			             '</tr>'+			             
		             '</table>' +
                '</div>'+
		             '<hr>'+

	        	'<table class="table table-bordered">'+	        		
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "chargingContainer" style = "float:left; width: 350px; height: 300px; border:solid 1px;"></div>'+
	        			'</td>'+
	        		'</tr>'+
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "dcContainer" style = "float:left; width: 350px; height: 300px; border:solid 1px;"></div>'+
	        			'</td>'+
        			'</tr>'+	        		
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "usbContainer" style = "float:left; width: 350px; height: 300px; border:solid 1px;"></div>' +
	        			'</td>'+
	        		'</tr>'+
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "powerContainer" style = " float:left; width: 350px; height: 300px; border:solid 1px;"></div>' +
	        			'</td>'+
        			'</tr>'+	        		
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "batteryContainer" style = "float:left; width: 350px; height: 300px; border:solid 1px;"></div>' +
	        			'</td>'+
	        		'</tr>'+
	        	'</table>'  
	        

            ] ,    
            
            </c:forEach>
            ];

            
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow({ maxWidth: 1500 }), marker, i;
    
	<c:set var="mark" value="onMarker.png"/>
  
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
                
                //Highcharts
                var title1 = {
                        text: 'Charging Status'   
                     };
                     var xAxis1 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11']
 /*                        	,'12', '13', '14', '15','16', '17', '18', '19', '20', '21', '22', '23', '24'] */
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
                     var series1 = [{
                           name: '@@@',
                           data: [chargingDayList[i][0], chargingDayList[i][1], chargingDayList[i][2], chargingDayList[i][3], chargingDayList[i][4], chargingDayList[i][5], 
                        	      chargingDayList[i][6], chargingDayList[i][7], chargingDayList[i][8], chargingDayList[i][9], chargingDayList[i][10], chargingDayList[i][11]]
                        }
                     ];
                
                     var json1 = {};
                     json1.title = title1;
                     json1.xAxis = xAxis1;
                     json1.yAxis = yAxis1;  
                     json1.series = series1;
                     json1.plotOptions = plotOptions1;
                     
                     $('#chargingContainer').highcharts(json1); 
                     
                     //Container 2-Start
                 var title2 = {
                        text: 'DC Usage'   
                     };
                     var xAxis2 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11']
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
                           data: [ dcDayList[i][0], dcDayList[i][1], dcDayList[i][2], dcDayList[i][3], dcDayList[i][4], dcDayList[i][5],
                        	       dcDayList[i][6], dcDayList[i][7], dcDayList[i][8], dcDayList[i][9], dcDayList[i][10], dcDayList[i][11] ]
                        }
                     ];
                
                     var json2 = {};
                     json2.title = title2;
                     json2.xAxis = xAxis2;
                     json2.yAxis = yAxis2;  
                     json2.series = series2;
                     json2.plotOptions = plotOptions2;
                     
                     $('#dcContainer').highcharts(json2);                    
                     //Container 2-End  
    
                     //Container 3-Start
                	 var title3 = {
                        text: 'USB Usage'   
                     };
                     var xAxis3 = {
                        categories:['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11']
                     };
                     var yAxis3 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions3 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#41f489',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series3 = [{
                           name: 'Example device',
                           data: [ usbDayList[i][0], usbDayList[i][1], usbDayList[i][2], usbDayList[i][3], usbDayList[i][4], usbDayList[i][5],
                        	       usbDayList[i][6], usbDayList[i][7], usbDayList[i][8], usbDayList[i][9], usbDayList[i][10], usbDayList[i][11] ]
                        }
                     ];
                
                     var json3 = {};
                     json3.title = title3;
                     json3.xAxis = xAxis3;
                     json3.yAxis = yAxis3;  
                     json3.series = series3;
                     json3.plotOptions = plotOptions3;
                     
                     $('#usbContainer').highcharts(json3);                    
                     //Container 3-End   
                     
                     //Container 4-Start
                	 var title4 = {
                        text: 'Power Consumption'   
                     };
                     var xAxis4 = {
                        categories: ['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11']
                     };
                     var yAxis4 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions4 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#f4f442',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series4 = [{
                           name: 'Example device',
                           data: [ powerDayList[i][0], powerDayList[i][1], powerDayList[i][2], powerDayList[i][3], powerDayList[i][4], powerDayList[i][5],
                        	       powerDayList[i][6], powerDayList[i][7], powerDayList[i][8], powerDayList[i][9], powerDayList[i][10], powerDayList[i][11] ]
                        }
                     ];
                
                     var json4 = {};
                     json4.title = title4;
                     json4.xAxis = xAxis4;
                     json4.yAxis = yAxis4;  
                     json4.series = series4;
                     json4.plotOptions = plotOptions4;
                     
                     $('#powerContainer').highcharts(json4);                    
                     //Container 4-End    
                     
                    //Container 5-Start
                	 var title5 = {
                        text: 'Battery Usage'   
                     };
                     var xAxis5 = {
                        categories:['0', '1', '2', '3', '4', '5','6', '7', '8', '9', '10', '11']
                     };
                     var yAxis5 = {
                        title: {
                           text: 'mA'
                        }
                     };

                     var plotOptions5 = {
                             line: {
                                dataLabels: {
                                   enabled: false
                                },  
                                color:'#686b6b',                        	  
                                enableMouseTracking: true
                             }
                          }
                     var series5 = [{
                           name: 'Example device', 
                           data: [ batteryDayList[i][0], batteryDayList[i][1], batteryDayList[i][2], batteryDayList[i][3], batteryDayList[i][4], batteryDayList[i][5],
                        	       batteryDayList[i][6], batteryDayList[i][7], batteryDayList[i][8], batteryDayList[i][9], batteryDayList[i][10], batteryDayList[i][11] ]
                        }
                     ];
                
                     var json5 = {};
                     json5.title = title5;
                     json5.xAxis = xAxis5;
                     json5.yAxis = yAxis5;  
                     json5.series = series5;
                     json5.plotOptions = plotOptions5;
                     
                     $('#batteryContainer').highcharts(json5);                    
                     //Container 5-End                        
            }
        })(marker, i)); 
        
        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        if (this.getZoom()){
            this.setZoom(1);
        }
        google.maps.event.removeListener(boundsListener);
    });
    
    setTimeout(function(){google.maps.event.removeListener(zoomChangeBoundsListener)}, 2000);
}
</script>
