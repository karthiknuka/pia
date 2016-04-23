<%@include file="doheader.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Applied the Asymmetric Group Key Agreement scheme for the group users...!')</script>");
}
String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('Sorry Group Agreement Key Generation Failed')</script>");
}
%>
<br><br><br><br><br><br>
<center><div class="form1">
<font size="6" color="#CC6600"><b><u>Group Members</u></b></font><br><br>
<ul>
<ol><font size="5" color="#001A33"><b><img src="images/user-group-128.png" width="50" height="50" border="0" alt=""><a href="addusers.jsp"><font color="Orange">&nbsp;&nbsp;Add Users</b></font></a></ol><br>
<ol><img src="images/key.png" width="50" height="50" border="0" alt=""><a href="asgka.jsp"><font size="5" color="#001A33	"><b>&nbsp;&nbsp;<font color="red">Group Key Aggreement(ASGKA)</b></font></a></ol>
</ul>
</div></center>
<br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>