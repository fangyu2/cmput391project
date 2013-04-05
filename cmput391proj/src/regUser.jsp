<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ page import="java.sql.*,cmput391.*"%>
<%!private User loggedUser;%>

<%
	//checks whether the user logged in is a radiologist
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
		onmouseover="OnWeOver(0,0,0,IDP[4],Img9,'cmput391_003.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[4],Img9,0,0)"> <img id="e9"
		name="e9" src="cmput391003007.jpg" title="" alt="cmput391003007.jpg"
		align="right" border="0"></a>
	<div id="e8" class="cc06">
		<a href="regUser.jsp"> Home</a>
	</div>
	<a href="regEditProfile.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[3],Img7,'cmput391_013.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[3],Img7,0,0)"> <img id="e7"
		name="e7" src="cmput391003005.jpg" title="" alt="cmput391003005.jpg"
		align="right" border="0"></a>
	<div id="e6" class="cc06">
		<a href="regEditProfile.jsp"> Edit Profile</a>
	</div>
	<a href="Home.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[2],Img5,'index.html',1)"
		onmouseout="OnWeOver(0,0,0,IDP[2],Img5,0,0)"> <img id="e5"
		name="e5" src="cmput391003003.jpg" title="" alt="cmput391003003.jpg"
		align="right" border="0"></a>
	<div id="e4" class="cc06">
		<a href="Home.jsp"> Logout</a>
	</div>
	<a href="regSearch.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[1],Img3,'cmput391_014.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[1],Img3,0,0)"> <img id="e3"
		name="e3" src="cmput391003001.jpg" title="" alt="cmput391003001.jpg"
		align="right" border="0"></a>
	<div id="e2" class="cc06">
		<a href="regSearch.jsp"> Search</a>
	</div>
	<input id="e1" class="cc07" type="button" value="Help"
		onclick="location.href='help.jsp'">
</body>
</html>