<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>ViewLogs</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_007_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_007_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>
<%@ page import="cmput391.*"%>
<%! private User loggedUser; %>

<%
loggedUser = (User) request.getSession().getAttribute(
				"loggedUser");
		if (loggedUser == null) {
			response.sendRedirect("Home.jsp");
		} else {
			String uClass = loggedUser.getUserClass();
			if (uClass.compareTo("a") != 0)
				response.sendRedirect("Home.jsp");
		}%>

<body id="page" onload="if(IE||V5) OnWeLoad()">
	<form method="post">
		<a href="adminUser.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[6],Img31,'cmput391_004.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[6],Img31,0,0)"> <img id="e31"
			name="e31" src="cmput391007011.jpg" title="" alt="cmput391007011.jpg"
			align="right" border="0"></a>
		<div id="e30" class="cc20">
			<a href="adminUser.jsp"> Home</a>
		</div>
		<a href="adminEditProfile.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[5],Img29,'cmput391_005.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[5],Img29,0,0)"> <img id="e29"
			name="e29" src="cmput391007009.jpg" title="" alt="cmput391007009.jpg"
			align="right" border="0"></a>
		<div id="e28" class="cc20">
			<a href="adminEditProfile.jsp"> Edit Profile</a>
		</div>
		<a href="Home.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[4],Img27,'index.html',1)"
			onmouseout="OnWeOver(0,0,0,IDP[4],Img27,0,0)"> <img id="e27"
			name="e27" src="cmput391007007.jpg" title="" alt="cmput391007007.jpg"
			align="right" border="0"></a>
		<div id="e26" class="cc20">
			<a href="Home.jsp"> Logout</a>
		</div>
		<a href="manageUsers.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[3],Img25,'cmput391_006.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[3],Img25,0,0)"> <img id="e25"
			name="e25" src="cmput391007005.jpg" title="" alt="cmput391007005.jpg"
			align="right" border="0"></a>
		<div id="e24" class="cc20">
			<a href="manageUsers.jsp"> Manage Users</a>
		</div>
		<a href="viewLogs.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[2],Img23,'cmput391_007.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[2],Img23,0,0)"> <img id="e23"
			name="e23" src="cmput391007003.jpg" title="" alt="cmput391007003.jpg"
			align="right" border="0"></a>
		<div id="e22" class="cc20">
			<a href="viewLogs.jsp"> View Logs</a>
		</div>
		<a href="adminSearch.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[1],Img21,'cmput391_008.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[1],Img21,0,0)"> <img id="e21"
			name="e21" src="cmput391007001.jpg" title="" alt="cmput391007001.jpg"
			align="right" border="0"></a>
		<div id="e20" class="cc20">
			<a href="adminSearch.jsp"> Search</a>
		</div>
		<div id="e19" class="cc21">User Logs:</div>
		<input id="e18" class="cc22" type="submit" name="gSubmit"
			value="Generate Report"> <input id="e17" class="cc23"
			type="text" name="pname" size="23"> <select id="e16"
			class="cc22" size="1" name="fromdate" title="Day">
			<option>01</option>
			<option>02</option>
			<option>03</option>
			<option>04</option>
			<option>05</option>
			<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
			<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
			<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
			<option>23</option>
			<option>24</option>
			<option>25</option>
			<option>26</option>
			<option>27</option>
			<option>28</option>
			<option>29</option>
			<option>30</option>
			<option>31</option>
		</select> <select id="e15" class="cc22" size="1" name="frommonth" title="Month">
			<option>Jan</option>
			<option>Feb</option>
			<option>Mar</option>
			<option>Apr</option>
			<option>May</option>
			<option>Jun</option>
			<option>Jul</option>
			<option>Aug</option>
			<option>Sept</option>
			<option>Oct</option>
			<option>Nov</option>
			<option>Dec</option>
		</select> <select id="e14" class="cc22" size="1" name="fromyear" title="Year">
			<option>03</option>
			<option>04</option>
			<option>05</option>
			<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
			<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
			<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
			<option>23</option>
		</select> <select id="e13" class="cc22" size="1" name="todate" title="Day">
			<option>01</option>
			<option>02</option>
			<option>03</option>
			<option>04</option>
			<option>05</option>
			<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
			<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
			<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
			<option>23</option>
			<option>24</option>
			<option>25</option>
			<option>26</option>
			<option>27</option>
			<option>28</option>
			<option>29</option>
			<option>30</option>
			<option>31</option>
		</select> <select id="e12" class="cc22" size="1" name="tomonth" title="Month">
			<option>Jan</option>
			<option>Feb</option>
			<option>Mar</option>
			<option>Apr</option>
			<option>May</option>
			<option>Jun</option>
			<option>Jul</option>
			<option>Aug</option>
			<option>Sept</option>
			<option>Oct</option>
			<option>Nov</option>
			<option>Dec</option>
		</select> <select id="e11" class="cc22" size="1" name="toyear" title="Year">
			<option>03</option>
			<option>04</option>
			<option>05</option>
			<option>06</option>
			<option>07</option>
			<option>08</option>
			<option>09</option>
			<option>10</option>
			<option>11</option>
			<option>12</option>
			<option>13</option>
			<option>14</option>
			<option>15</option>
			<option>16</option>
			<option>17</option>
			<option>18</option>
			<option>19</option>
			<option>20</option>
			<option>21</option>
			<option>22</option>
			<option>23</option>
		</select>
		<div id="e10" class="cc22">From:</div>
		<div id="e9" class="cc22">To:</div>
		<div id="e8" class="cc22">Patient Name:</div>
		<input id="e6" class="cc23" type="text" name="testtype" size="23">
		<div id="e5" class="cc22">Test Type:</div>
		<select id="e4" class="cc22" size="1" name="combo_box"
			onchange="alert('Combo_Box'+'['+this.selectedIndex+']')">
			<option>1. Weekly</option>
			<option>2. Monthly</option>
			<option>3. Yearly</option>
		</select>
		<div id="e1" class="cc22">&nbsp;View Mode:</div>
	</form>
</body>
</html>