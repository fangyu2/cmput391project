<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ page import="java.sql.*,cmput391.*"%>
<%!private User loggedUser;
	private String uName = "";
	private String uPass;
	private String verifyUPass;
	private String uPhone = "";
	private String uEmail = "";
	private String verifyUEmail;
	private String Address = "";
	private String uFirstName = "";
	private String uLastName = "";

	public void queryUser(HttpServletRequest request,
			HttpServletResponse response, JspWriter out) {
		ResultSet rset = null;
		Statement stmt = null;
		String sql = "select * from persons where user_name = \'" + uName
				+ "\'";

		try {
			stmt = UserConnection
					.getConnection()
					.getConn()
					.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			rset = stmt.executeQuery(sql);

			while (rset != null && rset.next()) {
				uFirstName = (rset.getString(2)).trim();
				uLastName = (rset.getString(3)).trim();
				Address = (rset.getString(4)).trim();
				uEmail = (rset.getString(5)).trim();
				uPhone = (rset.getString(6)).trim();
			}
			verifyUEmail = uEmail;
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException ex) {
			System.out.println("" + ex.getMessage() + "");
		}
	}

	public void updateUserInfo(HttpServletRequest request,
			HttpServletResponse response, JspWriter out) {
		ResultSet rset = null;
		Statement stmt = null;
		String sql = "select first_name, last_name, address, email, phone" +
				"from persons where user_name = \'" + uName + "\'";

		try {
			stmt = UserConnection
					.getConnection()
					.getConn()
					.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_UPDATABLE);
			rset = stmt.executeQuery(sql);

			while (rset != null && rset.next()) {
				rset.updateString(1, uFirstName);
				rset.updateString(2, uLastName);
				rset.updateString(3, Address);
				rset.updateString(4, uEmail);
				rset.updateString(5, uPhone);
				rset.updateRow();
			}
			
			UserConnection.getConnection().getConn().commit();
			
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException ex) {

		} 
	}

	public void updatePassword() {
		ResultSet rset = null;
		Statement stmt = null;
		String sql = "select password from users where user_name = \'" + uName + "\'";

		try {
			stmt = UserConnection
					.getConnection()
					.getConn()
					.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_UPDATABLE);
			rset = stmt.executeQuery(sql);

			while (rset != null && rset.next()) {
				rset.updateString("password", uPass);
				rset.updateRow();
			}
			
			UserConnection.getConnection().getConn().commit();
			
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException ex) {
			System.out.println("" + ex.getMessage() + "");
		}

	}%>

<%
	String temp;
	try {
		loggedUser = (User) request.getSession().getAttribute(
				"loggedUser");//UserManager.getUserManager().getUser();
		if (loggedUser == null) {
			response.sendRedirect("Home.jsp");
		}
		uName = loggedUser.getUserName();
		queryUser(request, response, out);
		if (request.getParameter("bSubmit") != null) {
			uPass = request.getParameter("password").trim();
			verifyUPass = request.getParameter("veripassword").trim();
			temp = request.getParameter("firstname").trim();
			if (!temp.equals("")) {
				uFirstName = temp;
			}
			temp = request.getParameter("lastname").trim();
			if (!temp.equals("")) {
				uLastName = temp;
			}
			temp = request.getParameter("address").trim();
			if (!temp.equals("")) {
				Address = temp;
			}
			temp = request.getParameter("phone").trim();
			if (!temp.equals("")) {
				uPhone = temp;
			}
			temp = request.getParameter("newemail").trim();
			verifyUEmail = request.getParameter("renewemail").trim();
			if (!temp.equals("") && (verifyUEmail.compareTo(temp) == 0)) {
				uEmail = temp;
			} else {
				out.println("<center><p><b> Emails Entered Did Not Match </b></p></center");
			}

			updateUserInfo(request, response, out);

			if (uPass.compareTo(verifyUPass) == 0) {
				updatePassword();
			} else {
				out.println("<center><p><b> Passwords Entered Did Not Match </b></p></center");
			}

		}
	} catch (Exception ex) {
		System.out.println("" + ex.getMessage() + "");
	}
%>
<head>
<title>AdminEditProfile</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_005_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_005_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
	<form method="post">
		<a href="adminUser.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[6],Img33,'cmput391_004.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[6],Img33,0,0)"> <img id="e33"
			name="e33" src="cmput391005011.jpg" title="" alt="cmput391005011.jpg"
			align="right" border="0"></a>
		<div id="e32" class="cc08">
			<a href="adminUser.jsp"> Home</a>
		</div>
		<a href="adminEditProfile.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[5],Img31,'cmput391_005.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[5],Img31,0,0)"> <img id="e31"
			name="e31" src="cmput391005009.jpg" title="" alt="cmput391005009.jpg"
			align="right" border="0"></a>
		<div id="e30" class="cc08">
			<a href="adminEditProfile.jsp"> Edit Profile</a>
		</div>
		<a href="Home.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[4],Img29,'index.html',1)"
			onmouseout="OnWeOver(0,0,0,IDP[4],Img29,0,0)"> <img id="e29"
			name="e29" src="cmput391005007.jpg" title="" alt="cmput391005007.jpg"
			align="right" border="0"></a>
		<div id="e28" class="cc08">
			<a href="Home.jsp"> Logout</a>
		</div>
		<a href="manageUsers.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[3],Img27,'cmput391_006.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[3],Img27,0,0)"> <img id="e27"
			name="e27" src="cmput391005005.jpg" title="" alt="cmput391005005.jpg"
			align="right" border="0"></a>
		<div id="e26" class="cc08">
			<a href="manageUsers.jsp"> Manage Users</a>
		</div>
		<a href="viewLogs.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[2],Img25,'cmput391_007.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[2],Img25,0,0)"> <img id="e25"
			name="e25" src="cmput391005003.jpg" title="" alt="cmput391005003.jpg"
			align="right" border="0"></a>
		<div id="e24" class="cc08">
			<a href="viewLogs.jsp"> View Logs</a>
		</div>
		<a href="adminSearch.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[1],Img23,'cmput391_008.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[1],Img23,0,0)"> <img id="e23"
			name="e23" src="cmput391005001.jpg" title="" alt="cmput391005001.jpg"
			align="right" border="0"></a>
		<div id="e22" class="cc08">
			<a href="adminSearch.jsp"> Search</a>
		</div>
		<input id="e21" class="cc09" type="password" name="password" size="10">
		<input id="e20" class="cc09" type="password" name="veripassword"
			size="10"> <input id="e19" class="cc10" type="submit"
			value="Ok" name="bSubmit">
		<div id="e18" class="cc10">New Password:</div>
		<div id="e17" class="cc10">Re-Type Password:</div>
		<div id="e16" class="cc11">Change Password:</div>
		<div id="e15" class="cc12">Edit Profile</div>
		<div id="e14" class="cc11">Change Email:</div>
		<input id="e13" class="cc09" type="text" name="newemail" size="23" value="<%=uEmail%>">
		<div id="e12" class="cc10" >New Email:</div>
		<input id="e11" class="cc09" type="text" name="renewemail" size="23" value="<%=uEmail%>">
		<div id="e10" class="cc10">Retype New Email:</div>
		<div id="e9" class="cc11">Change Personal Information:</div>
		<input id="e8" class="cc09" type="text" name="address" size="23" value="<%=Address%>">
		<div id="e7" class="cc10" >Address:</div>
		<input id="e6" class="cc09" type="text" name="phone" size="23" value="<%=uPhone%>">
		<div id="e5" class="cc10">Phone:</div>
		<input id="e4" class="cc09" type="text" name="firstname" size="23" value="<%=uFirstName%>">
		<div id="e3" class="cc10">First Name:</div>
		<input id="e2" class="cc09" type="text" name="lastname" size="23"
			value="<%=uLastName%>">
		<div id="e1" class="cc10">Last Name:</div>
	</form>
</body>
</html>