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

if(uname.equals("TPA") && (password.equals("TPA"))){
String tpa="Third Party Auditor";
session.setAttribute("tpa",tpa);
response.sendRedirect("tpahome.jsp?msg=succ");
}else{
response.sendRedirect("tpa.jsp?msg=unsucc");
}
%>