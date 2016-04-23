<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="uheader.jsp"%>
<%
String msg = request.getParameter("aces");
if(msg != null){
out.println("<script>alert('Sorry, You can not Access this file')</script>");
}
con = databasecon.getconnection();
Statement stmt1=con.createStatement();
ResultSet rss = stmt1.executeQuery("select *from userreg where  status='revoke'  and  username='"+uname +"'");
if(rss.next()){
	System.out.println("if");
response.sendRedirect("userhome.jsp?aces=notacess");
}
%>
<br><br><br><br>
<div align="center">
<span><font color="orange" size="6"><b><u>Received Files</u></b></font></span>
<br><br><br>
<table>
<tr>
	<th><font size="5" color="#003366"><b><u>File Id</b></u></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font size="5" color="#003366"><b><u>File Name</b></u></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font size="5" color="#003366"><b><u>Group Name</u></b></font></th>
	<th>&nbsp;&nbsp;</th>
	<th><font size="5" color="#003366"><b><u>View Here</u></b></font></th>
</tr>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>
<%
con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select groupname,prikey from userreg where username='"+uname+"' ");
if(rs.next()){
	String prikey=rs.getString(2);
	session.setAttribute("prikey",prikey);
stmt1 = con.createStatement();
rs1 = stmt1.executeQuery("select * from cloud where groupname='"+rs.getString(1)+"' ");
while(rs1.next()){
%>
<tr>
<td align="center"><font size="4" color="#D6AD33"><b><%=rs1.getString("fid")%></b></td><td>&nbsp;&nbsp;</td>
<td><font size="4" color="#D6AD33"><b><%=rs1.getString("fname")%></b></td><td>&nbsp;&nbsp;</td>
<td><font size="4" color="#D6AD33"><b><%=rs1.getString("groupname")%></b></td><td>&nbsp;&nbsp;</td>
<td align="center"><font size="4" color="green"><b><a href="viewdata.jsp?fileid=<%=rs1.getString("fid")%>&filename=<%=rs1.getString("fname")%>&groupname=<%=rs1.getString("groupname")%>">View Data</b></a></td>
</tr>
<%
}
}
%>
</table>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>