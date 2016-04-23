<%@page import="databaseconnection.*,java.sql.*,RSA.*,java.io.*"%>
<%@include file="doheader.jsp"%>
<br><br>
		<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Request Sent to TPA..!')</script>");
}
%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>
<div align="center">
<table>
	<span><font color="orange" size="6"><b><u>Auditing Results</u></b></font></span>
	<tr><td><br></td></tr>
	<tr>
	<th><font color="#996600" size="5"><b><u>File Id</u></b></font></th>
	<th>&nbsp;&nbsp;</th>	
	<th><font color="#996600" size="5"><b><u>File Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Group Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Status</u></b></font></th>
	</tr>
<%
con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select fid,fname,groupname,status from tpa");
while(rs.next()){
%>
<tr>
<td><font color="#669999" size="4"><b><%=rs.getString("fid")%></b></font></td>
	<th>&nbsp;&nbsp;</th>	
	<td><font color="#669999" size="4"><b><%=rs.getString("fname")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
	<td><font color="#669999" size="4"><b><%=rs.getString("groupname")%></b></font></td>
	<td>&nbsp;&nbsp;</td>
	<% if(rs.getString("status").equals("Real Data")){%>
<td><font color="Green" size="4"><b><%=rs.getString("status")%></b></font></td>
<%} else{%>
<td><font color="Red" size="4"><b><%=rs.getString("status")%></b></font></td><%}%>
	<td>&nbsp;&nbsp;</td>

</tr>
<%
}
%>
</table>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <%@include file="footer.jsp"%>
