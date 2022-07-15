<%@page import="Project.ConnectionProvider" %>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<style>
table, th, td {
  border:1px solid black;
}
body{
  background-color: #fafad2;
}
</style>
<body>
<br>
<table style="width:100%">
  <tr>
    <th>No. of Requests Pending</th>
    <th>No. of Requests Completed</th>
    <th>No. of Donors Available</th>
  </tr>
  <tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select count(*) from bloodrequest where status='pending'");
	while(rs.next())
	{	
%>
  <th><%=rs.getString(1) %></th>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select count(*) from bloodrequest where status='completed'");
	while(rs.next())
	{	
%>
  <th><%=rs.getString(1) %></th>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select count(*) from donor");
	while(rs.next())
	{	
%>
  <th><%=rs.getString(1) %></th>
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
<br>
</body>
</html>