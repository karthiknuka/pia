<%@include file="doheader.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Upload Failed..')</script>");
}

String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('The Cipher Text sent to reviver Successfully')</script>");
}
String msg2 = request.getParameter("msg2");
if(msg2 != null){
out.println("<script>alert('Successfully Signatured Data uploaded...')</script>");
}
String msg3 = request.getParameter("msg3");
if(msg3 != null){
out.println("<script>alert('Signatured Data uploading the  Failed..')</script>");
}
%>
		<div align="center"><br><br><br>
<form action="fileupload1.jsp" method="post" ENCTYPE="multipart/form-data">
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
</table> <br><br>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <%@include file="footer.jsp"%>