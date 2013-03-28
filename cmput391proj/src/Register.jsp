<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<title> Register </title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta http-equiv="Content-Style-Type" content="text/css;">
	<link rel="stylesheet" href="cmput391_g.css" type="text/css" media="screen,projection,print">	<!--// Document Style //-->
	<link rel="stylesheet" href="cmput391_015_p.css" type="text/css" media="screen,projection,print">	<!--// Page Style //-->
	<script src="cmput391_g.js" type="text/javascript"></script>		<!--// Document Script //-->
	<script src="cmput391_015_a.js" type="text/javascript"></script>		<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
<form method="post">
	<input id="e22" class="cc41" type="text" name="text_box" value="userName" size="23">
	<input id="e21" class="cc41" type="password" name="password" size="23">
	<input id="e20" class="cc42" type="button" value="Register" onclick="alert('Button')">
	<div id="e19" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName:
	</div>
	<div id="e18" class="cc42">
		&nbsp;&nbsp;Password:
	</div>
	<div id="e17" class="cc43">
		Register:
	</div>
	<input id="e16" class="cc41" type="password" name="password" size="23">
	<div id="e15" class="cc42">
		Retype Password:
	</div>
	<div id="e14" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Class:
	</div>
	<input id="e13" class="cc41" type="text" name="text_box" value="email" size="23">
	<div id="e12" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:
	</div>
	<select id="e11" class="cc44" size="1" name="combo_box" onchange="alert('Combo_Box'+'['+this.selectedIndex+']')">
	<option> 1. Patient</option>
	<option> 2. Doctor</option>
	<option> 3. Radiologist</option>
	<option> 4. Admin</option>
	</select>
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img10,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img10,0,0)">
		<img id="e10" name="e10" src="cmput391015003.jpg" title="" alt="cmput391015003.jpg" align="right" border="0"></a>
	<div id="e9" class="cc45">
		<a href="Home.jsp">
		Home</a>
	</div>
	<a href="Login.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img8,'cmput391_002.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img8,0,0)">
		<img id="e8" name="e8" src="cmput391015001.jpg" title="" alt="cmput391015001.jpg" align="right" border="0"></a>
	<div id="e7" class="cc45">
		<a href="Login.jsp">
		Login</a>
	</div>
	<input id="e6" class="cc41" type="text" name="text_box" value="FirstName" size="23">
	<div id="e5" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Name:
	</div>
	<input id="e4" class="cc41" type="text" name="text_box" value="lastName" size="23">
	<div id="e3" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name:
	</div>
	<input id="e2" class="cc41" type="text" name="text_box" value="phone" size="23">
	<div id="e1" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone:
	</div>
</form>
</body>
</html>