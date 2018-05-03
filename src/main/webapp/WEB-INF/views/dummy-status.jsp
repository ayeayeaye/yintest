<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h1>Testing</h1>

<p>inputChargingStatus(mA) -->Random</p>
<c:forEach var="cStatus" items="${inputChargingStatus}" varStatus="counter">	
	${cStatus} , 
</c:forEach>
<br>
<p>outputDCStatus(mA) -->Random</p>
<c:forEach var="dcStatus" items="${outputDCStatus}" varStatus="counter">	
	${dcStatus} , 
</c:forEach> 
<br>
<p>outputDCStatus(mA) -->Random</p>
<c:forEach var="usb" items="${usbStatus}" varStatus="counter">	
	${usb} , 
</c:forEach>
<br>
<p>batteryConsumption(V) -->Random</p>
<c:forEach var="batery" items="${batteryConsumption}" varStatus="counter">	
	${batery} , 
</c:forEach>

<hr>

<form:form action="${pageContext.request.contextPath}/device/save" commandName="device" method="POST">

<%-- 	Device Id : <form:input path="deviceId"/>  <p>00000001 ~ 99999999</p> --%>
	
	Customer:
	<form:select path="devByCust"> 
	<c:forEach var="cust" items="${custList}">
		<form:option value="${cust.custId}" label="${cust.custName}" ></form:option>
	</c:forEach>
	</form:select><br/>

	GPS Lat : <form:input path="GPSLat"/><br/>
	GPS Long : <form:input path="GPSLong"/><br/>
	Usage Command: <form:input path="usageCommand"/><br/>
	Device Status : <form:input path="devStatus"/><br/>
	<p>1 ~ 4</p>
		
	<input type="submit" value="Create"/>
	
</form:form>
