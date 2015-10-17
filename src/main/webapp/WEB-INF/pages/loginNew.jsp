<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
	
<spring:url value="/" var="urlHome" />
<spring:url value="user/loginUser" var="loginUser" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="${urlHome}">Task Management</a>
		</div>
	</div>
</nav>

<div class="jumbotron">
	<div class="container">
		<h3> Task Management </h3>
	</div>
</div>

<div class="container" style="height: 350px">
<div class="row">
	<div class="col-xs-8">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		    <li data-target="#myCarousel" data-slide-to="3"></li>
		  </ol>
		
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="resources/images/image1.jpg" alt="Task">
		    </div>
		
		    <div class="item">
		      <img src="resources/images/image2.jpg" alt="Task">
		    </div>
		
		    <div class="item">
		      <img src="resources/images/image3.jpg" alt="Task">
		    </div>
		
		    <div class="item">
		      <img src="resources/images/image4.png" alt="Task">
		    </div>
		  </div>
		
		  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	
	<div class="col-xs-4">
		<div class="loginDiv" style="float: right; width: 100%;">
			<button align="center" style="width:100%" type="button" class="btn btn-info glyphicon glyphicon-lock" data-toggle="collapse" data-target="#demo"> LogIn</button>
			<div id="demo" class="collapse in">
				<form role="form" method = "post" action="${loginUser}">
					<div class="form-group">
						<hr>
						<label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
						<input type="text" class="form-control" id="userName" name="userName" placeholder="Enter username">
					</div>
					<div class="form-group">
					    <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
					</div>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-sm btn-success btn-block"> <span class="glyphicon glyphicon-off"></span> Login</button>
						<button type="button" class="btn btn-sm btn-danger btn-block"> <span class="glyphicon glyphicon-remove"></span> Cancel</button>
					</div>
					<c:if test="${not empty message}">
					<div class="alert alert-cancel alert-dismissible" role="alert">
						<button type="button" class="btn btn-danger" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<strong>${message}</strong>
					</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>
</div>
</div>

<jsp:include page="fragments/footer.jsp" />

</body>
</html>