<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ page import="java.sql.*,cmput391.*"%>
<%!private User loggedUser;%>

<%
	loggedUser = (User) request.getSession().getAttribute("loggedUser");
	if (loggedUser == null) {
		response.sendRedirect("Home.jsp");
	} else {
		String uClass = loggedUser.getUserClass();
		if (uClass.compareTo("a") == 0 || uClass.compareTo("r") == 0)
			response.sendRedirect("Home.jsp");
	}
%>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_003_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_003_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
	<a href="regUser.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[4],Img8,'cmput391_003.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[4],Img8,0,0)"> <img id="e8"
		name="e8" src="cmput391003007.jpg" title="" alt="cmput391003007.jpg"
		align="right" border="0"></a>
	<div id="e7" class="cc06">
		<a href="regUser.jsp"> Home</a>
	</div>
	<a href="regEditProfile.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[3],Img6,'cmput391_013.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[3],Img6,0,0)"> <img id="e6"
		name="e6" src="cmput391003005.jpg" title="" alt="cmput391003005.jpg"
		align="right" border="0"></a>
	<div id="e5" class="cc06">
		<a href="regEditProfile.jsp"> Edit Profile</a>
	</div>
	<a href="Home.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[2],Img4,'index.html',1)"
		onmouseout="OnWeOver(0,0,0,IDP[2],Img4,0,0)"> <img id="e4"
		name="e4" src="cmput391003003.jpg" title="" alt="cmput391003003.jpg"
		align="right" border="0"></a>
	<div id="e3" class="cc06">
		<a href="Home.jsp"> Logout</a>
	</div>
	<a href="regSearch.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[1],Img2,'cmput391_014.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[1],Img2,0,0)"> <img id="e2"
		name="e2" src="cmput391003001.jpg" title="" alt="cmput391003001.jpg"
		align="right" border="0"></a>
	<div id="e1" class="cc06">
		<a href="regSearch.jsp"> Search</a>
	</div>
</body>
</html>