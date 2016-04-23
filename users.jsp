<%@include file="guheader.jsp"%>
<%
String msg = request.getParameter("msg");
if(msg != null){
out.println("<script>alert('Registration Successfull Please login..!')</script>");
}
String msg1 = request.getParameter("msg1");
if(msg1 != null){
out.println("<script>alert('Registration Unsuccessfull Please login..!')</script>");
}
String msg2 = request.getParameter("msg2");
if(msg2 != null){
out.println("<script>alert('User name (or) Password incorrect please check it..!')</script>");
}
%>
<br><br>
					<div class="forms">
					<form action="uservalidation.jsp" method="post">
					<table>
					<tr><td><font color="orange" size="6"><b><u>User Login:</u></b></font></td></tr>
					<tr><td><br></td></tr>
					<tr><td><font color="gray" size="5"><b>User Name:</b></font></td></tr>
					<tr><td><input type="text" name="uname" placeholder="User Name" required=""></td></tr>
					<tr><td><font color="gray" size="5"><b>Password:</b></font></td></tr>
					<tr><td><input type="password" name="password" placeholder="Password" required=""></td></tr>
					
					<tr><td><input type="submit" value="LOGIN">&nbsp;&nbsp;&nbsp;<input type="reset" value="RESET"></td><td><a href="userregistration.jsp"><img src="images/register.png" width="75px" height="75px" /></a></td></tr>
					</table>
					</form>
				</div><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>