<%@page import="databaseconnection.*,java.sql.*,java.io.*, java.security.*,java.security.spec.*"%><%!
Connection con;
Statement stmt,stmt1,st;
ResultSet rs,rs1;
byte[] gpubkey;
byte[] buffer;
byte[] sigdata;
%>
<% con = databasecon.getconnection();
st = con.createStatement();
String fileid = request.getParameter("fileid");
String filename = request.getParameter("fname");
String grpubkey= request.getParameter("gpubkey");
String groupname = request.getParameter("groupname");

%>
<%
try{
con = databasecon.getconnection();
stmt = con.createStatement();
String grpubkey1=null;
String sql="select pubkey from addinggroups where groupname='"+groupname +"' ";
System.out.println("sql ="+sql);
ResultSet rss = st.executeQuery("select pubkey from addinggroups where groupname='"+groupname +"'  ");
if(rss.next()){
grpubkey1=rss.getString(1);
}
System.out.println("grpubkey1 ="+grpubkey1.hashCode());
//System.out.println("grpubkey ="+grpubkey.hashCode());

rs = stmt.executeQuery("select pk from addinggroups where groupname='"+groupname+"' ");
if(rs.next()){
gpubkey = rs.getBytes(1);
}
stmt1 = con.createStatement();
rs1 = stmt.executeQuery("select * from cloud where fid='"+fileid+"' and fname='"+filename+"' and groupname='"+groupname+"' ");
if(rs1.next()){
	buffer = rs1.getBytes("plaintext");
	
	sigdata = rs1.getBytes("signature");
	
}
int len = new String(buffer).length(); 
 X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(gpubkey);
 
            KeyFactory keyFactory1 = KeyFactory.getInstance("EC","SunEC");
            PublicKey pubKey1 = keyFactory1.generatePublic(pubKeySpec);
		 
Signature    sig1 = Signature.getInstance("SHA1withECDSA","SunEC");
            sig1.initVerify(pubKey1);
			 sig1.update(buffer, 0, len);
			 System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSSSSS"+sigdata);
			 boolean verifies = sig1.verify(sigdata);
			 System.out.println("signature verifies=: " + verifies);
			 if(verifies){
				 	 System.out.println("truee");
			 //out.println("<script>alert('  Signature is Valid, You can Download...!')</script>"
			 Statement s=con.createStatement();
			 s.executeUpdate("update  tpa set status='Real Data' where fid='"+fileid+"'");
	 response.sendRedirect("auditchallenge.jsp?msg=Result");
	 } else{
		 Statement s1=con.createStatement();
s1.executeUpdate("update  tpa set status='Modified Data' where fid='"+fileid+"'");
			 response.sendRedirect("auditchallenge.jsp?msg=Result");
			 }
}catch(Exception e){
e.printStackTrace();
 Statement s1=con.createStatement();
			 s1.executeUpdate("update  tpa set status='Modified Data' where fid='"+fileid+"'");
			 response.sendRedirect("auditchallenge.jsp?msg=Result");

}
%>
