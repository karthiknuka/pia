<%@page import="databaseconnection.*,java.sql.*,DSA.*"%>
<%@include file="doheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs;
%>
<%
String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('This Group Already Existed With  This Name...!')</script>");
}
String msg2 = request.getParameter("msg2");
if(msg2 != null){
out.println("<script>alert('Group Successfully Added...Thankyou.')</script>");
}
String msg3 = request.getParameter("msg3");
if(msg3 != null){
out.println("<script>alert('Group Doesn't Added...Please Recheck!')</script>");
}
%>
<br><br>
<div id="" class="forms">
<form action="addgroup1.jsp" method="post">
	<table>
	<tr><td><font color="orange" size="6"><b><u>Adding The groups:</u></b></font></td></tr>
	<tr><td><br></td></tr>
	<tr>
	<td align="right"><font color="gray" size="5"><b>Add Groups</b></font></td>
	<td><font color="gray" size="5"><b>:</b></font></td>
	<td><input type="text" name="addgroups" required></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td></td><td></td><td><input type="submit" value="ADD"></td></tr>
	</table>
	</form>
</div>
<br></br>
<div id="" class="forms1">
<table>
<tr>
<th><font color="#003366" size="5"><b><u>S.no</u></b></font></th><th>&nbsp;&nbsp;&nbsp;&nbsp;</th><th><font color="#003366" size="5"><b><u>Group Name</b></u></font></th>
</tr>
<%
con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select groupname from addinggroups");
int i=0;
while(rs.next()){
	i++;
%>
<tr><td align="center"><font color="#999966" size="4"><b><%=i%></b></font></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td><font color="#999966" size="4"><b><%=rs.getString("groupname")%></b></font></td></tr>
<%
}
%>	
</table>
</div>
<br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>