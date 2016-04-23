<%@page import="databaseconnection.*,java.sql.*,ECC.*,java.security.*,java.security.spec.*"%>
<%!
Connection con;
Statement stmt,stmt1;
ResultSet rs;
%>
<%
String groupname = request.getParameter("addgroups");

ECCSignature key1 = new ECCSignature();
key1.keyGeneration();
String PK = key1.getPubkey();

String SK = key1.getPrikey();
byte pk1[]=key1.getPk();
byte sk1[]=key1.getSk();
		System.out.println(PK);
		System.out.println(SK);
con = databasecon.getconnection();
stmt = con.createStatement();
rs = stmt.executeQuery("select groupname from addinggroups where groupname='"+groupname+"'");
if(rs.next()){
response.sendRedirect("addgroups.jsp?msg1=existed");
}else{
stmt1 = con.createStatement();
PreparedStatement p=con.prepareStatement("insert into addinggroups values(?,?,?,?,?)");
p.setString(1,groupname);
p.setString(2, PK);
p.setString(3, SK);
p.setBytes(4, pk1);
p.setBytes(5, sk1);
int i = p.executeUpdate();
if(i>0){
	response.sendRedirect("addgroups.jsp?msg2=suc");
}else{
response.sendRedirect("addgroups.jsp?msg3=unsuc");
}
}
%>
