<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title> Login </title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta http-equiv="Content-Style-Type" content="text/css;">
	<link rel="stylesheet" href="cmput391_g.css" type="text/css" media="screen,projection,print">	<!--// Document Style //-->
	<link rel="stylesheet" href="cmput391_002_p.css" type="text/css" media="screen,projection,print">	<!--// Page Style //-->
	<script src="cmput391_g.js" type="text/javascript"></script>		<!--// Document Script //-->
	<script src="cmput391_002_a.js" type="text/javascript"></script>		<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
<form method="post">
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img10,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img10,0,0)">
		<img id="e10" name="e10" src="cmput391002003.jpg" title="" alt="cmput391002003.jpg" align="right" border="0"></a>
	<div id="e9" class="cc02">
		<a href="Home.jsp">
		Home</a>
	</div>
	<a href="Login.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img8,'cmput391_002.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img8,0,0)">
		<img id="e8" name="e8" src="cmput391002001.jpg" title="" alt="cmput391002001.jpg" align="right" border="0"></a>
	<div id="e7" class="cc02">
		<a href="Login.jsp">
		Login</a>
	</div>
	<input id="e6" class="cc03" type="text" name="text_box" size="23">
	<input id="e5" class="cc03" type="password" name="password" size="23">
	<input id="e4" class="cc04" type="button" value="Login" onclick="alert('Button')">
	<div id="e3" class="cc04">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName:
	</div>
	<div id="e2" class="cc04">
		&nbsp;&nbsp;Password:
	</div>
	<div id="e1" class="cc05">
		User Login:
	</div>
</form>
</body>
</html>