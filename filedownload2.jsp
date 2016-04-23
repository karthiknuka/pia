<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="uheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1,st;
ResultSet rs,rs1;
String ugprikey;
%>
<%
String fileid = request.getParameter("fileid");
String filename = request.getParameter("filename");
String groupname =request.getParameter("groupname");
System.out.println("groupname ="+groupname );
 con = databasecon.getconnection();
stmt = con.createStatement();
rs =stmt.executeQuery("select agk from userreg where groupname='"+groupname+"' and  username='"+uname+"' ");
if(rs.next()){
ugprikey = rs.getString("agk");
}
stmt1 = con.createStatement();
rs1 = stmt1.executeQuery("select encrypdata from usercloud where fileid='"+fileid+"' and filename='"+filename+"' and groupname='"+groupname+"' ");
if(rs1.next()){
	byte[] encrypdata = rs1.getBytes("encrypdata");
%>
<br><br>
<div align="center">
<form action="filedownload3.jsp" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u>Signature Data</u></b></font></td></tr>
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
<td><input type="text" name="filename" value="<%=filename%>"  readonly/></td><input type="hidden" name="groupname" value="<%=groupname%>"  readonly/></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td><font size="5">Encrypted Data</font></td>
<td><font size="5">:</font></td>
<td><textarea name="encdata" cols="25" rows="8" readonly><%=new String(encrypdata)%></textarea></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td><font size="5">Privatekey</font></td>
<td><font size="5">:</font></td>
<td><textarea name="ugprikey"  cols="25" rows="5"  ><%=ugprikey%></textarea></td>
</tr>
<td></td><td></td>
<tr>
<td></td><td></td>
<td align="left"><input type="submit" value="DECRYPT"></td>
</tr>
</table>
</form>
	</div>
	<%}%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>