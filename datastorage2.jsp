<%@page import="databaseconnection.*,java.sql.*,RSA.*,java.io.*"%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>
<%
try{
String fileid = request.getParameter("fileid");
String filename = request.getParameter("fname");
String groupname = request.getParameter("groupname");
String signature = request.getParameter("signature");
System.out.println(fileid);
System.out.println(filename);
System.out.println(groupname);
System.out.println(signature);
con = databasecon.getconnection();
%>
<%
stmt = con.createStatement();
int i = stmt.executeUpdate("update cloud set signature='"+signature+"' where fid='"+fileid+"' and fname='"+filename+"' and groupname='"+groupname+"' ");
System.out.println(i);
if(i>0){
response.sendRedirect("datastorage.jsp?msg=succ");
}
}catch(Exception e){
e.printStackTrace();
}
%>