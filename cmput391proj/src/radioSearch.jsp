<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title> RadioSearch </title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta http-equiv="Content-Style-Type" content="text/css;">
	<link rel="stylesheet" href="cmput391_g.css" type="text/css" media="screen,projection,print">	<!--// Document Style //-->
	<link rel="stylesheet" href="cmput391_010_p.css" type="text/css" media="screen,projection,print">	<!--// Page Style //-->
	<script src="cmput391_g.js" type="text/javascript"></script>		<!--// Document Script //-->
	<script src="cmput391_010_a.js" type="text/javascript"></script>		<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
<form method="post">
	<a href="radioUser.jsp" onmouseover="OnWeOver(0,0,0,IDP[5],Img14,'cmput391_009.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[5],Img14,0,0)">
		<img id="e14" name="e14" src="cmput391010009.jpg" title="" alt="cmput391010009.jpg" align="right" border="0"></a>
	<div id="e13" class="cc22">
		<a href="radioUser.jsp">
		Home</a>
	</div>
	<a href="radioEditProfile.jsp" onmouseover="OnWeOver(0,0,0,IDP[4],Img12,'cmput391_012.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[4],Img12,0,0)">
		<img id="e12" name="e12" src="cmput391010007.jpg" title="" alt="cmput391010007.jpg" align="right" border="0"></a>
	<div id="e11" class="cc22">
		<a href="radioEditProfile.jsp">
		Edit Profile</a>
	</div>
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[3],Img10,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[3],Img10,0,0)">
		<img id="e10" name="e10" src="cmput391010005.jpg" title="" alt="cmput391010005.jpg" align="right" border="0"></a>
	<div id="e9" class="cc22">
		<a href="Home.jsp">
		Logout</a>
	</div>
	<a href="addRecords.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img8,'cmput391_011.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img8,0,0)">
		<img id="e8" name="e8" src="cmput391010003.jpg" title="" alt="cmput391010003.jpg" align="right" border="0"></a>
	<div id="e7" class="cc22">
		<a href="addRecords.jsp">
		Add Records</a>
	</div>
	<a href="radioSearch.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img6,'cmput391_010.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img6,0,0)">
		<img id="e6" name="e6" src="cmput391010001.jpg" title="" alt="cmput391010001.jpg" align="right" border="0"></a>
	<div id="e5" class="cc22">
		<a href="radioSearch.jsp">
		Search</a>
	</div>
	<input id="e4" class="cc23" type="text" name="text_box" size="23">
	<input id="e3" class="cc24" type="button" value="Search" onclick="alert('Button')">
	<div id="e2" class="cc25">
		Enter Patient Name:
	</div>
	<select id="e1" class="cc24" name="select_list" size="17" onchange="alert('List_Field'+'['+this.selectedIndex+']')">
	<option> 1. List Field</option>
	<option> 2. List Field</option>
	<option> 3. List Field</option>
	</select>
</form>
</body>
</html>