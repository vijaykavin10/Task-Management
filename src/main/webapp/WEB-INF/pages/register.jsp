<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body bgcolor="#e3e4fa"> 
<div>
	<h2>Task Management</h2><hr><br>
        <form:form method="post" action="user/insertUser">
    	   <table>
                <thead><tr><th colspan="2"><h3>Create New User</h3></th></tr>
                </thead>
                <tbody>
                    <tr><td>First Name</td><td><input type="text" name="firstName" value="" /></td></tr>
                    <tr><td>Last Name</td><td><input type="text" name="lastName" value="" /></td></tr>
                    <tr><td>Email</td><td><input type="text" name="email" value="" /></td></tr>
                    <tr><td>User Name</td><td><input type="text" name="userName" value="" /></td></tr>
                    <tr><td>Password</td><td><input type="password" name="password" value="" /></td></tr>
                    <tr align=center><td colspan=2><input type="submit" value="Submit" /></td></tr>
                </tbody>
            </table>
        </form:form><br>
        <!-- <form method="post" action="/task-management">
      Already Registered <input type="submit" value="SignIn">
        </form> -->
    </div>
</body>
</html>