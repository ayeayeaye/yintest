<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form action="${pageContext.request.contextPath}/agent/registered/customer" commandName="custPro" method="POST" enctype="multipart/form-data" >

	
custName : <form:input path="cust.custName"/><br/>
nric : <form:input path="cust.nric"/><br/>
mobile : <form:input path="cust.mobile"/><br/>
email : <form:input path="cust.email"/><br/>

roadName : <form:input path="address.roadName"/><br/>
lat : <form:input path="address.lat"/><br/>
longt : <form:input path="address.longt"/><br/>

nricPhoto : <input type="file" name="nricFile"/><br/>
facePhoto : <input type="file" name="faceFile"/><br/>
housePhoto : <input type="file" name="houseFile"/><br/>

job : <form:input path="cust.job"/><br/>
income : <form:input path="cust.income"/><br/>
noAdult : <form:input path="cust.noAdult"/><br/>
noChild : <form:input path="cust.noChild"/><br/>
education : <form:input path="cust.education"/><br/>
<%-- byHouse : <form:input path="cust.byHouse"/><br/> --%>
comment : <form:input path="cust.comment"/><br/>

<form:button name="Submit">Register</form:button>	


	
	
</form:form>	