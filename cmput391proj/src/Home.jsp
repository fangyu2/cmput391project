<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="cmput391.*" %>
<html lang="en">
<head>
	<title> Home </title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta http-equiv="Content-Style-Type" content="text/css;">
	<link rel="stylesheet" href="cmput391_g.css" type="text/css" media="screen,projection,print">	<!--// Document Style //-->
	<link rel="stylesheet" href="index_p.css" type="text/css" media="screen,projection,print">	<!--// Page Style //-->
	<script src="cmput391_g.js" type="text/javascript"></script>		<!--// Document Script //-->
	<script src="index_a.js" type="text/javascript"></script>		<!--// Motion Script //-->
</head>
<%
request.getSession().removeAttribute("record");
request.getSession().removeAttribute("loggedUser"); %>

<body id="page" onload="if(IE||V5) OnWeLoad()">
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img7,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img7,0,0)">
		<img id="e7" name="e7" src="cmput391001003.jpg" title="" alt="cmput391001003.jpg" align="right" border="0"></a>
	<div id="e6" class="cc01">
		<a href="Home.jsp">
		Home</a>
	</div>
	<a href="Login.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img5,'cmput391_002.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img5,0,0)">
		<img id="e5" name="e5" src="cmput391001001.jpg" title="" alt="cmput391001001.jpg" align="right" border="0"></a>
	<div id="e4" class="cc01">
		<a href="Login.jsp">
		Login</a>
	</div>
	<div id="e3" class="cc02">
		WELCOME TO CMPUT391 Group 6's Project
	</div>
	<div id="e2" class="cc03">
		To login simple click on the login tab to the right and enter your username and password
	</div>
	<div id="e1" class="cc03">
		To logout simple click on the logout tab anytime during your session.
	</div>
</body>
</html>