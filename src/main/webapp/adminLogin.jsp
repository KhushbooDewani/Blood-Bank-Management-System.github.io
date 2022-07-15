<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"]
{
    border: none;
    background:white;
    height: 50px;
    font-size: 18px;
	margin-left:35%;
	padding:15px;
	width:35%;	
	border-radius: 27px;
}
body{
  background-color: #fafad2;
}
.header{
  background-color: #ff6347	;
}
</style>
</head>
<body>
<div class="header">
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>
<body>
<div class="container">
<br>
	<br>
	<%
	String msg=request.getParameter("msg");
	if("invalid".equals(msg))
	{
		
	%>
	<center><font color="red" size="5">Invalid Username/Password</font></center>
	<%
	}%>
<form action="adminLoginAction.jsp"method="post">
<div class="form-group">
<center><h2>Username</h2></center>
<input type="text" placeholder="Enter Username" name="username" required>
<center><h2>Password</h2></center>
<input type="password" placeholder="Enter Password" name="password" required>
<center><button type="submit" class="button">Submit</button></center> 
</form>	
</div>
<br>
<br>
<br>
<br>
</body>
</html>
