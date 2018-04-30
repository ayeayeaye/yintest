<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
.title{
	background-color: #99bffc;
}
.subtitle{
	left: 10px;;
	float: right;
}
.ansInput{
	width: 500px;;
}
.required:after {
	 content:" *"; 
	 color: red;
 }
</style>

<form action="${pageContext.request.contextPath}/agent/registered/customer" method="POST" enctype="multipart/form-data">
	
<table class="table table-bordered">

	<tr align="center" class="title">
		<td colspan="2"><h2 >Registration Form</h2><h6 class="required subtitle">These fields are required.</h6></td>
	</tr>
	
	<tr>
		<td><p class="subtitle  required">Customer Name<p></td>
		<td>
			<spring:bind path="custNew.custName">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><p class="subtitle  required">NRIC<p></td>
		<td>
			<spring:bind path="custNew.nric">
				: <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>

	<tr>
		<td><p class="subtitle  required">Road Name<p></td>
		<td>
			<spring:bind path="addressNew.roadName">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><p class="subtitle  required">GPS Latitude<p></td>
		<td>
			<spring:bind path="addressNew.lat">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><p class="subtitle  required">GPS Longitude<p></td>
		<td>
			<spring:bind path="addressNew.longt">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>

	<tr>
		<td><p class="subtitle required">NRIC:<p></td>
		<td><div class="ansInput"><input type="file" name="nricFile"  class="form-control" /></div></td>
	</tr>
	<tr>
		<td><p class="subtitle required">Face:<p></td>
		<td><div class="ansInput"><input type="file" name="faceFile"  class="form-control" /></div></td>
	</tr>
	<tr>
		<td><p class="subtitle required">House:<p></td>
		<td><div class="ansInput"><input type="file" name="houseFile"  class="form-control" /></div></td>	
	</tr>
			
	<tr>
		<td><p class="subtitle">Mobile<p></td>
		<td>
			<spring:bind path="custNew.mobile">
			 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><p class="subtitle">Email<p></td>
		<td>
			<spring:bind path="custNew.email">
			 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><p class="subtitle">Job<p></td>
		<td>
			<spring:bind path="custNew.job">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><p class="subtitle">Income<p></td>
		<td>
			<spring:bind path="custNew.income">
			 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>
		</td>
	</tr>
	<tr>
		<td><p class="subtitle">No of Adult<p></td>
		<td>
			<spring:bind path="custNew.noAdult">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>	
		</td>
	</tr>
	<tr>
		<td><p class="subtitle">No of Child<p></td>
		<td>
			<spring:bind path="custNew.noChild">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>	
		</td>
	</tr>	
	<tr>
		<td><p class="subtitle">Education<p></td>
		<td>
			<spring:bind path="custNew.education">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>	
		</td>
	</tr>
	<tr>
		<td><p class="subtitle">House Type<p></td>
		<td>
			<spring:bind path="custNew.houseType">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>	
		</td>
	</tr>	
	<tr>
		<td><p class="subtitle">Comment<p></td>
		<td>
			<spring:bind path="custNew.comment">
					<div style="width: 500px;height:200px; background-color: red;" >
					  <input type="text" name="${status.expression}" value="${status.value}" style="width: 100%; height: 100%;" /><br/>
					</div>			
			</spring:bind>	
		</td>
	</tr>	
	

	<tr>
		<td colspan="2">
			<div align="right">
				<a class="btn btn-secondary" href="${pageContext.request.contextPath}" >Cancel</a>
				<input type="submit" value="Create" class="btn btn-primary"/>
			</div>
		</td>
	</tr>	
	

</table>	
	
</form>	