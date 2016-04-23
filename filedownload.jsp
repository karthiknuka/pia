<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="uheader.jsp"%>
<%
String msg = request.getParameter("aces");
if(msg != null){
out.println("<script>alert('Sorry, You can not Access this file')</script>");
}
Connection con = databasecon.getconnection();
Statement stmt1=con.createStatement();
ResultSet rss = stmt1.executeQuery("select *from userreg where  status='revoke'  and  username='"+uname +"'");
if(rss.next()){
	System.out.println("if");
response.sendRedirect("userhome.jsp?aces3=notacess");
}
%>
<br><br><br><br>
<div align="center">
<span><font color="orange" size="6"><b><u>Shared Files</u></b></font></span>
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
rs = stmt.executeQuery("select * from usercloud where groupname =(select groupname from userreg where username='"+uname+"' )");
while(rs.next()){
%>
<tr>
<td align="center"><font size="4" color="#D6AD33"><b><%=rs.getString("fileid")%></b></td><td>&nbsp;&nbsp;</td>
<td><font size="4" color="#D6AD33"><b><%=rs.getString("filename")%></b></td><td>&nbsp;&nbsp;</td>
<td><font size="4" color="#D6AD33"><b><%=rs.getString("groupname")%></b></td><td>&nbsp;&nbsp;</td>
<td align="center"><font size="4" color="green"><b><a href="filedownload1.jsp?fileid=<%=rs.getString("fileid")%>&filename=<%=rs.getString("filename")%>&groupname=<%=rs.getString("groupname")%>">View Data</b></a></td>
</tr>
<%
}

%>
</table>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>