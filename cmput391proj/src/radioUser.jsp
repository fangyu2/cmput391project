<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ page import="cmput391.*"%>
<%!private User loggedUser;%>

<%
request.getSession().removeAttribute("record");
	//checks whether the logged in user is a radiologist or not
	loggedUser = (User) request.getSession().getAttribute("loggedUser");
	if (loggedUser == null) {
		response.sendRedirect("Home.jsp");
	} else {
		String uClass = loggedUser.getUserClass();
		if (uClass.compareTo("r") != 0)
			response.sendRedirect("Home.jsp");
	}
%>
<head>
<title>RadioWelcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_009_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_009_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
	<a href="radioUser.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[5],Img11,'cmput391_009.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[5],Img11,0,0)"> <img id="e11"
		name="e11" src="cmput391009009.jpg" title="" alt="cmput391009009.jpg"
		align="right" border="0"></a>
	<div id="e10" class="cc26">
		<a href="radioUser.jsp"> Home</a>
	</div>
	<a href="radioEditProfile.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[4],Img9,'cmput391_012.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[4],Img9,0,0)"> <img id="e9"
		name="e9" src="cmput391009007.jpg" title="" alt="cmput391009007.jpg"
		align="right" border="0"></a>
	<div id="e8" class="cc26">
		<a href="radioEditProfile.jsp"> Edit Profile</a>
	</div>
	<a href="Home.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[3],Img7,'index.html',1)"
		onmouseout="OnWeOver(0,0,0,IDP[3],Img7,0,0)"> <img id="e7"
		name="e7" src="cmput391009005.jpg" title="" alt="cmput391009005.jpg"
		align="right" border="0"></a>
	<div id="e6" class="cc26">
		<a href="Home.jsp"> Logout</a>
	</div>
	<a href="addRecords.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[2],Img5,'cmput391_011.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[2],Img5,0,0)"> <img id="e5"
		name="e5" src="cmput391009003.jpg" title="" alt="cmput391009003.jpg"
		align="right" border="0"></a>
	<div id="e4" class="cc26">
		<a href="addRecords.jsp"> Add Records</a>
	</div>
	<a href="radioSearch.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[1],Img3,'cmput391_010.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[1],Img3,0,0)"> <img id="e3"
		name="e3" src="cmput391009001.jpg" title="" alt="cmput391009001.jpg"
		align="right" border="0"></a>
	<div id="e2" class="cc26">
		<a href="radioSearch.jsp"> Search</a>
	</div>
	<input id="e1" class="cc27" type="button" value="Help"
		onclick="location.href='help.jsp'">
</body>
</html>