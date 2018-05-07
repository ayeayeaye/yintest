<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css"/>

<style>
.subtitle{
float: right;
}
.answer{
font-weight:bold;
margin-left: 5px;
}
</style>

<form:form action="${pageContext.request.contextPath}/agent/paid/${cust.custDevice.deviceId}" commandName="newPayment" method="POST" cssClass="form" >

<table class="table">	
		<tr style="background-color: #99bffc;">
			<td colspan="4">Customer Profile</td>
		</tr>	
		<tr>
			<td rowspan="3" style="width: 180px;height: 150px;"> 
				<c:set value="${cust.custPhoto.facePhoto}" var="img"></c:set>
				<img src="<%= request.getContextPath()%>/photo/${img}"  width="100%;" height="100%;">				
			</td>
			<td colspan="3">Customer Id:<span class="answer">${cust.custId}</span></td>
		</tr> 			
		<tr>
			<td colspan="3">Name:<span class="answer">${cust.custName}</span></td>
		</tr> 
		<tr >
			<td colspan="3">NRIC<span class="answer">:${cust.nric}</span></td>
		</tr> 
		
		<tr style="background-color: #99bffc;">
			<td colspan="4">Contact</td>
		</tr>		
		<tr>
			<td><span class="subtitle">Email</span></td>
			<td>:<span class="answer">${cust.email}</span></td>
			<td><span class="subtitle">Mobile</span></td>
			<td>:<span class="answer">${cust.mobile}</span></td>		
		</tr> 		
		<tr>
			<td><span class="subtitle">Latitude</span></td>
			<td>:<span class="answer">${cust.cusAddress.lat}</span></td>
			<td><span class="subtitle">Longitude</span></td>
			<td>:<span class="answer">${cust.cusAddress.longt}</span></td>
		</tr>
		<tr>
			<td><span class="subtitle">Address</span></td>
			<td colspan="3">:<span class="answer">${cust.cusAddress.roadName}</span></td>			
		</tr>		
		
		<tr style="background-color: #99bffc;">
			<td colspan="4">Other</td>
		</tr>		
		<tr>
			<td><span class="subtitle">Job</span></td>
			<td>:<span class="answer">${cust.job}</span></td>
			<td><span class="subtitle">Income</span></td>
			<td>:<span class="answer">${cust.income}</span></td>
		</tr>	
		<tr>
			<td><span class="subtitle">Adult</span></td>
			<td>:<span class="answer">${cust.noAdult}</span></td>
			<td><span class="subtitle">Child</span></td>
			<td>:<span class="answer">${cust.noChild}</span></td>
		</tr>	
		<tr>
			<td><span class="subtitle">Education</span></td>
			<td>:<span class="answer">${cust.education}</span></td>
			<td><span class="subtitle">House Type</span></td>
			<td>:<span class="answer">${cust.houseType}</span></td>
		</tr>
		<tr>
			<td><span class="subtitle">Comment</span></td>
			<td colspan="3">:<span class="answer">${cust.comment}</span></td>
		</tr>

		<tr style="background-color: #99bffc;">
			<td colspan="4">Device</td>
		</tr>
		<tr>
			<td><span class="subtitle">Device Id</span></td>
			<td>:<span class="answer">${cust.custDevice.deviceId}</span></td>
			<td><span class="subtitle">Device Status</span></td>
			<td>:<span class="answer">${cust.custDevice.devStatus}</span></td>
		</tr>		
		
		<tr style="background-color: #99bffc;">
			<td colspan="4">Payment</td>
		</tr>
		
		<c:forEach var="payment" items="${cust.custDevice.devPaymentList}" varStatus="counter">
		<tr>
			<td>${counter.count}.<span class="subtitle">Paid Amount</span></td>
			<td>:<span class="answer">${payment.payAmt}</span></td>
			<td><span class="subtitle">Paid Day</span></td>
			<td>:<span class="answer">${payment.payDay}</span></td>
		</tr>
		</c:forEach>		
				
		<tr>
			<td><span class="subtitle">Current Credit</span></td>
			<td>
				<c:forEach var="payment" items="${cust.custDevice.devPaymentList}" varStatus="loop">
					<c:if test="${loop.last}">
						<c:if test="${payment.currentCreditAmt == 0}">
								:<span class="answer">No credit-</span>
						</c:if>
							:<span class="answer">${payment.currentCreditAmt}</span>			
					</c:if>
				</c:forEach>			
			</td>
			<td><span class="subtitle">Enter Amount paid</span></td>
			<td>:<span class="answer"><form:input path="payAmt"/></span></td>			
		</tr>
		<tr>
			<td>Payment Comment</td>
			<td colspan="3"><div style="width: 100%;"><form:textarea path="payComment" cssStyle="width: 100%;"/></div></td>
		</tr>
		<tr>
			<td colspan="4"><button type="submit">Topup</button></td>
		</tr>
</table>

</form:form> 