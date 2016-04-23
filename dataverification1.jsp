<%@page import="databaseconnection.*,java.sql.*,RSA.*,java.io.*"%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>
<%
String fileid = request.getParameter("fid");
String filename = request.getParameter("fname");
String groupname = request.getParameter("groupname");

con = databasecon.getconnection();
stmt = con.createStatement();
ResultSet rs=stmt.executeQuery("select *from tpa where fid='"+fileid+"' ");
if(rs.next()){
response.sendRedirect("dataverifivation.jsp?msg=succ");
}else{
	stmt.executeUpdate("insert into tpa (fid,fname,groupname) values ('"+fileid+"','"+filename+"','"+groupname+"') ");
response.sendRedirect("dataverifivation.jsp?msg=succ");
}
%>