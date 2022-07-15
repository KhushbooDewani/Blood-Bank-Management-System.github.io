<%
String username=request.getParameter("username");
String password=request.getParameter("password");
if("admin".equals(username) && "Khushboo123".equals(password))
{
response.sendRedirect("home.jsp");
}
else
{
response.sendRedirect("adminLogin.jsp?msg=invalid");
}
%>