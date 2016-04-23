<%@page import="databaseconnection.*,java.sql.*"%>
<%!
Connection con;
Statement stmt;
ResultSet rs;
%>
<%
String uname = request.getParameter("uname");
String password = request.getParameter("password");

con = databasecon.getconnection();
stmt = con.createStatement();

if(uname.equals("CSS") && (password.equals("CSS"))){
String css="CloudStorageServer";
session.setAttribute("css",css);
response.sendRedirect("csshome.jsp?msg=succ");
}else{
response.sendRedirect("cloudstorage.jsp?msg=unsucc");
}
%>