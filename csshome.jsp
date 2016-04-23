<%@include file="cssheader.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Welcome...!')</script>");
}
%>
<br><br>
<center><img src="images/cloud.jpg" width="600" height="400" border="0" alt=""></center>
<br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>