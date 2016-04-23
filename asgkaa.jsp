<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="doheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
StringBuffer asgks = new StringBuffer(); 
String groupname1;
%>
<%
String grpname = request.getParameter("gname");session.setAttribute("grpname",grpname);
%>
<div id="" class="forms">
	<br><br><br>
	<table align="center">
	<tr><td><font color="orange" size="6"><b><u>Group Key Aggreement:</u></b></font></td></tr>
	<tr><td><br></td></tr>
	<tr>



</tr>
<tr><td><br></td></tr>
	<tr>
	<th><font color="#996600" size="5"><b><u>User Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Email</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font color="#996600" size="5"><b><u>Group Name</u></b></font></th>
	</tr>
	<%
	con = databasecon.getconnection();
	stmt1 = con.createStatement();
	rs1 = stmt1.executeQuery("select  * from userreg where groupname='"+grpname+"' ");
	while(rs1.next()){
		asgks.append(rs1.getString("username"));
		asgks.append(",");
		System.out.println(asgks);
	%>
	<tr>
	<td><font color="#669999" size="4"><b><%=rs1.getString("username")%></b></font></td>
	<th>&nbsp;&nbsp;</th>
	<td><font color="#669999" size="4"><b><%=rs1.getString("email")%></b></font></td>
	<th>&nbsp;&nbsp;</th>
	<td><font color="#669999" size="4"><b><%=rs1.getString("groupname")%></b></font></td>
	</tr>
	<%
	}if(asgks != null){
	asgks.deleteCharAt(asgks.length()-1);
	}
	%>
</table>
<br><br><br>
<center><a href="asgka1.jsp?asgkss=<%=asgks%>&grpname=<%=grpname%>"><font color="#CC0000" size="3"><b>Genrate Group Aggreement Key</b></font></a></center>
</div>
<br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>