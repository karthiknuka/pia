<%@include file="uheader.jsp"%>
<%@page import="databaseconnection.*,java.sql.*"%>
<%
String ms = request.getParameter("ms");
if(ms != null){
out.println("<script>alert('File Was Uploaded By User..')</script>");
}
Connection con = databasecon.getconnection();
Statement stmt1=con.createStatement();
ResultSet rss = stmt1.executeQuery("select *from userreg where  status='revoke' and  username='"+uname +"' ");
if(rss.next()){
response.sendRedirect("userhome.jsp?aces1=notacess");
}
%>
		<div align="center"><br><br><br>
<form action="ufileupload1.jsp" method="post" ENCTYPE="multipart/form-data">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u>File Upload</u></b></font></td></tr>
<tr><td><br><br><br></td></tr>
<tr>
<td><font size="5">Upload File here</font></td>
<td><font size="5">:</font></td>
<td><input type="file" name="filename"  required/></td>
</tr>
<tr><td><br></td></tr>
<tr>
<td></td>
<td></td>
<td><input type="submit" value="Continue"  required/></td>
</tr>
</table> <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br>
 <%@include file="footer.jsp"%>