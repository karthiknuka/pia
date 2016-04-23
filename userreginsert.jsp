<%@page import="databaseconnection.*,java.sql.*,RSA.*"%>
<%!
Connection con;
Statement stmt;
%>
<%
String name = request.getParameter("name");
String uname = request.getParameter("uname");
String password = request.getParameter("password");
String email = request.getParameter("email");
String contact = request.getParameter("contact");

con = databasecon.getconnection();
stmt = con.createStatement();

int i = stmt.executeUpdate("insert into userreg (name,username,password,email,contact,status) values('"+name+"','"+uname+"','"+password+"','"+email+"','"+contact+"','normal')");
if(i>0){
response.sendRedirect("users.jsp?msg=succ");
}else{
response.sendRedirect("users.jsp?msg1=fail");
}
%>
