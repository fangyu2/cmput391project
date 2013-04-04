<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>AddRecords</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_011_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_011_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>
<%@ page
	import="cmput391.*,java.sql.*,org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page
	import="org.apache.commons.fileupload.FileItem,java.io.*,javax.servlet.*,java.util.*,oracle.sql.*"%>
<%@ page
	import="oracle.jdbc.*,java.awt.Image,java.awt.image.BufferedImage,javax.imageio.ImageIO"%>

<%!private User loggedUser;
	private Record record;%>

<%!public void addRecord(HttpServletRequest request,
			HttpServletResponse response, JspWriter out) {

		int ID = 0;
		try {
			String recordID = (request.getParameter("recordID")).trim();
			ID = Integer.parseInt(recordID);
		} catch (NumberFormatException ex) {
			try {
				out.println("<br /> <br />");
				out.println("<center><p><b> ID entered is not a number!! </b></p></center");
			} catch (Exception exp) {
			}
			return;
		}

		try {
			String patientName = (request.getParameter("patient")).trim();
			String doctorName = (request.getParameter("docName")).trim();
			String radiologist = (request.getParameter("radname")).trim();
			String testType = (request.getParameter("testtype")).trim();
			String diagnosis = (request.getParameter("diagnosis")).trim();
			String description = (request.getParameter("description")).trim();
			String pres_date;
			String test_date;
			String tempday;
			String tempyr;
			String tempmon;
			String dash = "-";
			tempday = (request.getParameter("pdd")).trim();
			tempyr = (request.getParameter("pdy")).trim();
			tempmon = (request.getParameter("pdm")).trim();

			pres_date = tempday.concat(dash).concat(tempmon).concat(dash)
					.concat(tempyr);

			tempday = (request.getParameter("tdd")).trim();
			tempyr = (request.getParameter("tdy")).trim();
			tempmon = (request.getParameter("tdm")).trim();

			test_date = tempday.concat(dash).concat(tempmon).concat(dash)
					.concat(tempyr);
			String sql = "INSERT INTO radiology_record VALUES(" + ID + ", '"
					+ patientName + "', '" + doctorName + "', '" + radiologist
					+ "', '" + testType + "', '" + pres_date + "', '"
					+ test_date + "', '" + diagnosis + "', '" + description
					+ "')";
			Statement stmt = null;
			ResultSet rset = null;

			stmt = UserConnection.getConnection().getConn().createStatement();
			stmt.executeQuery(sql);
			stmt.close();
			UserConnection.getConnection().getConn().commit();
			record = new Record(ID);
			String checked = request.getParameter("addPic");			
			if(checked != null){
				request.getSession().setAttribute("record", record);
				response.sendRedirect("upload.jsp");
			}
			//addImg(ID, request, response, out);
		} catch (Exception ex) {
			try {
				out.println("<br /> <br />");
				out.println("<center><p><b> Record ID already exist!!! </b></p></center");
			} catch (Exception exp) {
			}
		}

	}

	%>

<%
	request.getSession().removeAttribute("record");
	loggedUser = (User) request.getSession().getAttribute("loggedUser");
	if (loggedUser == null) {
		response.sendRedirect("Home.jsp");
	} else {
		String uClass = loggedUser.getUserClass();
		if (uClass.compareTo("r") != 0)
			response.sendRedirect("Home.jsp");
	}
	if (request.getParameter("rSubmit") != null) {
		addRecord(request, response, out);
	}
%>


<body id="page" onload="if(IE||V5) OnWeLoad()">
	<form method="post">
		<a href="radioUser.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[5],Img35,'cmput391_009.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[5],Img35,0,0)"> <img id="e35"
			name="e35" src="cmput391011009.jpg" title="" alt="cmput391011009.jpg"
			align="right" border="0"></a>
		<div id="e34" class="cc26">
			<a href="radioUser.jsp"> Home</a>
		</div>
		<a href="radioEditProfile.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[4],Img33,'cmput391_012.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[4],Img33,0,0)"> <img id="e33"
			name="e33" src="cmput391011007.jpg" title="" alt="cmput391011007.jpg"
			align="right" border="0"></a>
		<div id="e32" class="cc26">
			<a href="radioEditProfile.jsp"> Edit Profile</a>
		</div>
		<a href="Home.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[3],Img31,'index.html',1)"
			onmouseout="OnWeOver(0,0,0,IDP[3],Img31,0,0)"> <img id="e31"
			name="e31" src="cmput391011005.jpg" title="" alt="cmput391011005.jpg"
			align="right" border="0"></a>
		<div id="e30" class="cc26">
			<a href="Home.jsp"> Logout</a>
		</div>
		<a href="addRecords.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[2],Img29,'cmput391_011.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[2],Img29,0,0)"> <img id="e29"
			name="e29" src="cmput391011003.jpg" title="" alt="cmput391011003.jpg"
			align="right" border="0"></a>
		<div id="e28" class="cc26">
			<a href="addRecords.jsp"> Add Records</a>
		</div>
		<a href="radioSearch.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[1],Img27,'cmput391_010.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[1],Img27,0,0)"> <img id="e27"
			name="e27" src="cmput391011001.jpg" title="" alt="cmput391011001.jpg"
			align="right" border="0"></a>
		<div id="e26" class="cc26">
			<a href="radioSearch.jsp"> Search</a>
		</div>
		<input id="e25" class="cc27" type="text" name="recordID" value=""
			size="23"> <input id="e24" class="cc27" type="text"
			name="patient" value="" size="23"> <input id="e23"
			class="cc27" type="text" name="docName" value="" size="23"> <input
			id="e22" class="cc27" type="text" name="radname" value="" size="23">
		<input id="e21" class="cc27" type="text" name="testtype" value=""
			size="23"> <input id="e20" class="cc27" type="text"
			name="diagnosis" value="" size="23"> <input id="e19"
			class="cc27" type="text" name="description" size="23"> <select
			id="e18" class="cc28" size="1" name="pdd" title="Day">
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
		</select> <select id="e17" class="cc28" size="1" name="pdm" title="Month">
			<option>JAN</option>
			<option>FEB</option>
			<option>MAR</option>
			<option>APR</option>
			<option>MAY</option>
			<option>JUN</option>
			<option>JUL</option>
			<option>AUG</option>
			<option>SEP</option>
			<option>OCT</option>
			<option>NOV</option>
			<option>DEC</option>
		</select> <select id="e16" class="cc28" size="1" name="pdy" title="Year">
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
		</select> <select id="e15" class="cc28" size="1" name="tdd" title="Day">
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
		</select> <select id="e14" class="cc28" size="1" name="tdm" title="Month">
			<option>JAN</option>
			<option>FEB</option>
			<option>MAR</option>
			<option>APR</option>
			<option>MAY</option>
			<option>JUN</option>
			<option>JUL</option>
			<option>AUG</option>
			<option>SEP</option>
			<option>OCT</option>
			<option>NOV</option>
			<option>DEC</option>
		</select> <select id="e13" class="cc28" size="1" name="tdy" title="Year">
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
		</select> <input id="e12" class="cc28" type="submit" value="Submit"
			name="rSubmit">
		<div id="e11" class="cc28">Record ID:</div>
		<div id="e10" class="cc28">Patient Name:</div>
		<div id="e9" class="cc28">Doctor:</div>
		<div id="e8" class="cc28">Radiologist:</div>
		<div id="e7" class="cc28">Test Type:</div>
		<div id="e6" class="cc28">Prescribing Date:</div>
		<div id="e5" class="cc28">Test Date:</div>
		<div id="e4" class="cc28">Diagnosis:</div>
		<div id="e3" class="cc28">Description:</div>
		<input id="e2" class="cc28" type="checkbox" name="addPic">
		<div id="e1" class="cc29">Attach Photo</div>
	</form>
</body>
</html>
