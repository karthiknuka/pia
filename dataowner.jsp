<%@include file="guheader.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('User name (or) Password incorrect please check it..!')</script>");
}
%>
<br><br>
					<div class="forms"><br><br>
					<form action="dovalidation.jsp" method="post">
					<table>
					<tr><td><font color="orange" size="6"><b><u>Data Owner Login:</u></b></font></td></tr>
					<tr><td><br></td></tr>
					<tr><td><font color="gray" size="5"><b>User Name:</b></font></td></tr>
					<tr><td><input type="text" name="uname" placeholder="User Name" required=""></td></tr>
					<tr><td><font color="gray" size="5"><b>Password:</b></font></td></tr>
					<tr><td><input type="password" name="password" placeholder="Password" required=""></td></tr>
					<tr><td><br></td></tr>
					<tr><td><input type="submit" value="LOGIN">&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET"></td></tr>
					</table>
					</form>
</div><br><br><br><br><br><br><br><br>
<br><br>
<%@include file="footer.jsp"%>