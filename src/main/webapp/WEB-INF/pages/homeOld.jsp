<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />
<c:set var="userType" value="admin" />

<spring:url value="" var="getHomePage" />
<spring:url value="/user/${user.userName}/getHome" var="getHomePage" />
<spring:url value="/user/${user.userName}/getUserHome" var="getUserHome" />


<div class="jumbotron">
	<div class="container">
		<h3 align="center">Task Management</h3>
	</div>
	<ul class="nav nav-pills pull-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#">Task <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="#createTaskModal" data-toggle="modal">Create</a></li>
				<li><a href="${getHomePage}">List</a></li>
				<li><a href="#testDD" data-toggle="modal">Test</a></li>
			</ul>
		</li>
		<c:if test="${user.userType == userType}">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">User <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#createUserModal" data-toggle="modal">Create</a></li>
					<li><a href="${getUserHome}">List</a></li>
				</ul></li>
		</c:if>
	</ul>

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
<!-- 					<th>Assignee</th> -->
					<th>Reporter</th>
				</tr>
				
				<c:forEach var="task" items="${taskList}">
				<tr>
					<td> ${task.id}	</td>
					<td> ${task.title} </td>
					<td> ${task.issueType} </td>
					<td> ${task.priority}</td>
					<td> ${task.reporter}</td>
				</tr>
				</c:forEach>
			
			</thead>

		</table>
	</div>
</div>

<div class="container" style="height: 350px">


	<div class="container">

		<table class="table table-responsive">
			<thead>
				<tr>
					<th>User Id</th>
					<th>UserName</th>
					<th>Email Id</th>
					<th>UserType</th>
				</tr>
				
				<c:forEach var="task" items="${userList}">
				<tr>
					<td> ${user.id}	</td>
					<td> ${user.userName} </td>
					<td> ${user.email} </td>
					<td> ${user.userType}</td>
				</tr>
				</c:forEach>
			
			</thead>

		</table>
	</div>
</div>

<div class="modal fade" id="createUserModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create User</h4>
			</div>
			<div class="modal-body">
				<form id="createUserUrl" method="post" class="form-horizontal"
					data-toggle="validator" action="${createUserUrl}">
					<div class="form-group">
						<label class="col-xs-3 control-label">FirstName</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" name="firstName"
								placeholder="Enter FirstName" required />
						</div>
						<div class="help-block with-errors"></div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">LastName</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" name="lastName"
								placeholder="Enter Last Name" required />
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Email Id</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" name="email"
								placeholder="Enter Email ID" required />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-3 control-label">User Name</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" name="userName"
								placeholder="Enter User Name" required />
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-xs-3 control-label">User Type</label>
						<div class="col-xs-5">
							<select name="userType" class="form-control">
								<c:forEach items="${userTypes}" var="item" varStatus="count">
									<option value="${count.index}">${item}</option>
								</c:forEach>
							</select>
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
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>



<spring:url value="" var="userActionUrl" />
<spring:url value="getAllUserName" var="getAllUserName" />
<spring:url value="/task/${user.userName}/create" var="createTaskUrl" />

<div class="modal fade" id="createTaskModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
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
									<option value="${count.index}">${item}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Issue Type</label>
						<div class="col-xs-5">
							<select name="issueType" class="form-control">
								<c:forEach items="${issueTypes}" var="item" varStatus="count">
									<option value="${count.index}">${item}</option>
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
									<option value="${count.index}">${item}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Priority</label>
						<div class="col-xs-5">
							<select name="priorityType" class="form-control">
								<c:forEach items="${priorityTypes}" var="item" varStatus="count">
									<option value="${count.index}">${item}</option>
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
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
<spring:url value="/user/${user.userName}/test" var="userTest" />
<div class="modal fade" id="testDD" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Create Task</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" action="${userTest}" method="post">
					<select name="selectedString" class="form-control">
						<c:forEach items="${userNames}" var="item" varStatus="count">
							<option value="${count.index}">${item}</option>
						</c:forEach>
					</select>
					<div class="form-group">
						<button type="submit" class="btn btn-success">Test</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>


<jsp:include page="fragments/footer.jsp" />

</body>
</html>