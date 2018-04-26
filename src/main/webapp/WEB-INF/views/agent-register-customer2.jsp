<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form action="${pageContext.request.contextPath}/agent/registered/customer" commandName="custPro" method="POST" enctype="multipart/form-data" >

	
custName : <form:input path="customer.custName"/><br/>
nric : <form:input path="customer.nric"/><br/>
mobile : <form:input path="customer.mobile"/><br/>
email : <form:input path="customer.email"/><br/>

roadName : <form:input path="address.roadName"/><br/>
lat : <form:input path="address.lat"/><br/>
longt : <form:input path="address.longt"/><br/>

nricPhoto : <input type="file" name="nricFile"/><br/>
facePhoto : <input type="file" name="faceFile"/><br/>
housePhoto : <input type="file" name="houseFile"/><br/>

job : <form:input path="customer.job"/><br/>
income : <form:input path="customer.income"/><br/>
noAdult : <form:input path="customer.noAdult"/><br/>
noChild : <form:input path="customer.noChild"/><br/>
education : <form:input path="customer.education"/><br/>
houseType : <form:input path="customer.houseType"/><br/> 
comment : <form:input path="customer.comment"/><br/>

<form:button name="Submit">Register</form:button>	
	
</form:form>	