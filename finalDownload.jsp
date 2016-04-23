<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*,java.io.*"%>

<%
    String fid=request.getParameter("fileid");


	// String eid=(String)session.getAttribute("eid");
	  //String fname=(String)session.getAttribute("fnm");
	
	 
	     try{
		 
		 Connection con=databasecon.getconnection();
		 PreparedStatement ps =con.prepareStatement("select plaintext ,fname from cloud where fid ='"+fid+"'");
		 ResultSet rs = ps.executeQuery();
		 while(rs.next())
		 {
		
	
			String filename =rs.getString(2);
System.out.println("slength="+filename);
String s[]=filename.split("\\.");
System.out.println("slength1="+s.length);

		
			byte[] ba = rs.getBytes(1);
		
			if(s[1].equalsIgnoreCase("GIF")|| s[1].equalsIgnoreCase("gif"))
			 {
			response.setContentType("image/gif");//application/notepadimage/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".gif\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}
			if(s[1].equalsIgnoreCase("jpg")|| s[1].equalsIgnoreCase("jpg"))
			 {
			response.setContentType("image/jpg");//application/notepadimage/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".jpg\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}

if(s[1].equalsIgnoreCase("png")|| s[1].equalsIgnoreCase("png"))
			 {
			response.setContentType("image/png");//application/notepadimage/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".png\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}
			if(s[1].equals("txt")|| s[1].equals("txt"))
			 {
			response.setContentType("application/notepad");//image/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".txt\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}

		 }
			}
			catch(Exception e)
			{
			out.println("Exception :"+e);
			}
		
		
		
%>