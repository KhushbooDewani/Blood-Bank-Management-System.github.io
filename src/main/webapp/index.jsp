<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="email"], label[for="bloodgroup"]
{
    border: none;
    background:white;
    height: 50px;
    font-size: 18px;
	margin-left:2%;
	padding:15px;
	width: 300;	
}
select[name="bloodgroup"]
{
    border: none;
    background:white;
    height: 50px;
    font-size: 18px;
	padding:15px;
	width:100;
}
body{
  margin: 0;
  background-color: #fafad2;
}
.header{
  background-color: #ff6347	;
}
.container{
  height: 400px;
  display: flex;
  align-items: center;
  margin-left: 20px;
}
.container img{
  width: 500px;
  height: 400px;
  margin-right: 300px;
}

</style>
</head>
<body>

<div class="header">
  
  <div class="header-right">
    <a class="active" href="index.jsp">Home</a>
    <a href="adminLogin.jsp">Admin Login</a>
  </div>
</div>
<body>
  <br>
  <%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
	  %>
	  <center><font color="red" size="5">Form Submitted Succesfully. You will get notified within 6 hours.</font></center>
  <% 
  }
  %>
  <%
  if("invalid".equals(msg))
  {
  %>
	  <center><font color="red" size="5">Invalid Data! Try Again</font></center>
  <% 
  }
  %>
<div class="container">
    <img src="Logo.jpg"  />
<p>
<div style="flex-grow: 1;">
<center><h1>Enter Your Details to Request for Blood</h1></center><br>
 <form action="indexFormAction.jsp"method="post">
 <center>
 <input type="text" name="name" placeholder="Enter Name" required><br><br>
 <input type="text" pattern="[0-9]{10}" name="mobilenumber" placeholder="Enter Mobile Number" required><br><br>
 <input type="email" name="email" placeholder="Enter Email Address" required><br><br>
 <label for="bloodgroup">Choose Blood Group</label>
 <select name="bloodgroup">
<option value="A+">A+</option>
<option value="A-">A-</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="O+">O+</option>
<option value="O-">O-</option>
<option value="AB+">AB+</option>
<option value="AB-">AB-</option>
</select><br><br>
 <button class="button1"><span>Submit</span></button>
 </center>
 </form>
 </div>
 </p>
  </div>

</div>
 
  <br>
  <br>
  </div>
</div>

<div class="row1"> 
<div> 
<br>         
<br>
    </tbody>
  </table>
</div>
</div>
<h3><center>Made by Khushboo Dewani <br>
                     Helee Patel     <br>
                     Lata Parmar     <br>
                         </center></h3>

</body>
</html>

