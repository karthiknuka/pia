<%@include file="uheader.jsp"%>
<%
String msg = request.getParameter("aces");
if(msg != null){
out.println("<script>alert('Sorry, You can not Access Files')</script>");
}
String msg1 = request.getParameter("aces1");
if(msg1 != null){
out.println("<script>alert('Sorry, You can not Upload Files')</script>");
}
String msg3 = request.getParameter("aces3");
if(msg3 != null){
out.println("<script>alert('Sorry, You can not Download Files')</script>");
}
%>
<br><br>
<center><img src="images/PIA1.png" width="600" height="400" border="0" alt=""></center>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> <br>
<%@include file="footer.jsp"%>