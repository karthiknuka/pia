<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="doheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
StringBuffer asgks = new StringBuffer();
String groupname1;
%>
<br><br>
<div id="" class="forms">
<form action="asgkaa.jsp" method="post">
	<table>
	<tr><td><font color="orange" size="6"><b><u>Group Key Aggreement:</u></b></font></td></tr>
	<tr><td><br></td></tr>	<tr><td><br></td></tr>
	<tr>
	<td align="right"><font color="gray" size="5"><b>Select Group</b></font></td>
	<td><font color="gray" size="5"><b>:</b></font></td>
	<td><select name="gname" required>
	<option value="">select Groups</option>
	<%
	con = databasecon.getconnection();
	stmt = con.createStatement();
	
	rs = stmt.executeQuery("select groupname from addinggroups ");
	while(rs.next()){
	%>
	<option value="<%=rs.getString("groupname")%>"><%=rs.getString("groupname")%></option>
	<%
	}
	%>
	</select></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td></td><td></td><td><input type="submit" value="ASGKA"></td></tr>
	</table>
	</form>
</div><br><br>
<br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>