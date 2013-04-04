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
<% UserConnection.getConnection().closeConn();
request.getSession().removeAttribute("loggedUser"); %>

<body id="page" onload="if(IE||V5) OnWeLoad()">
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img4,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img4,0,0)">
		<img id="e4" name="e4" src="cmput391001003.jpg" title="" alt="cmput391001003.jpg" align="right" border="0"></a>
	<div id="e3" class="cc01">
		<a href="Home.jsp">
		Home</a>
	</div>
	<a href="Login.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img2,'cmput391_002.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img2,0,0)">
		<img id="e2" name="e2" src="cmput391001001.jpg" title="" alt="cmput391001001.jpg" align="right" border="0"></a>
	<div id="e1" class="cc01">
		<a href="Login.jsp">
		Login</a>
	</div>
</body>
</html>