<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Simple Login Application Using Spring MVC</title>

<style>
form{border-bottom:1px solid #000000;background:rgba(250,250,250,0.9)}
img{float:left;width:100;height:100}
h2{padding:40px 0;font-size:34px;clear:right;font-family:Harrington;border-bottom:5px solid #fff;text-align:center;}
#create{float:right;clear:left;}
</style>
</head>
<body>
	<form:form>
	<img src="home.jpg"/><h2>TaskManagement</h2><input id="create" type="button" value="Create new task"/>
	</form:form><hr>
	<div>
	<h1><%= request.getAttribute("message") %></h1>
	</div>
</body>
</html>