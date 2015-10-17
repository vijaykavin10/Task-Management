<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container" style="height: 350px">
	<div class="container">
		<table class="table table-responsive">
			<thead>
				<tr>
					<th>#Task ID</th>
					<th>Title</th>
					<th>Issue Type</th>
					<th>Priority</th>
					<th>Reporter</th>
				</tr>
				
				<c:forEach var="task" items="${taskList1}">
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<spring:url value="/resources/core/js/hello.js" var="coreJs" />
<spring:url value="/resources/core/js/bootstrap.min.js"
	var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>


