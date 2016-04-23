<%@page import="databaseconnection.*,java.sql.*,RSA.*,java.io.*"%>
<%@include file="tpaheader.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Data Integrity Auditing Result Sent to DataOwner...')</script>");
}
%>
<br><br>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
PreparedStatement pstmt;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
String encryptdata;
%>
<div align="center">
<span><font color="orange" size="6"><b><u>Auditor Challenges:</u></b></font></span>
<table>
	
	<tr><td><br></td></tr>
	<tr>
	<th><font color="#996600" size="5"><b><u>File ID</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>File Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Group Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>View Data</u></b></font></th>
	</tr>
	<%
con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select * from tpa");
while(rs.next()){
%>
<tr>
<td><font color="#669999" size="4"><b><%=rs.getString("fid")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
	<td><font color="#669999" size="4"><b><%=rs.getString("fname")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
	<td><font color="#669999" size="4"><b><%=rs.getString("groupname")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
<td><a href="auditchallenge1.jsp?fileid=<%=rs.getString("fid")%>&filename=<%=rs.getString("fname")%>&groupname=<%=rs.getString("groupname")%>"><font color="green" size="3"><b>View Data</b></font></a></td>
</tr>
<%
}
%>
</table>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>