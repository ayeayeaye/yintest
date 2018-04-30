<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover">
	<tr bgcolor="#80acf2">
		<th>#</th>
		<th>UserId</th>
		<th>UserName</th>
		<th>NRIC</th>
		<th>Address</th>
		<th>Mobile</th>
		<th>Email</th>
<!-- 		<th>Job</th>
		<th>Income</th>
		<th>Education</th>
		<th>No_Adult</th>
		<th>No_child</th>
		<th>House Type</th> -->
		<th>#</th>
	</tr>
	<c:if test="${!empty addList}">	
	<c:forEach var="add" items="${addList}" varStatus="counter">	
		<tr>
			<td>${counter.count}#</td>
			<td>${add.addressCustModel.custId}</td>
			<td>${add.addressCustModel.custName}</td>
			<td>${add.addressCustModel.nric}</td>
			<td>${add.roadName}</td>
			<td>${add.addressCustModel.mobile}</td>
			<td>${add.addressCustModel.email}</td>
<%-- 			<td>${add.addressCustModel.job}</td>
			<td>${add.addressCustModel.income}</td>
			<td>${add.addressCustModel.noAdult}</td>
			<td>${add.addressCustModel.noChild}</td>
			<td>${add.addressCustModel.education}</td>
			<td>${add.addressCustModel.houseType}</td> --%>
			<td><a href="${pageContext.request.contextPath}/agent/customer/detail/${add.addressCustModel.custId}">Details (Make Payment)</a></td>
		</tr>
	</c:forEach>
	</c:if>
</table>
