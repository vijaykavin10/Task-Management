<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

<c:set var="userType" value="admin" />
<c:set var="tasks" value="${taskList}" />
<c:set var="projectKey" value="CORE-" />

<spring:url value="/task/${user.userName}/getView" var="getToTaskView" />
<spring:url value="/user/${user.userName}/getView" var="getToUserView" />

<div class="jumbotron">
	<div class="container">
		<h3 align="center">${user.userName}</h3>
	</div>
	<div class="row">
<div class=col-md-offset-10>
	<a class="btn btn-primary btn-md" href="${getToTaskView}" role="button">Task</a>
	<c:if test="${user.userType == userType}">
		<a class="btn btn-primary btn-md" href="${getToUserView}" role="button">User</a>
	</c:if>
	</div>
	</div>
</div>

<div class="container" style="height: 350px">
	<div class="container">
		<table class="table table-responsive">
			<thead>
				<tr>
					<th>#Task ID</th>
					<th>Title</th>
					<th>Issue Type</th>
					<th>Priority</th>
					<th>Assignee</th>
					<th>Reporter</th>
					<th>Status</th>
					<th>Resolution</th>
					<th>Action</th>
				</tr>
			</thead>	
			<c:forEach var="task" items="${tasks}">
				<tr>
					<td> ${projectKey}${task.id}</td>
					<td> ${task.title} </td>
					<td> ${task.issueType} </td>
					<td> ${task.priority}</td>
					<td> ${task.assignee}</td>
					<td> ${task.reporter}</td>
					<td> ${task.status}</td>
					<td> ${task.resolution}</td>
					
					<spring:url value="/task/${user.userName}/${task.id}" var = "viewTaskUrl"/>
					<td><button class="btn btn-info" onclick="location.href='${viewTaskUrl}'">View</button> </td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<jsp:include page="fragments/footer.jsp" />

</body>
</html>