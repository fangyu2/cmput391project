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
	<a href="radioUser.jsp" onmouseover="OnWeOver(0,0,0,IDP[5],Img22,'cmput391_009.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[5],Img22,0,0)">
		<img id="e22" name="e22" src="cmput391010009.jpg" title="" alt="cmput391010009.jpg" align="right" border="0"></a>
	<div id="e21" class="cc25">
		<a href="radioUser.jsp">
		Home</a>
	</div>
	<a href="radioEditProfile.jsp" onmouseover="OnWeOver(0,0,0,IDP[4],Img20,'cmput391_012.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[4],Img20,0,0)">
		<img id="e20" name="e20" src="cmput391010007.jpg" title="" alt="cmput391010007.jpg" align="right" border="0"></a>
	<div id="e19" class="cc25">
		<a href="radioEditProfile.jsp">
		Edit Profile</a>
	</div>
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[3],Img18,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[3],Img18,0,0)">
		<img id="e18" name="e18" src="cmput391010005.jpg" title="" alt="cmput391010005.jpg" align="right" border="0"></a>
	<div id="e17" class="cc25">
		<a href="Home.jsp">
		Logout</a>
	</div>
	<a href="addRecords.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img16,'cmput391_011.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img16,0,0)">
		<img id="e16" name="e16" src="cmput391010003.jpg" title="" alt="cmput391010003.jpg" align="right" border="0"></a>
	<div id="e15" class="cc25">
		<a href="addRecords.jsp">
		Add Records</a>
	</div>
	<a href="radioSearch.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img14,'cmput391_010.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img14,0,0)">
		<img id="e14" name="e14" src="cmput391010001.jpg" title="" alt="cmput391010001.jpg" align="right" border="0"></a>
	<div id="e13" class="cc25">
		<a href="radioSearch.jsp">
		Search</a>
	</div>
	<input id="e12" class="cc26" type="text" name="text_box" size="24">
	<input id="e11" class="cc27" type="button" value="Search" onclick="alert('Button')">
	<div id="e10" class="cc28">
		Enter Search Term(s):
	</div>
	<div id="e9" class="cc29">
		From:
	</div>
	<select id="e8" class="cc27" size="1" name="Date_Day" title="Day">
	<option> 01</option>
	<option> 02</option>
	<option> 03</option>
	<option> 04</option>
	<option> 05</option>
	<option> 06</option>
	<option> 07</option>
	<option> 08</option>
	<option> 09</option>
	<option> 10</option>
	<option> 11</option>
	<option> 12</option>
	<option> 13</option>
	<option> 14</option>
	<option> 15</option>
	<option> 16</option>
	<option> 17</option>
	<option> 18</option>
	<option> 19</option>
	<option> 20</option>
	<option> 21</option>
	<option> 22</option>
	<option> 23</option>
	<option> 24</option>
	<option> 25</option>
	<option> 26</option>
	<option> 27</option>
	<option> 28</option>
	<option> 29</option>
	<option> 30</option>
	<option> 31</option>
	</select>
	<select id="e7" class="cc27" size="1" name="Date_Month" title="Month">
	<option> Jan</option>
	<option> Feb</option>
	<option> Mar</option>
	<option> Apr</option>
	<option> May</option>
	<option> Jun</option>
	<option> Jul</option>
	<option> Aug</option>
	<option> Sept</option>
	<option> Oct</option>
	<option> Nov</option>
	<option> Dec</option>
	</select>
	<select id="e6" class="cc27" size="1" name="Date_Year" title="Year">
	<option> 03</option>
	<option> 04</option>
	<option> 05</option>
	<option> 06</option>
	<option> 07</option>
	<option> 08</option>
	<option> 09</option>
	<option> 10</option>
	</select>
	<div id="e5" class="cc29">
		To:
	</div>
	<select id="e4" class="cc27" size="1" name="Date_Day" title="Day">
	<option> 01</option>
	<option> 02</option>
	<option> 03</option>
	<option> 04</option>
	<option> 05</option>
	<option> 06</option>
	<option> 07</option>
	<option> 08</option>
	<option> 09</option>
	<option> 10</option>
	<option> 11</option>
	<option> 12</option>
	<option> 13</option>
	<option> 14</option>
	<option> 15</option>
	<option> 16</option>
	<option> 17</option>
	<option> 18</option>
	<option> 19</option>
	<option> 20</option>
	<option> 21</option>
	<option> 22</option>
	<option> 23</option>
	<option> 24</option>
	<option> 25</option>
	<option> 26</option>
	<option> 27</option>
	<option> 28</option>
	<option> 29</option>
	<option> 30</option>
	<option> 31</option>
	</select>
	<select id="e3" class="cc27" size="1" name="Date_Month" title="Month">
	<option> Jan</option>
	<option> Feb</option>
	<option> Mar</option>
	<option> Apr</option>
	<option> May</option>
	<option> Jun</option>
	<option> Jul</option>
	<option> Aug</option>
	<option> Sept</option>
	<option> Oct</option>
	<option> Nov</option>
	<option> Dec</option>
	</select>
	<select id="e2" class="cc27" size="1" name="Date_Year" title="Year">
	<option> 03</option>
	<option> 04</option>
	<option> 05</option>
	<option> 06</option>
	<option> 07</option>
	<option> 08</option>
	<option> 09</option>
	<option> 10</option>
	</select>
	<select id="e1" class="cc27" size="1" name="combo_box" onchange="alert('Combo_Box'+'['+this.selectedIndex+']')">
	<option> 1. Acending</option>
	<option> 2. Descending</option>
	</select>
</form>
</body>
</html>