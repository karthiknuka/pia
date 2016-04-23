<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="doheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('There is no public and private key for this group...!')</script>");
}
String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('User Successfully Added To The Group...Thankyou.')</script>");
}
String msg2 = request.getParameter("msg2");
if(msg2 != null){
out.println("<script>alert('User Doesn't Added...Please Recheck!')</script>");
}
%>

<br><br>
<div id="" class="forms">
<form action="addusers1.jsp" method="post">
	<table>
	<tr><td><font color="orange" size="6"><b><u>Add Users To Group:</u></b></font></td></tr>
	<tr><td><br></td></tr><tr><td><br></td></tr><tr><td><br></td></tr><tr></tr>
	<tr>
	<td align="right"><font color="gray" size="5"><b>Select User</b></font></td>
	<td><font color="gray" size="5"><b>:</b></font></td>
	<td><select name="uname" required>
	<option value="">select User</option>
	<%
	con = databasecon.getconnection();
	stmt = con.createStatement();
	
	rs = stmt.executeQuery("select username from userreg ");
	while(rs.next()){
	%>
	<option value="<%=rs.getString("username")%>"><%=rs.getString("username")%></option>
	<%
	}
	%>
	</select></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td align="right"><font color="gray" size="5"><b>Select Group</b></font></td>
	<td><font color="gray" size="5"><b>:</b></font></td>
	<td><select name="gname" required>
	<option value="">select Group</option>
	<%
	stmt1 = con.createStatement();
	
	rs1 = stmt1.executeQuery("select groupname from addinggroups");
	while(rs1.next()){
	%>
	<option value="<%=rs1.getString("groupname")%>"><%=rs1.getString("groupname")%></option>
	<%
	}
	%>
	</select></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
		<tr><td></td><td></td><td><input type="submit" value="ADD"></td></tr>
	</table>
	</form>
</div>
<br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>