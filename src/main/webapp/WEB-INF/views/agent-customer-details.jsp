<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/style.css" rel="STYLESHEET" type="text/css"/>


<form:form action="${pageContext.request.contextPath}/agent/paid/${cust.custDevice.deviceId}" commandName="newPayment" method="POST" cssClass="form" >

<table class="table table-bordered">	

		<tr style="background-color: #99bffc;">
			<td colspan="2">Customer Profile</td>
		</tr>
		
		<tr >
			<td rowspan="2" style="width: 180px;height: 150px;"> 
				<c:set value="${cust.custPhoto.facePhoto}" var="img"></c:set>
					<img src="<%= request.getContextPath()%>/photo/${img}"  width="100%;" height="100%;">				
			</td>
			<td>Customer Id: ${cust.custId}</td>
		</tr> 	
		<tr>
			<td >Device Id: ${cust.custDevice.deviceId}</td>
		</tr> 

		<tr>
			<td>Name</td>
			<td >:${cust.custName}</td>
		</tr> 
		<tr >
			<td>NRIC</td>
			<td>:${cust.nric}</td>
		</tr> 
		<tr>
			<td>Email</td>
			<td>:${cust.email}</td>
		</tr> 
		<tr>
			<td>Mobile</td>
			<td>:${cust.mobile}</td>
		</tr> 
		
		<tr>
			<td>Address</td>
			<td>:${cust.cusAddress.roadName}</td>
		</tr>		
		<tr>
			<td>Latitude</td>
			<td>:${cust.cusAddress.lat}</td>
		</tr>
		<tr>
			<td>Longtitude</td>
			<td>:${cust.cusAddress.longt}</td>
		</tr>
		<tr>
			<td>Job</td>
			<td>:${cust.job}</td>
		</tr>	
		<tr>
			<td>Income</td>
			<td>:${cust.income}</td>
		</tr>	
		<tr>
			<td>Adult</td>
			<td>:${cust.noAdult}</td>
		</tr>	
		<tr>
			<td>Child</td>
			<td>:${cust.noChild}</td>
		</tr>	
		<tr>
			<td>Education</td>
			<td>:${cust.education}</td>
		</tr>
		<tr>
			<td>House Type</td>
			<td>:${cust.houseType}</td>
		</tr>
		<tr>
			<td>Comment</td>
			<td>:${cust.comment}</td>
		</tr>

		<tr style="background-color: #99bffc;">
			<td colspan="2">Payment</td>
		</tr>
		<tr>
			<td>Enter Amount paid</td>
			<td><form:input path="payAmt"/> </td>
		</tr>
		<tr>
			<td>Payment Comment</td>
			<td><form:textarea path="payComment"/> </td>
		</tr>
		<tr>
		<td colspan="2"><button type="submit">Submit</button></td>
		</tr>
</table>

</form:form> 