<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<form action="${pageContext.request.contextPath}/agent/registered/customer" method="POST" enctype="multipart/form-data">
	
	
	<spring:bind path="custNew.custName">
		custName : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="custNew.nric">
		nric : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="custNew.mobile">
		mobile : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="custNew.email">
		email : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="custNew.job">
		job : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="custNew.income">
		income : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
	
	<spring:bind path="custNew.noAdult">
		noAdult : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>	<spring:bind path="custNew.noChild">
		noChild : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="custNew.education">
		education : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="custNew.houseType">
		houseType : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
	<spring:bind path="custNew.comment">
		comment : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
	
	
	<spring:bind path="addressNew.roadName">
		roadName : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>
		<spring:bind path="addressNew.lat">
		lat : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>	
	<spring:bind path="addressNew.longt">
		longt : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
	</spring:bind>

	nricPhoto : <input type="file" name="nricFile"/><br/>
	facePhoto : <input type="file" name="faceFile"/><br/>
	housePhoto : <input type="file" name="houseFile"/><br/>
	
	
	<input type="submit" value="Create"/>
	
	
</form>	