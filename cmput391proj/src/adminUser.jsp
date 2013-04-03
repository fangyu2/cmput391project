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

<%@ page import="java.sql.*,cmput391.*,java.util.*"%>

<%!private User loggedUser;%>

<%!public void generateReport(HttpServletRequest request, JspWriter out) {

		try {
			List<String> names = new ArrayList<String>();
			String diagnosis = (request.getParameter("diagnosis")).trim();
			String fromdate = (request.getParameter("fromdate")).trim();
			String frommonth = (request.getParameter("frommonth")).trim();
			String fromyear = (request.getParameter("fromyear")).trim();
			String todate = (request.getParameter("todate")).trim();
			String tomonth = (request.getParameter("tomonth")).trim();
			String toyear = (request.getParameter("todate")).trim();
			String dash = "-";

			if (diagnosis == null) {
				out.println("<center><b> No diagnosis filled </b></center>");
				return;
			}

			String fromDateKey = fromdate.concat(dash).concat(frommonth)
					.concat(dash).concat(fromyear);
			String toDateKey = todate.concat(dash).concat(tomonth).concat(dash)
					.concat(toyear);

			String sql = "select p.first_name, p.last_name, p.address, p.phone, "
					+ "r.test_date from radiology_record r, persons p where "
					+ " r.user_name = p.patient_name and r.diagnosis = \'"
					+ diagnosis
					+ "\' and r.test_date between "
					+ fromDateKey
					+ " and " + toDateKey + " order by r.test_date asc";
			Statement stmt = null;
			ResultSet rset = null;

			stmt = UserConnection.getConnection().getConn().createStatement();
			rset = stmt.executeQuery(sql);

			try {
				String value = null;
				Object o = null;
				ResultSetMetaData rsetMetaData = rset.getMetaData();
				int columnCount = rsetMetaData.getColumnCount();

				out.println("<table id=\"e1\" class=\"cc08\" border=\"1\">");
				out.println("<tr valign = \"top\">");

				for (int column = 1; column <= columnCount; column++) {
					value = rsetMetaData.getColumnLabel(column);
					out.print("<td>" + value + "</td>");
				}
				out.println("</tr>");

				/*
				 *   generate answers, one tuple at a time
				 */
				while (rset != null && rset.next()) {
					if (!names.contains(rset.getString(0))) {
						names.add(rset.getString(0));

						out.println("<tr valign = \"top\">");

						for (int index = 1; index <= columnCount; index++) {
							o = rset.getObject(index);
							if (o != null)
								value = o.toString();
							else
								value = "null";
							out.print("<td>" + value + "</td>");
						}
						out.println("</tr>");
					}
				}

				out.println("</table>");

			} catch (Exception ex) {
				System.out.println("" + ex.getMessage() + "");
			}

			stmt.close();

		} catch (Exception ex) {

		}

	}%>

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

		if (request.getParameter("rSubmit") != null) {
			generateReport(request, out);
		}
	} catch (Exception ex) {
		System.out.println("" + ex.getMessage() + "");
	}
%>
<body id="page" onload="if(IE||V5) OnWeLoad()">
	<a href="adminUser.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[6],Img24,'cmput391_004.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[6],Img24,0,0)"> <img id="e24"
		name="e24" src="cmput391004011.jpg" title="" alt="cmput391004011.jpg"
		align="right" border="0"></a>
	<div id="e23" class="cc07">
		<a href="adminUser.jsp"> Home</a>
	</div>
	<a href="adminEditProfile.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[5],Img22,'cmput391_005.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[5],Img22,0,0)"> <img id="e22"
		name="e22" src="cmput391004009.jpg" title="" alt="cmput391004009.jpg"
		align="right" border="0"></a>
	<div id="e21" class="cc07">
		<a href="adminEditProfile.jsp"> Edit Profile</a>
	</div>
	<a href="Home.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[4],Img20,'index.html',1)"
		onmouseout="OnWeOver(0,0,0,IDP[4],Img20,0,0)"> <img id="e20"
		name="e20" src="cmput391004007.jpg" title="" alt="cmput391004007.jpg"
		align="right" border="0"></a>
	<div id="e19" class="cc07">
		<a href="Home.jsp"> Logout</a>
	</div>
	<a href="managaUsers.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[3],Img18,'cmput391_006.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[3],Img18,0,0)"> <img id="e18"
		name="e18" src="cmput391004005.jpg" title="" alt="cmput391004005.jpg"
		align="right" border="0"></a>
	<div id="e17" class="cc07">
		<a href="manageUsers.jsp"> Manage Users</a>
	</div>
	<a href="viewLogs.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[2],Img16,'cmput391_007.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[2],Img16,0,0)"> <img id="e16"
		name="e16" src="cmput391004003.jpg" title="" alt="cmput391004003.jpg"
		align="right" border="0"></a>
	<div id="e15" class="cc07">
		<a href="viewLogs.jsp"> View Logs</a>
	</div>
	<a href="adminSearch.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[1],Img14,'cmput391_008.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[1],Img14,0,0)"> <img id="e14"
		name="e14" src="cmput391004001.jpg" title="" alt="cmput391004001.jpg"
		align="right" border="0"></a>
	<div id="e13" class="cc07">
		<a href="adminSearch.jsp"> Search</a>
	</div>
	<input id="e12" class="cc08" type="submit" value="Generate Report" 
	name="rSubmit">
	<input id="e11" class="cc09" type="text" name="diagnosis" size="23">
	<select id="e10" class="cc08" size="1" name="todate" title="Day">
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
	</select>
	<select id="e9" class="cc08" size="1" name="tomonth" title="Month">
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
	</select>
	<select id="e8" class="cc08" size="1" name="toyear" title="Year">
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
	<select id="e7" class="cc08" size="1" name="fromdate" title="Day">
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
	</select>
	<select id="e6" class="cc08" size="1" name="frommonth" title="Month">
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
	</select>
	<select id="e5" class="cc08" size="1" name="fromyear" title="Year">
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
	<div id="e4" class="cc08">From:</div>
	<div id="e3" class="cc08">To:</div>
	<div id="e2" class="cc08">Diagnosis:</div>
</body>
</html>