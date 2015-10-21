<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="fragments/header.jsp" />

<div class="jumbotron">
	<div class="row">
		<div class=col-md-offset-1>
			<h4 align="left">Profile: ${user.username}</h4>
		</div>
	</div>
</div>

</html>