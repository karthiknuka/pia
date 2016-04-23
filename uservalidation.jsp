<%@page import="databaseconnection.*,java.sql.*"%>
<%!
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
String uname = request.getParameter("uname");
//session.setAttribute("uname",uname);
String password = request.getParameter("password");

con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select username,password from userreg where username='"+uname+"' and password='"+password+"' ");

if(rs.next()){
session.setAttribute("uname",uname);
response.sendRedirect("userhome.jsp?msg=succ");
}else{
response.sendRedirect("users.jsp?msg2=unsucc");
}
%>