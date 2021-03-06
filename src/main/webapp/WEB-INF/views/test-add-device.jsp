<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1>For testing</h1>
<form:form action="${pageContext.request.contextPath}/test/device/added" commandName="dev" method="POST">


GPSLat : <form:input path="GPSLat"/><br/> 
GPSLong : <form:input path="GPSLong"/><br/> 
devStatus : 
<form:select path="devStatus">
	<form:option value="On" label="On"></form:option>
	<form:option value="Off" label="Off"></form:option>
</form:select>
<br/> 
chargeStatus : <form:input path="chargeStatus"/><br/>
DCStatus : <form:input path="DCStatus"/><br/> 
USBStatus : <form:input path="USBStatus"/><br/> 
devByCust : 
<form:select path="devByCust"> 
	<c:forEach var="cust" items="${cusList}">
		<form:option value="${cust.custId}" label="${cust.custName}" ></form:option>
	</c:forEach>
</form:select>
<br/>

<form:button name="Submit">Register Device (Test)</form:button>	

	
</form:form>	