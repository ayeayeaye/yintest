<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css"/>	
<style>
body .modal-dialog { margin-left: 50px; margin-top: 0;}
body .modal-content {width:1350px }

</style>
<div id="map_wrapper_dashboard">
    <div id="map_canvas_dashboard" class="mapping"></div>
</div>

<div id="myAddModal" class="modal" >
	<div class="modal-dialog" >
		  <!-- Modal content -->
		  <div class="modal-content">
		    <button type="button" class="close" aria-label="Close" onclick="document.getElementById('myAddModal').style.display='none'">
  				<span aria-hidden="true">&times;</span>
			</button>
		    
<!-- 		  <div class="modal-header">
			  	<div class="modal-title">
			  		<p id="modalTitle"></p>  				  	
			  	</div>
	  	</div> -->

		<div class="modal-body">
			
			<table class="table table-striped">

				<tr >
					<th rowspan="2"><div id="myCustFace"></div></th>
				    <th>Id</th>
				    <th>Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Road Name</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Job</th>
					<th>Income</th>
					<th>No Adult</th>
					<th>No Child</th>
					<th>Education</th>
					<th>House Type</th>

				</tr>				

					<tr>
					
						<td id="mycustId" > </td>
						<td id="mycustName" > </td>
						<td id="myemail" > </td>
						<td id="mymobile" > </td>	
						<td id="myroadName" > </td>	
						<td id="mylat" > </td>
						<td id="mylongt" > </td>	
						<td id="myjob" > </td>
						<td id="myincome" > </td>
						<td id="mynoAdult" > </td>
						<td id="mynoChild" > </td>
						<td id="myeducation" > </td>
						<td id="myhouseType" > </td>	

					</tr>

			</table>	

			<table class="table table-striped">

				<tr>
					<th rowspan="2"><div id="myCustFace"></div></th>
				    <th>Id</th>
				    <th>Name</th>
					<th>Email</th>
					<th>Mobile</th>
					<th>Road Name</th>
					<th>Latitude</th>
					<th>Longitude</th>
					<th>Job</th>
					<th>Income</th>
					<th>No Adult</th>
					<th>No Child</th>
					<th>Education</th>
					<th>House Type</th>

				</tr>				

					<tr>
					
						<td id="mydeviceId" > </td>
						<td id="mycustName" > </td>
						<td id="myemail" > </td>
						<td id="mymobile" > </td>	
						<td id="myroadName" > </td>	
						<td id="mylat" > </td>
						<td id="mylongt" > </td>	
						<td id="myjob" > </td>
						<td id="myincome" > </td>
						<td id="mynoAdult" > </td>
						<td id="mynoChild" > </td>
						<td id="myeducation" > </td>
						<td id="myhouseType" > </td>	

					</tr>
			</table>
			
	        	<table class="table table-bordered">	        		
	        		<tr>
	        			<td>
	        				<div id = "chargingContainer" style = "float:left; width: 350px; height: 250px; border:solid 1px;"></div>
    						<p><input type="radio" name="charging" id="chargingDay" value="chargingDay" checked>Day</p>
    						<p><input type="radio" name="charging" id="chargingWeek" value="chargingDay">Week</p>
    						<p><input type="radio" name="charging" id="chargingMonth" value="chargingMonth">Month</p>
	        			</td>      			

	        			<td>
	        				<div id = "dcContainer" style = "float:left; width: 350px;  height: 250px; border:solid 1px;"></div>
    						<p><input type="radio" name="dc" id="dcDay" value="dcDay" checked>Day</p>
    						<p><input type="radio" name="dc" id="dcWeek" value="dcWeek">Week</p>
    						<p><input type="radio" name="dc" id="dcMonth" value="dcMonth">Month</p>      				
	        			</td>
						<td>
	        				<div id = "usbContainer" style = "float:left; width: 350px; height: 250px; border:solid 1px;"></div>
    						<p><input type="radio" name="usb" id="usbDay" value="usbDay" checked>Day</p>
    						<p><input type="radio" name="usb" id="usbWeek" value="usbWeek">Week</p>
    						<p><input type="radio" name="usb" id="usbMonth" value="usbMonth">Month</p>      	        				
	        			</td>
	</tr>
	<tr>
	        			<td>
	        				<div id = "powerContainer" style = " float:left; width: 350px; height: 250px; border:solid 1px;"></div>
    						<p><input type="radio" name="power" id="powerDay" value="powerDay" checked>Day</p>
    						<p><input type="radio" name="power" id="powerWeek" value="powerWeek">Week</p>
    						<p><input type="radio" name="power" id="powerMonth" value="powerMonth">Month</p>  	        				
	        			</td>

	        			<td>
	        				<div id = "batteryContainer" style = "float:left; width: 350px; height: 250px; border:solid 1px;"></div>
    						<p><input type="radio" name="battery" id="batteryDay" value="batteryDay" checked>Day</p>
    						<p><input type="radio" name="battery" id="batteryWeek" value="batteryWeek">Week</p>
    						<p><input type="radio" name="battery" id="batteryMonth" value="batteryMonth">Month</p>   	        				
	        			</td>
	        		</tr>
	        	</table>	
	        										
		</div>
			
			<div class="modal-footer">
				<button type="submit" class="btn btn-default" id="submitBtn" >Add</button>
			</div>
			
			</div>				
	</div>					  		
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
			                '<c:out value="${devStaPro.device.deviceCustModel.custId}"/>',//0
			                '<c:out value="${devStaPro.device.deviceCustModel.custName}" />',//1
			                '<c:out value="${devStaPro.device.deviceCustModel.nric}" />',//2
			                '<c:out value="${devStaPro.device.deviceCustModel.email}" />',//3
			                '<c:out value="${devStaPro.device.deviceCustModel.mobile}" />',//4
			                '<c:out value="${devStaPro.device.deviceCustModel.job}" />',//5
			                '<c:out value="${devStaPro.device.deviceCustModel.income}" />',//6
			                '<c:out value="${devStaPro.device.deviceCustModel.noAdult}" />', //7
			                '<c:out value="${devStaPro.device.deviceCustModel.noChild}" />',//8
			                '<c:out value="${devStaPro.device.deviceCustModel.education}" />',//9
			                '<c:out value="${devStaPro.device.deviceCustModel.houseType}" />',//10
			                
			                '<c:out value="${devStaPro.device.deviceCustModel.cusAddress.roadName}" />',//11
			                <c:out value="${devStaPro.device.deviceCustModel.cusAddress.lat}" />,//12
			                <c:out value="${devStaPro.device.deviceCustModel.cusAddress.longt}" />,//13
			                
			           		'<img style="float:left; width:110px; height: 100px; border: solid 1px;" src="<%= request.getContextPath()%>/photo/${devStaPro.device.deviceCustModel.custPhoto.facePhoto}">',

			           		'<c:out value="${devStaPro.device.deviceId}" />', //15
			           		'<c:out value="${devStaPro.device.visitTime}" />', //16
			           		'<c:out value="${devStaPro.device.GPSLat}" />', //17
			           		'<c:out value="${devStaPro.device.GPSLong}" />', //18
			           		'<c:out value="${devStaPro.device.usageCommand}" />', //19
			           		'<c:out value="${devStaPro.device.devStatus}" />', //20

			                
			                
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

            
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow({ }), marker, i;
    
	<c:set var="mark" value="onMarker.png"/>
  
     // Loop through our array of markers & place each one on the map     
    for( i = 0; i < markers.length; i++ ) {

    	var position = new google.maps.LatLng(markers[i][12], markers[i][13]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        }); 
        var devst = markers[i][20];
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
               //infoWindow.setContent(infoWindowContent[i][0]);
                //infoWindow.open(map, marker);
                
                document.getElementById('myCustFace').innerHTML = markers[i][14];
                document.getElementById('mycustId').innerHTML = markers[i][0];
                document.getElementById('mycustName').innerHTML = markers[i][1];
                document.getElementById('mydeviceId').innerHTML = markers[i][15];
	
				document.getElementById('myemail').innerHTML = markers[i][3];
 				document.getElementById('mymobile').innerHTML = markers[i][4];
				document.getElementById('myroadName').innerHTML = markers[i][11];
				document.getElementById('mylat').innerHTML = markers[i][12];
				document.getElementById('mylongt').innerHTML = markers[i][13];
				document.getElementById('myjob').innerHTML = markers[i][5];
				document.getElementById('myincome').innerHTML = markers[i][6];
				document.getElementById('mynoAdult').innerHTML = markers[i][7];
				document.getElementById('mynoChild').innerHTML = markers[i][8];
				document.getElementById('myeducation').innerHTML = markers[i][9];
				document.getElementById('myhouseType').innerHTML = markers[i][10];
              
                
                var addModal= document.getElementById('myAddModal');
                addModal.style.display = "block";
                
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
