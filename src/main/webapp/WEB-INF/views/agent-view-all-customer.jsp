<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover">
	<tr bgcolor="#80acf2">
		<th>#</th>
		<th>Customer<br>Id</th>
		<th>Customer<br>Name</th>
		<th>Device<br>Id</th>
		<th>Address</th>
		<th>Mobile</th>
		<th>Credit<br>Status</th>
		<th>Device<br>Status</th>
		<th>Last<br>Visited</th>
		<th></th>
	</tr>
	<c:if test="${!empty custList}">	
	<c:forEach var="cust" items="${custList}" varStatus="counter">	
		<tr>
			<td>${counter.count}#</td>
			<td>${cust.custId}</td>
			<td>${cust.custName}</td>
			<td>${cust.custDevice.deviceId}</td>
			<td>${cust.cusAddress.roadName}</td>
			<td>${cust.mobile}</td>
			<td>
				<c:forEach var="payment" items="${cust.custDevice.devPaymentList}" varStatus="loop">
					<c:if test="${loop.last}">
						<c:if test="${payment.currentCreditAmt == 0}">
								No credit-
						</c:if>
							${payment.currentCreditAmt}					
					</c:if>
				</c:forEach>			
			</td>
			<td>${cust.custDevice.devStatus}</td>
			<td>?</td>

			<td><a href="${pageContext.request.contextPath}/agent/customer/detail/${cust.custId}" class="btn btn-secondary">Details</a></td>
		</tr>
	</c:forEach>
	</c:if>
</table>
