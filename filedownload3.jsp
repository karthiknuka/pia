<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="uheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1,st;
ResultSet rs,rs1;
String ugprikey;
byte[] decyptdata=null;
%>
<%

String fileid = request.getParameter("fileid");
String filename = request.getParameter("filename");
String groupname =request.getParameter("groupname");
//String encdata =request.getParameter("encdata");
String ugprikey=null;
try{
con = databasecon.getconnection();
stmt = con.createStatement();stmt1=con.createStatement();
ResultSet set=stmt1.executeQuery("select ugpubkey from usercloud where groupname='"+groupname +"' and fileid='"+fileid+"' ");
if(set.next()){
	
	ugprikey=set.getString(1);
}
rs =stmt.executeQuery("select AES_DECRYPT(encrypdata,'"+ugprikey.trim()+"') as decrypt from usercloud where groupname='"+groupname +"' and fileid='"+fileid+"'  ");
if(rs.next()){
decyptdata = rs.getBytes("decrypt");
}
%>
<br><br>
<div align="center">
<form action="ufinalDownload.jsp" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u>Shared Data</u></b></font></td></tr>
<tr><td><br></td></tr>
<tr>
<td><font size="5">File Id</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="fileid" value="<%=fileid%>"  readonly/></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td><font size="5">File Name</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="filename" value="<%=filename%>"  readonly/></td><input type="hidden" name="groupname" value="<%=groupname%>"  readonly/></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td><font size="5">Decrypted File Data</font></td>
<td><font size="5">:</font></td>
<td><textarea name="sigdata" cols="25" rows="8" readonly><%=new String(decyptdata)%></textarea></td>
</tr>
<tr></tr><tr></tr>
<td></td><td></td>
<td align="left"><input type="submit" value="DOWNLOAD"></td>
</tr>
</table>
</form>
<%}catch(Exception e){ e.printStackTrace();
response.sendRedirect("filedownload1.jsp?fileid="+fileid+"&filename="+filename+"&groupname="+groupname+"&gpkey=wrong");
}%>
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>