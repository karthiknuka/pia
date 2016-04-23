<%@page import="databaseconnection.*,java.sql.*"%>
<%@include file="uheader.jsp"%>
<%
String gpkey = request.getParameter("gpkey");
if(gpkey != null){
out.println("<script>alert('Incorrect Group Public Key...!')</script>");
}%>
<%!
Connection con;
boolean status=false;
Statement stmt,stmt1;
ResultSet rs,rs1;
byte[] sigdata;
%>
<%
con = databasecon.getconnection();
stmt = con.createStatement();
stmt1 = con.createStatement();
String fileid = request.getParameter("fileid");
String filename = request.getParameter("filename");
String groupname = request.getParameter("groupname");
session.setAttribute("groupname",groupname);

rs = stmt.executeQuery("select * from cloud where fid='"+fileid+"' and fname='"+filename+"' and groupname='"+groupname+"' ");
if(rs.next()){
sigdata = rs.getBytes("signature");
}
String[] sk=null;
//session.setAttribute("prikey",prikey);
ResultSet rss = stmt1.executeQuery("select secretkeys from cloud where fid='"+fileid+"' and fname='"+filename+"' and groupname='"+groupname+"' ");
if(rss.next()){
	String pk=rss.getString(1);
sk=pk.split("#");
}
System.out.println("skl="+sk.length);
	System.out.println("sk="+sk[0]);

for(int i=0;i<sk.length;i++)
{
	System.out.println("sk="+sk[i]);
System.out.println("sk1="+session.getAttribute("prikey").toString());
	if (sk[i].equals(session.getAttribute("prikey").toString())){
%>
<br><br>
<div align="center">
<form action="#" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u> Signature Data</u></b></font></td></tr>
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
<td><input type="text" name="fname" value="<%=filename%>"  readonly/></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td><font size="5">Signature Data</font></td>
<td><font size="5">:</font></td>
<td><textarea name="sigdata" cols="25" rows="8" readonly><%=new String(sigdata)%></textarea></td>
</tr>
<tr></tr><tr></tr>
<tr>
<td></td><td></td>
<td align="left"><font size="3" color="red"><b>Get Group PublicKey</b><a href="getgrouppubkey.jsp?fileid=<%=fileid%>&groupname=<%=groupname%>&filename=<%=filename%>&sigdata=<%=new String(sigdata)%>"><img src="images/key.png" width="75px" height="75px"/></a></td>
</tr>
</table>
</form><%
status=true;
System.out.println("sts="+status);
}
System.out.println("sts1="+status);
}
System.out.println("sts2="+status);
if(!status){
response.sendRedirect("fileaccess.jsp?aces=no");
}
%>
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>