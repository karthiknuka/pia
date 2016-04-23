<%@page import="databaseconnection.*,java.sql.*,DSA.*,java.io.*, java.security.*,java.security.spec.*"%>
<%!
Connection con;
Statement stmt,stmt1,stmt2;
ResultSet rs,rs1,rs2;
String fileid,uploadfile,email;
int count;
%>
<%
String fileid = request.getParameter("fid");
String gnm= request.getParameter("groupname");

 byte[] buffer =null;
 int len=0;
 try{
con = databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();
byte[] priv=null;
byte[] pub=null;
ResultSet r1=st1.executeQuery("select  plaintext from cloud where fid='"+fileid+"' ");
if(r1.next()){
buffer=r1.getBytes(1);
}
ResultSet r=st.executeQuery("select  sk,pk from addinggroups where groupname='"+gnm+"'");
if(r.next()){
 priv=r.getBytes(1);
 pub=r.getBytes(2);
}
  
            KeyFactory keyFactory = KeyFactory.getInstance("EC","SunEC");
          EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(priv);
    PrivateKey gsk = keyFactory.generatePrivate(privateKeySpec);
  /* Create a Signature object and initialize it with the private key */
 len=new String(buffer).length();
    Signature dsa;
dsa = Signature.getInstance("SHA1withECDSA","SunEC");
            dsa.initSign(gsk);
			dsa.update(buffer, 0, len);
			  /* Now that all the data to be signed has been read in, 
                    generate a signature for it */
 
            byte[] realSig = dsa.sign();
			/* Save the public key in a file */
     //byte[] key = gpukey.getBytes() ;

X509EncodedKeySpec pubKeySpec = new X509EncodedKeySpec(pub);
 
            KeyFactory keyFactory1 = KeyFactory.getInstance("EC","SunEC");
            PublicKey pubKey1 = keyFactory1.generatePublic(pubKeySpec);
		 
Signature    sig1 = Signature.getInstance("SHA1withECDSA","SunEC");
            sig1.initVerify(pubKey1);
			 sig1.update(buffer, 0, len);
			 boolean verifies = sig1.verify(realSig);
 
            System.out.println("signature verifies: " + verifies);

PreparedStatement p=con.prepareStatement("update cloud set signature=? where fid='"+fileid+"' ");
p.setBytes(1,realSig);
int i=p.executeUpdate();
if(i>0){
response.sendRedirect("fupdate.jsp?msges=Re-Signature");
}
 }catch(Exception e){
 
 e.printStackTrace();}

%>
