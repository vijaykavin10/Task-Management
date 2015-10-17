<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login.</title>
<style>
body{background:url(1064553986.jpeg) no-repeat 0 0; background-size:cover;margin:0 auto;font:12px/20px arial,verdana}
h1{padding:40px 0;font-size:34px;  font-family:Harrington;border-bottom:5px solid #fff;text-align:center;background:rgba(250,250,250,0.9)}
.loginbox{font-family:Times New Roman;width:300px;margin:120px auto 0;padding:30px;border:1px solid #fff;box-shadow:0 0 3px #ccc;background:#fff;border-radius:20px 0 20px 0}
.loginbox h3{text-align:center; font-family:Times New Roman;}
.signupform{border-top:1px solid #306eff;font-family:Times New Roman;padding-top:20px;width:100%}
input[type=submit]{font-family:Times New Roman;border:none;background:#1569c7;padding:5px 10px;color:#fff}
input{border:1px solid #157dec;padding:2px 10px;}
table{font-family:Times New Roman}
img{float:left; width:100; height:100;}
</style>
    </head>
    <body>
	<img src="TaskTrackingLogo.jpg"><h1>Task Management</h1>
	<div class="loginbox">
	<h3>User Login</h3>
        <form:form align="center" method="post" action="user/loginUser">
            <table>
                <tr><td id="prop">User Name </td><td id="val"><input name="userName" type="text"></td></tr>
                <tr><td id="prop">Password </td><td id="val"><input name="password" type="password"></td></tr>
		<tr><td colspan="2" align="right"><input type="submit" value="Sign In"></td></tr>
            </table>
        </form:form><br>
		<div class="signupform">
        <form:form align="center" method="post" action="user/registerUser">
                	New User <input type="submit" value="SignUp">
        </form:form>
	</div>
	</div>
    </body>
</html>	