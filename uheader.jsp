<%@page import="databaseconnection.*,java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Public Integrity Auditing for Shared Dynamic Cloud Data with Group User Revocation</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link rel="shortcut icon" type="image/x-icon" href="images/hi.ico" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="PIA" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery-1.11.1.min.js"></script>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
 <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
<!---End-smoth-scrolling---->
 
</head>
<body>
<!----header-banner--->
		<div class="header head-top">
			<div class="container">
				<div class="header-top">
					<div class="logo">
						<a href="index.html">Public Integrity Auditing<br> <span>for Shared Dynamic Cloud Data with </span>Group User Revocation</a>
					</div>
						<div class="social-icons">
	<					</div>	
							<div class="clearfix"></div>
				</div>
				<div class="top-menu">
					<span class="menu"><img src="images/menu.png" alt=""/>  </span>
						<ul>
							<li><a href="userhome.jsp">home</a></li>
								<li><a href="fileaccess.jsp">FileAccess</a></li>
									<li><a href="ufileupload.jsp">File Upload</a></li>
										<li><a href="filedownload.jsp">File Download</a></li>
										<li><a href="users.jsp">Logout</a></li>
												<%
												String uname = session.getAttribute("uname").toString();
												%>
										<br><br><br><br><br><br><font color="yellow" size="3">Welcome <%=uname%></font>
												 <!-- script for menu -->
							<script>
							 $("span.menu").click(function(){
							 $(".top-menu ul").slideToggle("slow" , function(){
							 });
							 });
							 </script>
							<!-- //script for menu -->

												<div class="clearfix"></div>
					</ul>
				</div>
				
			</div>
		</div>