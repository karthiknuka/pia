<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="uheader.jsp"%>
<%
String gpkey = request.getParameter("gpkey");
if(gpkey != null){
out.println("<script>alert('Incorrect Asymmetric Group Key Agreement Key...!')</script>");
}%>
<%!
Connection con;
boolean status=false;
Statement stmt,stmt1;
ResultSet rs,rs1;
byte[] sigdata;
byte[] encrypdata=null;
%>
<%
con = databasecon.getconnection();
stmt = con.createStatement();

String fileid = request.getParameter("fileid");
String filename = request.getParameter("filename");
String groupname = request.getParameter("groupname");
session.setAttribute("groupname",groupname);

rs = stmt.executeQuery("select * from usercloud where fileid='"+fileid+"' and filename='"+filename+"' and groupname='"+groupname+"' ");
if(rs.next())
{
	encrypdata = rs.getBytes("encrypdata");
%>
<br><br>
<div align="center">
<form action="#" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u> Shared Data</u></b></font></td></tr>
<tr><td><br></td></tr>
<tr>
<td><font size="5">File Id</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fileid" value="<%=fileid%>"  readonly/></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td><font size="5">File Name</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fname" value="<%=filename%>"  readonly/></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td><font size="5">Encrypted Data</font></td>
<td><font size="5">:</font></td>
<td><textarea name="encdata" cols="25" rows="8" readonly><%=new String(encrypdata)%></textarea></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td></td><td></td>
<td align="left"><font size="3" color="red"><b>Get Asymmetric Group Key Agreement</b><a href="filedownload2.jsp?fileid=<%=fileid%>&groupname=<%=groupname%>&filename=<%=filename%>"><img src="images/key.png" width="75px" height="75px"/></a></td>
</tr>
</table>
</form>
</div>
<%
}	
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>