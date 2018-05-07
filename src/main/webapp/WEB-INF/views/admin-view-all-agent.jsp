<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
.closeSpan{
	float: right;
	margin-right: 5px;
}
</style>

<table class="table table-bordered">
	<tr bgcolor="#80acf2">
		<th>#</th>
		<th>Name</th>
		<th>Role</th>
		<th></th>
		<th></th>
		<th></th>
	</tr>
	<c:forEach var="user" items="${userList}" varStatus="counter">	
	<tr>
		<td>${counter.count}</td>
		<td>${user.userName}</td>
		<td>
			<c:if test="${user.isAdmin() eq true}">
				Admin
			</c:if>
			<c:if test="${user.isSupervisor() eq true}">
				Supervisor
			</c:if>
			<c:if test="${user.isAgent() eq true}">
				Agent
			</c:if>
			<c:if test="${user.isSubAgent() eq true}">
				SubAgent
			</c:if>			
		</td>
										
		<td><c:if test="${user.isAgent() eq true}"><button>Create</button></c:if></td>
		<td><c:if test="${user.isAgent() eq true}"><a class="myCreateLink btn btn-warning btn-sm">Edit</a></c:if></td>
		<td><c:if test="${user.isAgent() eq true}"><a class="btn btn-danger btn-sm">Delete</a></c:if></td>
		
	</tr>
	</c:forEach>
</table>

<!-- Create Modal start-->
<div id="myCeateModal" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
		    <button type="button" class="close" onclick="document.getElementById('myCeateModal').style.display='none'">
  				<span aria-hidden="true" class="closeSpan">&times;</span>
			</button>
		  	<div class="modal-header">
			  	<div class="modal-title">
			  		<p id="modalTitle">Create Agent</p>  				  	
			  	</div>
	  		</div>
	  		<div class="modal-body"> 
<form action="${pageContext.request.contextPath}/admin/registered/agent"  method="POST" >

<table class="table">
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
				<input type="submit" value="Submit" class="btn btn-primary"/>
			</div>
		</td>
	</tr>	
</table>

</form>  		
	  		</div>		
		</div>
	</div>
</div>
<!-- Create Modal end-->

<script>


$(".myCreateLink").click(function() {
	var addModal= document.getElementById('myCeateModal');
	addModal.style.display = "block";
});
</script>

