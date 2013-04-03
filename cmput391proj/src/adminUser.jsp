<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>AdminWelcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_004_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_004_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>

<%@ page import="java.sql.*,cmput391.*,java.util.UUID"%>

<%!private User loggedUser;%>

<%
	try {
		loggedUser = (User) request.getSession().getAttribute(
				"loggedUser");
		if (loggedUser == null) {
			response.sendRedirect("Home.jsp");
		} else {
			String uClass = loggedUser.getUserClass();
			if (uClass.compareTo("a") != 0)
				response.sendRedirect("Home.jsp");
		}
	} catch (Exception ex) {
		System.out.println("" + ex.getMessage() + "");
	}
%>
<body id="page" onload="if(IE||V5) OnWeLoad()">
	<a href="adminUser.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[6],Img12,'cmput391_004.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[6],Img12,0,0)"> <img id="e12"
		name="e12" src="cmput391004011.jpg" title="" alt="cmput391004011.jpg"
		align="right" border="0"></a>
	<div id="e11" class="cc07">
		<a href="adminUser.jsp"> Home</a>
	</div>
	<a href="adminEditProfile.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[5],Img10,'cmput391_005.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[5],Img10,0,0)"> <img id="e10"
		name="e10" src="cmput391004009.jpg" title="" alt="cmput391004009.jpg"
		align="right" border="0"></a>
	<div id="e9" class="cc07">
		<a href="adminEditProfile.jsp"> Edit Profile</a>
	</div>
	<a href="Home.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[4],Img8,'index.html',1)"
		onmouseout="OnWeOver(0,0,0,IDP[4],Img8,0,0)"> <img id="e8"
		name="e8" src="cmput391004007.jpg" title="" alt="cmput391004007.jpg"
		align="right" border="0"></a>
	<div id="e7" class="cc07">
		<a href="Home.jsp"> Logout</a>
	</div>
	<a href="manageUsers.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[3],Img6,'cmput391_006.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[3],Img6,0,0)"> <img id="e6"
		name="e6" src="cmput391004005.jpg" title="" alt="cmput391004005.jpg"
		align="right" border="0"></a>
	<div id="e5" class="cc07">
		<a href="manageUsers.jsp"> Manage Users</a>
	</div>
	<a href="viewLogs.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[2],Img4,'cmput391_007.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[2],Img4,0,0)"> <img id="e4"
		name="e4" src="cmput391004003.jpg" title="" alt="cmput391004003.jpg"
		align="right" border="0"></a>
	<div id="e3" class="cc07">
		<a href="viewLogs.jsp"> View Logs</a>
	</div>
	<a href="adminSearch.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[1],Img2,'cmput391_008.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[1],Img2,0,0)"> <img id="e2"
		name="e2" src="cmput391004001.jpg" title="" alt="cmput391004001.jpg"
		align="right" border="0"></a>
	<div id="e1" class="cc07">
		<a href="adminSearch.jsp"> Search</a>
	</div>
</body>
</html>