<%@include file="guheader.jsp"%>
<br><br>
<div align="center">
<form action="userreginsert.jsp" method="post">
<table>
<tr><td colspan="3"><font size="6" color="orange"><b><u>Registration Form</u></b></font></td></tr>
<tr><td><br></td></tr>
<tr>
<td><font size="5">Name</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="name"  required/></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td><font size="5">User Name</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="uname"   required/></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td><font size="5">Password</font></td>
<td><font size="5">:</font></td>
<td><input type="password" name="password"  required/></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td><font size="5">Email</font></td>
<td><font size="5">:</font></td>
<td><input type="email" name="email"  required/></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td><font size="5">Contact</font></td>
<td><font size="5">:</font></td>
<td><input type="text" name="contact" maxlength="10" pattern ="[789][0-9]{9}"required/></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td align="right"><input type="submit" value="Submit"></td><td></td>
<td><input type="reset" value="Reset"/></td>
</tr>
</table>
</form>
</div>
<br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>