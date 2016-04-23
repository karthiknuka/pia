<%@page import="databaseconnection.*,java.sql.*,ECC.*,java.security.*,java.security.spec.*"%>
<%@include file="doheader.jsp"%>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>
<br><br>
<%
String asgks = request.getParameter("asgkss");
String grpname = session.getAttribute("grpname").toString();

ECCSignature key1 = new ECCSignature();
key1.keyGeneration();
String PK = key1.getPubkey();
String SK = key1.getPrikey();
String user[]=asgks.split(",");
	con = databasecon.getconnection();
	stmt = con.createStatement();
	stmt1 = con.createStatement();
	ResultSet rrr=stmt.executeQuery("select fileid,filedata from usercloud where groupname='"+grpname+"'");
	while(rrr.next()){
PreparedStatement pstmt1=con.prepareStatement("update usercloud set encrypdata=AES_ENCRYPT(?,?) where groupname='"+grpname+"' and fileid=? ");
pstmt1.setBytes(1,rrr.getBytes(2));
pstmt1.setString(2,SK);
pstmt1.setString(3,rrr.getString(1));
pstmt1.executeUpdate();
	}
	for(int i=0;i<user.length;i++){
	stmt.executeUpdate("update userreg set agk='"+SK+"' where username='"+user[i]+"'  and  groupname='"+grpname+"' and status!='revoke' ");
	}
	response.sendRedirect("groupmembers.jsp?msg=suc");

%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>