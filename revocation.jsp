<%@page import="databaseconnection.*,java.sql.*,RSA.*,java.io.*"%>
<%@include file="doheader.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Revocation done...')</script>");
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
<table>
	<tr><td><font color="orange" size="6"><b><u>User Revocations:</u></b></font></td></tr>
	<tr><td><br></td></tr><tr><td><br></td></tr>
	<tr>
	<th><font color="#996600" size="5"><b><u>User Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Email</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Group Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Revocation</u></b></font></th>
	</tr>
	<%
con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select * from userreg where status='normal' and groupname is not null ");
while(rs.next()){
%>
<tr>
<td><font color="#669999" size="4"><b><%=rs.getString("username")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
	<td><font color="#669999" size="4"><b><%=rs.getString("email")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
	<td><font color="#669999" size="4"><b><%=rs.getString("groupname")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
<td><a href="revocation1.jsp?username=<%=rs.getString("username")%>&email=<%=rs.getString("email")%>&groupname=<%=rs.getString("groupname")%>"><font color="green" size="3"><b>Revoke</b></font></a></td>
</tr>
<%
}
%>
</table>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>