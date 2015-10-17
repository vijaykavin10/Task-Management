<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

<c:set var="projectKey" value="CORE-" />
<c:set var="open" value="OPEN" />
<c:set var="inProgress" value="INPROGRESS" />
<c:set var="fixed" value="FIXED" />
<c:set var="unResolved" value="UNRESOLVED" />
<c:set var="resolved" value="RESOLVED" />
<c:set var="reOpen" value="REOPEN" />

<spring:url value="/user/${user.userName}/getToHome" var="getHomePage" />
<spring:url value="/task/${user.userName}/${task.id}/addComment" var="addComment" />
<spring:url value="/task/${user.userName}/${task.id}/update" var="updateTaskUrl"/>
<spring:url value="/task/${user.userName}/${task.id}/${inProgress}/updateStatus" var="updateStatusInProgress" />
<spring:url value="/task/${user.userName}/${task.id}/${fixed}/updateResolution" var="updateResolutionFixed" />
<spring:url value="/task/${user.userName}/${task.id}/${reOpen}/updateResolution" var="updateResolutionReOpen" />

<div class="jumbotron">
	<div class="row">
		<div class=col-md-4>
			<h4 align="left">${projectKey}${task.id}/ ${task.title}</h4>
		</div>
		<div class=col-md-offset-10>
			<a class="btn btn-primary btn-md" href="${getHomePage}" role="button">Home</a>
		</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="btn-group">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editTaskModal">Edit</button>
			<button type="button" class="btn btn-primary" data-target="#createComment" data-toggle="modal">Comment</button>
			<c:if test="${task.status == open}">
				<a class="btn btn-primary btn-md" href="${updateStatusInProgress}" role="button">Start Progress</a> 
			</c:if>
			<c:if test="${task.status == inProgress}">
				<button type="button" class="btn btn-primary">Code Review</button>
			</c:if>
			<c:if test="${task.status == resolved}">
				<button type="button" class="btn btn-primary">Verify Issue</button>
			</c:if>
			<c:if test="${task.resolution == unResolved}">
				<a class="btn btn-primary btn-md" href="${updateResolutionFixed}" role="button">Resolve Issue</a>
			</c:if>
			<c:if test="${task.resolution == fixed}">
				<a class="btn btn-primary btn-md" href="${updateResolutionReOpen}" role="button">ReOpen Issue</a>
			</c:if>
		</div>
	</div>

	<br>

	<div class="row">
		<div class="col-md-8">
			<fieldset class="fsStyle">
				<legend class="scheduler-border">
					<a data-toggle="collapse" data-target="#details" href="#"
						style="font-size: 18px">Details</a>
				</legend>
				<div class="container" id=details>
					<div class="row">
						<div class="col-md-2">
							<span>Type:</span>
						</div>
						<div class="col-md-2">
							<span>${task.issueType}</span>
						</div>
						<div class="col-md-2">
							<span>Status:</span>
						</div>
						<div class="col-md-2">
							<span>${task.status}</span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2">
							<span>Priority:</span>
						</div>
						<div class="col-md-2">
							<span>${task.priority}</span>
						</div>
						<div class="col-md-2">
							<span>Resolution:</span>
						</div>
						<div class="col-md-2">
							<span>${task.resolution}</span>
						</div>
					</div>
				</div>
			</fieldset>
		</div>

		<div class="col-md-4">
			<fieldset class="fsStyle">
				<legend class="scheduler-border">
					<a data-toggle="collapse" data-target="#people" href="#"
						style="font-size: 18px">People</a>
				</legend>
				<div class="container" id=people>
					<div class="row">
						<div class="col-md-2">
							<span>Reporter:</span>
						</div>
						<div class="col-md-2">
							<span>${task.reporter}</span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2">
							<span>Assignee:</span>
						</div>
						<div class="col-md-2">
							<span>${task.assignee}</span>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
	</div>

	<br>

	<div class="row">
		<div class="col-md-8">
			<fieldset class="fsStyle">
				<legend class="scheduler-border">
					<a data-toggle="collapse" data-target="#description" href="#"
						style="font-size: 18px">Description</a>
				</legend>
				<div class="container" id=description>
					<div class="row">
						<div class="col-md-6">
							<p>${task.description}</p>
						</div>
					</div>
				</div>
			</fieldset>
		</div>

		<div class="col-md-4">
			<fieldset class="fsStyle">
				<legend class="scheduler-border">
					<a data-toggle="collapse" data-target="#dates" href="#"
						style="font-size: 18px">Dates</a>
				</legend>
				<div class="container" id=dates>
					<div class="row">
						<div class="col-md-2">
							<span>Created:</span>
						</div>
						<div class="col-md-2">
							<span>${task.createdOn}</span>
						</div>
					</div>

					<div class="row">
						<div class="col-md-2">
							<span>Last Modified:</span>
						</div>
						<div class="col-md-2">
							<span>${task.lastModified}</span>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
	</div>

	<br>

	<div class="row">
		<div class="col-md-8">
			<fieldset class="fsStyle">
				<legend class="scheduler-border">
					<a data-toggle="collapse" data-target="#comments" href="#"
						style="font-size: 18px">Comments</a>
				</legend>
				<div class="container" id=comments>
					<c:forEach var="comment" items="${task.comments}">
						<div class="row">
							<div class="col-md-8">
								<fieldset class="fsStyle">

									<legend class="scheduler-border">
										<a data-toggle="collapse" data-target="#comment" href="#" style="font-size: 15px">${comment.createdUser}</a> 
										<span style="font-size: 13px"> added a comment</span>
										<c:if test="${comment.createdUser == user.userName}">
											<a data-toggle="modal" href="#editComment${comment.commentId}">
												<span class="glyphicon glyphicon-edit pull-right" style="font-size: 13px"></span>
											</a>
											<a data-toggle="modal" href="#deleteComment${comment.commentId}">
												<span class="glyphicon glyphicon-trash pull-right" style="font-size: 13px"></span>
											</a>
										</c:if>
									</legend>
									<div class="modal fade" id="deleteComment${comment.commentId}" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Delete</h4>
												</div>
		
												<spring:url value="/task/${user.userName}/${task.id}/${comment.commentId}/delete" var="deleteComment" />
												
												<div class="modal-body">
													Are you sure?
												</div>
												
												<div class="modal-footer">
													<a class="btn btn-danger" href="${deleteComment}">Delete</a>
        											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      											</div>
											</div>
										</div>
									</div>
												
												
									<div class="modal fade" id="editComment${comment.commentId}" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Edit Comment</h4>
												</div>
												<div class="modal-body">
													<spring:url value="/task/${user.userName}/${task.id}/${comment.commentId}/updateComment" var="updateCommentUrl" />
													<form id="editCommentForm${comment.commentId}" method="post" class="form-horizontal"
														data-toggle="validator" action="${updateCommentUrl}">
									
														<div class="form-group">
															<div class="col-xs-12">
																<textarea class="form-control" rows="5" name="comment"
																	id="comment">${comment.comment}</textarea>
															</div>
														</div>
									
														<div class="form-group">
															<div class="col-xs-offset-4">
																<button type="submit" class="btn btn-primary btn-md">update</button>
																<button type="button" class="btn btn-default btn-md"
																	data-dismiss="modal">Cancel</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<div class="container" id=comment>
										<div class="row">
											<div class="col-md-6">
												<p>${comment.comment}</p>
											</div>
										</div>
									</div>
								</fieldset>
							</div>
						</div>
					</c:forEach>
				</div>
			</fieldset>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			<button type="button" class="btn btn-default" href="#createComment"
				data-toggle="modal">Comment</button>
		</div>
	</div>

</div>

<div class="modal fade" id="createComment" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Comment</h4>
			</div>
			<div class="modal-body">
				<form id="createCommentForm" method="post" class="form-horizontal"
					data-toggle="validator" action="${addComment}">

					<div class="form-group">
						<div class="col-xs-12">
							<textarea class="form-control" rows="5" name="comment"
								id="comment"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-offset-4">
							<button type="submit" class="btn btn-primary btn-md">Add</button>
							<button type="button" class="btn btn-default btn-md"
								data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="editTaskModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Edit Task</h4>
			</div>
			<div class="modal-body">
				<form id="createTaskUrl" method="post" class="form-horizontal"
					data-toggle="validator" action="${updateTaskUrl}">
					<div class="form-group">
						<label class="col-xs-3 control-label">Title</label>
						<div class="col-xs-5">
							<input type="text" class="form-control" name="title"
								value="${task.title}" required />
						</div>
						<div class="help-block with-errors"></div>
					</div>

					<div class="form-group">
						<label class="col-xs-3 control-label">Description</label>
						<div class="col-xs-5">
							<textarea class="form-control" rows="5" name="description"
								id="description" required >${task.description}</textarea>
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
						<div class="col-xs-offset-4">
							<button type="submit" class="btn btn-primary btn-md">Update</button>
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