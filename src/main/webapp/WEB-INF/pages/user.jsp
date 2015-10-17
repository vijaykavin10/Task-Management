<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

<c:set var="users" value="${userList}" />

<spring:url value="/user/${user.userName}/create" var="createUserUrl" />
<spring:url value="/user/${user.userName}/getToHome" var="getHomePage" />

<div class="jumbotron">
	<div class="container">
<!-- 		<h3 align="center">Task Management</h3> -->
<h3 align="center">${user.userName}</h3>
	</div>
	<a class="btn btn-primary btn-lg" href="#createUserModal" data-toggle="modal" role="button">Create User</a>
	<a class="btn btn-primary btn-lg" href="${getHomePage}" role="button">Home</a>
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
			</thead>				
			<c:forEach var="userItem" items="${users}">
				<tr>
					<td> ${userItem.id}	</td>
					<td> ${userItem.userName} </td>
					<td> ${userItem.email} </td>
					<td> ${userItem.userType}</td>
				</tr>
			</c:forEach>
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
						<label class="col-xs-3 control-label">User Name</label>
						<div class="col-xs-5">
							<input type="password" class="form-control" name="password"
								placeholder="Enter Password" required />
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
							<button type="button" class="btn btn-default btn-md" data-dismiss="modal">Cancel</button>
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