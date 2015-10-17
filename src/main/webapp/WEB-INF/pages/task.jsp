<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

<c:set var="tasks" value="${taskList}" />
<c:set var="projectKey" value="CORE-" />

<spring:url value="/task/${user.userName}/create" var="createTaskUrl" />
<spring:url value="/user/${user.userName}/getToHome" var="getHomePage" />
<spring:url value="/user/${user.userName}/all/getToTaskPage" var="getAllTask" />
<spring:url value="/user/${user.userName}/ASSIGNTOME/getToTaskPage" var="getTaskAssignToMe" />
<spring:url value="/user/${user.userName}/REPORTEDBYME/getToTaskPage" var="getTaskReportedByMe" />

<div class="jumbotron">
	<div class="row">
		<h3 align="center">${user.userName}</h3>
	</div>
	<div class="row">
		<div class=col-md-10>
			<div class="dropdown pull-right">
	  			<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">View Task
			  	<span class="caret"></span></button>
			  	<ul class="dropdown-menu">
			    	<li><a href="${getTaskAssignToMe}">AssignToMe</a></li>
			    	<li><a href="${getTaskReportedByMe}">ReportedByMe</a></li>
			    	<li><a href="${getAllTask}">All</a></li>
			  	</ul>
			</div>
		</div>
		<div class=col-md-2>
			<button class="btn btn-info" data-toggle="modal" data-target="#createTaskModal">Create Task</button>
			<a class="btn btn-primary btn-md" href="${getHomePage}" role="button">Home</a>
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
					<td> ${projectKey}${task.id}	</td>
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

<div class="modal fade" id="createTaskModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Task</h4>
			</div>
			<div class="modal-body">
				<form id="createTaskUrl" method="post" class="form-horizontal"
					data-toggle="validator" action="${createTaskUrl}">
					<div class="form-group">
						<label class="col-xs-3 control-label">Title</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" name="title"
								placeholder="Enter Name" required />
						</div>
						<div class="help-block with-errors"></div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Description</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" name="description"
								placeholder="Enter Description" required />
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Assignee</label>
						<div class="col-xs-5">
							<select name="assignee" class="form-control">
								<c:forEach items="${userNames}" var="item" varStatus="count">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Issue Type</label>
						<div class="col-xs-5">
							<select name="issueType" class="form-control">
								<c:forEach items="${issueTypes}" var="item" varStatus="count">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Components</label>
						<div class="col-xs-5">
							<select name="componentType" class="form-control">
								<c:forEach items="${componentTypes}" var="item"
									varStatus="count">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Priority</label>
						<div class="col-xs-5">
							<select name="priorityType" class="form-control">
								<c:forEach items="${priorityTypes}" var="item" varStatus="count">
									<option value="${item}">${item}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Comment</label>
						<div class="col-xs-5">
							<textarea class="form-control" rows="5" name="comment"
								id="comment"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-offset-4">
							<button type="submit" class="btn btn-primary btn-md">Create</button>
							<button type="button" class="btn btn-default btn-md"
								data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="fragments/footer.jsp" />

</body>
</html>