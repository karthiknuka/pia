<%@page import="databaseconnection.*,java.sql.*,ECC.*,java.security.*,java.security.spec.*"%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
PreparedStatement pstmt;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
String encryptdata;
%>
<%
String username = request.getParameter("username");
String email = request.getParameter("email");
String groupname = request.getParameter("groupname");
con = databasecon.getconnection();
stmt = con.createStatement();
stmt1 = con.createStatement();
int i = stmt.executeUpdate("update userreg set status='revoke' where username='"+username+"' and email='"+email+"' and groupname='"+groupname+"' ");
if(i>0){
response.sendRedirect("revocation.jsp?msg=suc");
}
%>
