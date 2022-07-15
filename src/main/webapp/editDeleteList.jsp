<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #fff;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #fff;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
body{
  background-color: #fafad2;
}
</style>
</head>
<body>
<br>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<center><font color="black" size="6">Succesfully Updated</font></center>
<%
}
%>
<%
if("invalid".equals(msg))
{%>
<center><font color="black" size="6">Something went wrong! Try Again!</font></center>
<%
}
%>
<%
if("deleted".equals(msg))
{%>
<center><font color="black" size="6">Succesfully Deleted</font></center>
<%
}
%>
<center>
<table id="customers">
<tr>
<th style="background-color:#ff6347">ID</th>
<th style="background-color:#ff6347">Name</th>
<th style="background-color:#ff6347">Father Name</th>
<th style="background-color:#ff6347">Mother Name</th>
<th style="background-color:#ff6347">Mobile Number</th>
<th style="background-color:#ff6347">Gender</th>
<th style="background-color:#ff6347">Email</th>
<th style="background-color:#ff6347">Blood Group</th>
<th style="background-color:#ff6347">Address</th>
<th style="background-color:#ff6347">Edit</th>
<th style="background-color:#ff6347">Delete</th>
</tr>
<tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from donor");
	while(rs.next())
	{
		
	%>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td>
	<td><%=rs.getString(8) %></td>
	<td><%=rs.getString(9) %></td>
	<td><a href="updateDonor.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
    <td><a href="deleteDonor.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
    </tr>
    <%
    }
    }
    catch(Exception e)
{
    	System.out.println(e);
    	}
%>




</table>
</center>
<br>
<br>
<br>
<br>

</body>
</html>