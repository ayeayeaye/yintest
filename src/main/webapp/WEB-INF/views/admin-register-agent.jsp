<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<form action="${pageContext.request.contextPath}/admin/registered/agent"  method="POST" >

<table class="table table-bordered">
	<tr> 
		<td>Agent Name</td>
		<td>
			<spring:bind path="newUserAgent.userName">
				 : <input type="text" name="${status.expression}" value="${status.value}"/><br/>
			</spring:bind>		
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div>
				<a class="btn btn-secondary" href="${pageContext.request.contextPath}" >Cancel</a>
				<input type="submit" value="Create" class="btn btn-primary"/>
			</div>
		</td>
	</tr>	
</table>

</form>