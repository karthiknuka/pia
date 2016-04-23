<%@page import="databaseconnection.*,java.sql.*,java.math.BigInteger,java.security.*,java.security.spec.*,javax.crypto.KeyAgreement"%>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs,rs1;
%>
<%
	String uname = request.getParameter("uname");
	System.out.println("USER NAME:--------------------"+uname);
	String gname = request.getParameter("gname");
	System.out.println("GROUP NAME:--------------------"+gname);
	con = databasecon.getconnection();
	stmt = con.createStatement();


KeyPairGenerator kpg;
kpg = KeyPairGenerator.getInstance("EC","SunEC");
ECGenParameterSpec ecsp;
ecsp = new ECGenParameterSpec("secp192k1");//163 192
kpg.initialize(ecsp);
KeyPair kpU = kpg.genKeyPair();
PrivateKey privKeyU = kpU.getPrivate();
PublicKey pubKeyU = kpU.getPublic();
System.out.println("User U: " + privKeyU.toString());
System.out.println("User U: " + pubKeyU.toString());
	
		int i = stmt.executeUpdate("update userreg set groupname='"+gname+"', pubkey='"+pubKeyU+"', prikey='"+privKeyU+"' where username='"+uname+"' ");
	if(i>0){
	response.sendRedirect("addusers.jsp?msg1=suc");
	}else{
	response.sendRedirect("addusers.jsp?msg2=unsuc");
	}
	
%>