<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css"/>

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
			            <c:forEach var="devStaPro" items="${devStaProList}" varStatus="status">
			                [
			                '<c:out value="${devStaPro.device.deviceCustModel.custName}" />',
			                <c:out value="${devStaPro.device.deviceCustModel.cusAddress.lat}" />,
			                <c:out value="${devStaPro.device.deviceCustModel.cusAddress.longt}" />,
			                '<c:out value="${devStaPro.device.devStatus}" />',
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
        	<c:forEach var="devStaPro" items="${devStaProList}" varStatus="status">      	
            [           
           		'<img style="float:left; width:150px; height: 120px; border: solid 1px;" src="<%= request.getContextPath()%>/photo/${devStaPro.device.deviceCustModel.custPhoto.facePhoto}">'+
	           		'<div style="width:475px; margin-left:160px;" >'+ 
	           			'<table class="table table-bordered table-striped">'+	 
	           				'<tr>'+	
	           					'<td>'+
			           				 '<p>Device ID :<b><c:out value="${devStaPro.device.deviceId}" /></b></p>'+
						             '<p>Customer ID :<b><c:out value="${devStaPro.device.deviceCustModel.custId}" /></b></p>'+
						             '<p>Name :<b><c:out value="${devStaPro.device.deviceCustModel.custName}" /></b></p>'+
					             '</td>'+						             
				             '</tr>'+			             
			             '</table>' +
	                '</div>'+
	                /* UserProfile - Start */
	           		'<div style="width:635px;" >'+ 
           			'<table class="table table-bordered table-striped">'+	 
           				'<tr style="background-color:#99bffc;">'+
           					'<td colspan="2">'+
           						'UserProfile' +
		            		 '</td>'+						             
		             	'</tr>'+

           				'<tr>'+	
	           				'<td>'+
		           				 '<p>NRIC :<b><c:out value="${devStaPro.device.deviceCustModel.nric}" /></b></p>'+
					             '<p>Email :<b><c:out value="${devStaPro.device.deviceCustModel.email}" /></b></p>'+
					             '<p>Mobile :<b><c:out value="${devStaPro.device.deviceCustModel.mobile}" /></b></p>'+
				             '</td>'+
		           			'<td>'+
		           				 '<p>Address :<b><c:out value="${devStaPro.device.deviceCustModel.cusAddress.roadName}" /></b></p>'+
					              '<p>GPS Latitude :<b> <c:out value="${devStaPro.device.deviceCustModel.cusAddress.lat}" /> </b><p>'+
					              '<p>GPS Longitude : <b>'+
					              <c:out value="${devStaPro.device.deviceCustModel.cusAddress.longt}" />+
					              '</b></p>'+
				             '</td>'+						             
			             '</tr>'+	
	           			 '<tr>'+	
		           			'<td>'+
		           				 '<p>Job :<b><c:out value="${devStaPro.device.deviceCustModel.job}" /></b></p>'+
					             '<p>Income :<b><c:out value="${devStaPro.device.deviceCustModel.income}" /></b></p>'+
					             '<p>Education :<b><c:out value="${devStaPro.device.deviceCustModel.education}" /></b></p>'+
				             '</td>'+	
			           		'<td>'+
		           				 '<p>Adult Number :<b><c:out value="${devStaPro.device.deviceCustModel.noAdult}" /></b></p>'+
					             '<p>Child Number :<b><c:out value="${devStaPro.device.deviceCustModel.noChild}" /></b></p>'+
					             '<p>House Type :<b><c:out value="${devStaPro.device.deviceCustModel.houseType}" /></b></p>'+
				             '</td>'+					             
			             '</tr>'+				             
		             '</table>' +
                '</div>'+
                /* UserProfile - End */
                
                /* Device Information - Start */
	           		'<div style="width:635px;" >'+ 
           			'<table class="table table-bordered table-striped">'+	 
           				'<tr style="background-color:#99bffc;">'+
           					'<td>'+
           						'Device Information' +
		            		 '</td>'+						             
		             	'</tr>'+

           				'<tr>'+	
           					'<td>'+   
           						 '<p>Status :<b><c:out value="${devStaPro.device.devStatus}" /></b></p>'+ 
					             '<p>GPS Latitude :<b><c:out value="${devStaPro.device.GPSLat}" /></b></p>'+
					             '<p>GPS Longitude :<b><c:out value="${devStaPro.device.GPSLong}" /></b></p>'+					             
				             '</td>'+						             
			             '</tr>'+			             
		             '</table>' +
                '</div>'+
                /* Device Information - End */
                
                /* Payment History - Start */
	           		'<div style="width:635px;">'+
	           		'<table class="table table-bordered">'+	 
           				'<tr style="background-color:#99bffc;">'+
           					'<td colspan="7">'+
           						'Payment History' +
		            		 '</td>'+						             
		             	'</tr>'+
           				'<tr>'+
           					'<td>#</td>'+	
	       					'<td>Id</td>'+	
	       					'<td>Paid</td>'+
	       					'<td>Date</td>'+
	       					'<td>Credit</td>'+
	       					'<td>Agent</td>'+
	       					'<td>Comment</td>'+
	             		'</tr>'+
	             		<c:forEach var="pay" items="${devStaPro.device.devPaymentList}" varStatus="counter">	             		
           				'<tr>'+	
           					'<td><c:out value="${counter.count}" /></td>'+
           					'<td><c:out value="${pay.payId}" /></td>'+
	       					'<td><c:out value="${pay.payAmt}" /></td>'+
	       					'<td><c:out value="${pay.payDay}" /></td>'+
	       					'<td><c:out value="${pay.currentCreditAmt}" /></td>'+		
	       					'<td><c:out value="${pay.payAgent}" /></td>'+
	       					'<td><c:out value="${pay.payComment}" /></td>'+					             
		             	'</tr>'+		             	
		             	</c:forEach>

		             '</table>' +
                '</div>'+                               
                /* Payment History - End */
	        	'<table class="table table-bordered">'+	        		
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "chargingContainer" style = "float:left; width: 550px; height: 300px; border:solid 1px;"></div>'+
    						'<p><input type="radio" name="charging" id="chargingDay" value="chargingDay" checked>Day</p>'+
    						'<p><input type="radio" name="charging" id="chargingWeek" value="chargingDay">Week</p>'+
    						'<p><input type="radio" name="charging" id="chargingMonth" value="chargingMonth">Month</p>'+
	        			'</td>'+	        			
	        		'</tr>'+
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "dcContainer" style = "float:left; width: 550px;  height: 300px; border:solid 1px;"></div>'+
    						'<p><input type="radio" name="dc" id="dcDay" value="dcDay" checked>Day</p>'+
    						'<p><input type="radio" name="dc" id="dcWeek" value="dcWeek">Week</p>'+
    						'<p><input type="radio" name="dc" id="dcMonth" value="dcMonth">Month</p>'+	        				
	        			'</td>'+
        			'</tr>'+	        		
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "usbContainer" style = "float:left; width: 550px; height: 300px; border:solid 1px;"></div>' +
    						'<p><input type="radio" name="usb" id="usbDay" value="usbDay" checked>Day</p>'+
    						'<p><input type="radio" name="usb" id="usbWeek" value="usbWeek">Week</p>'+
    						'<p><input type="radio" name="usb" id="usbMonth" value="usbMonth">Month</p>'+	      	        				
	        			'</td>'+
	        		'</tr>'+
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "powerContainer" style = " float:left; width: 550px; height: 300px; border:solid 1px;"></div>' +
    						'<p><input type="radio" name="power" id="powerDay" value="powerDay" checked>Day</p>'+
    						'<p><input type="radio" name="power" id="powerWeek" value="powerWeek">Week</p>'+
    						'<p><input type="radio" name="power" id="powerMonth" value="powerMonth">Month</p>'+	   	        				
	        			'</td>'+
        			'</tr>'+	        		
	        		'<tr>'+
	        			'<td>'+
	        				'<div id = "batteryContainer" style = "float:left; width: 550px; height: 300px; border:solid 1px;"></div>' +
    						'<p><input type="radio" name="battery" id="batteryDay" value="batteryDay" checked>Day</p>'+
    						'<p><input type="radio" name="battery" id="batteryWeek" value="batteryWeek">Week</p>'+
    						'<p><input type="radio" name="battery" id="batteryMonth" value="batteryMonth">Month</p>'+	   	        				
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
        var devst = markers[i][3];
        if(devst == 'ON')
    	{
        	marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');
    	}
        else if(devst == 'OFF')
        {
        	marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
        } 
        else if(devst == 'TAMPER')
        {
        	marker.setIcon('http://maps.google.com/mapfiles/ms/icons/blue-dot.png');
        }
        else if(devst == 'FULLYPAID')
        {
        	marker.setIcon('http://maps.google.com/mapfiles/ms/icons/yellow-dot.png');
        }
        
         // Allow each marker to have an info window    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
                
                //Highcharts
                	//Container 1-Start
                   <%@include file="../../js/chargingDayHC.jsp"%> 				
					$('#chargingDay').click(function() {
						<%@include file="../../js/chargingDayHC.jsp"%> 
					});				         
				    $('#chargingWeek').click(function() {
						<%@include file="../../js/chargingWeekHC.jsp"%> 
					}); 
				    $('#chargingMonth').click(function() {
						<%@include file="../../js/chargingMonthHC.jsp"%> 
					}); 				    
				    //Container 1-End     	
                                        
                     //Container 2-Start
    				<%@include file="../../js/dcDayHC.jsp"%>
					$('#dcDay').click(function() {
						<%@include file="../../js/dcDayHC.jsp"%> 
					});				         
				    $('#dcWeek').click(function() {
						<%@include file="../../js/dcWeekHC.jsp"%> 
					}); 
				    $('#dcMonth').click(function() {
						<%@include file="../../js/dcMonthHC.jsp"%> 
					})				    
                     //Container 2-End  

                    //Container 3-Start                  
    				<%@include file="../../js/usbDayHC.jsp"%>   
					$('#usbDay').click(function() {
						<%@include file="../../js/usbDayHC.jsp"%> 
					});				         
				    $('#usbWeek').click(function() {
						<%@include file="../../js/usbWeekHC.jsp"%> 
					}); 
				    $('#usbMonth').click(function() {
						<%@include file="../../js/usbMonthHC.jsp"%> 
					})				    
    				//Container 3-End   
                     
                     //Container 4-Start
                    <%@include file="../../js/powerDayHC.jsp"%> 
					$('#powerDay').click(function() {
						<%@include file="../../js/powerDayHC.jsp"%> 
					});				         
				    $('#powerWeek').click(function() {;
						<%@include file="../../js/powerWeekHC.jsp"%> 
					}); 
				    $('#powerMonth').click(function() {
						<%@include file="../../js/powerMonthHC.jsp"%> 
					})				    
                     //Container 4-End    
                     
                    //Container 5-Start
                   <%@include file="../../js/batteryDayHC.jsp"%>
					$('#batteryDay').click(function() {
						<%@include file="../../js/batteryDayHC.jsp"%> 
					});				         
				    $('#batteryWeek').click(function() {
						<%@include file="../../js/batteryWeekHC.jsp"%> 
					}); 
				    $('#batteryMonth').click(function() {
						<%@include file="../../js/batteryMonthHC.jsp"%> 
					})					    
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
    
}
</script>
