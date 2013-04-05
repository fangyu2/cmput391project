<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@ page import="java.sql.*,cmput391.*"%>
<%!private User loggedUser;
	private String uClass;
	private String uName = "";
	private String uPass;
	private String verifyUPass;
	private String uPhone = "";
	private String uEmail = "";
	private String verifyUEmail;
	private String Address = "";
	private String uFirstName = "";
	private String uLastName = "";

	//retrieves the users information that is currently logged in
	public void queryUser() {
		ResultSet rset = null;
		Statement stmt = null;
		String sql;

		sql = "select * from persons where user_name = \'" + uName + "\'";

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
			verifyUEmail = uEmail; //set the verify email box to be email
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException ex) {
			System.out.println("" + ex.getMessage() + "");
		}
	}

	//if checkforuseremail is true then we check if a user already exists
	//with such email
	public boolean checkForExistingEmail() {
		ResultSet rset = null;
		Statement stmt = null;
		String sql = "select * from persons where email = \'" + uEmail + "\'";

		try {
			stmt = UserConnection
					.getConnection()
					.getConn()
					.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_READ_ONLY);
			rset = stmt.executeQuery(sql);

			if (!rset.isBeforeFirst()) {
				if (stmt != null) {
					stmt.close();
				}
				return false;
			}
		} catch (Exception ex) {

		}
		return true;
	}

	//updates the users information as the provided when called
	public void updateUserInfo() {
		ResultSet rset = null;
		Statement stmt = null;
		String sql = "select first_name, last_name, address, email, phone"
				+ "from persons where user_name = \'" + uName + "\'";

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

	//changes the user password to provided when called
	public void updatePassword() {
		ResultSet rset = null;
		Statement stmt = null;
		String sql = "select password from users where user_name = \'" + uName
				+ "\'";

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
		//checks whether the user logged in is a radiologist
		loggedUser = (User) request.getSession().getAttribute(
				"loggedUser");
		if (loggedUser == null) {
			response.sendRedirect("Home.jsp");
		} else {
			uClass = loggedUser.getUserClass();
			if (uClass.compareTo("r") != 0)
				response.sendRedirect("Home.jsp");
		}
		uName = loggedUser.getUserName();
		queryUser();
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
				
				//checks if the user already exists with the provided email
				if (!checkForExistingEmail()) {
					uEmail = temp;
				} else {
					out.println("<center><p><b> Email Already Exist </b></p></center");
				}
			} else {
				out.println("<center><p><b> Emails Entered Did Not Match </b></p></center");
			}

			updateUserInfo();

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
<title>RadioEditProfile</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_012_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_012_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
	<form method="post">
		<a href="radioUser.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[5],Img30,'cmput391_009.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[5],Img30,0,0)"> <img id="e30"
			name="e30" src="cmput391012009.jpg" title="" alt="cmput391012009.jpg"
			align="right" border="0"></a>
		<div id="e29" class="cc27">
			<a href="radioUser.jsp"> Home</a>
		</div>
		<a href="radioEditProfile.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[4],Img28,'cmput391_012.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[4],Img28,0,0)"> <img id="e28"
			name="e28" src="cmput391012007.jpg" title="" alt="cmput391012007.jpg"
			align="right" border="0"></a>
		<div id="e27" class="cc27">
			<a href="radioEditProfile.jsp"> Edit Profile</a>
		</div>
		<a href="Home.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[3],Img26,'index.html',1)"
			onmouseout="OnWeOver(0,0,0,IDP[3],Img26,0,0)"> <img id="e26"
			name="e26" src="cmput391012005.jpg" title="" alt="cmput391012005.jpg"
			align="right" border="0"></a>
		<div id="e25" class="cc27">
			<a href="Home.jsp"> Logout</a>
		</div>
		<a href="addRecords.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[2],Img24,'cmput391_011.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[2],Img24,0,0)"> <img id="e24"
			name="e24" src="cmput391012003.jpg" title="" alt="cmput391012003.jpg"
			align="right" border="0"></a>
		<div id="e23" class="cc27">
			<a href="addRecords.jsp"> Add Records</a>
		</div>
		<a href="radioSearch.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[1],Img22,'cmput391_010.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[1],Img22,0,0)"> <img id="e22"
			name="e22" src="cmput391012001.jpg" title="" alt="cmput391012001.jpg"
			align="right" border="0"></a>
		<div id="e21" class="cc27">
			<a href="radioSearch.jsp"> Search</a>
		</div>
		<input id="e20" class="cc28" type="password" name="password" size="10">
		<input id="e19" class="cc28" type="password" name="password" size="10">
		<input id="e18" class="cc29" type="button" value="Ok" name="bSubmit">
		<div id="e17" class="cc29">New Password:</div>
		<div id="e16" class="cc29">Re-Type Password:</div>
		<div id="e15" class="cc30">Change Password:</div>
		<div id="e14" class="cc31">Edit Profile</div>
		<div id="e13" class="cc30">Change Email:</div>
		<input id="e12" class="cc28" type="text" name="newemail" size="23"
			value="<%=uEmail%>">
		<div id="e11" class="cc29">New Email:</div>
		<input id="e10" class="cc28" type="text" name="renewemail" size="23"
			value="<%=uEmail%>">
		<div id="e9" class="cc30">Change Personal Information:</div>
		<input id="e8" class="cc28" type="text" name="address" size="23"
			value="<%=Address%>">
		<div id="e7" class="cc29">Address:</div>
		<input id="e6" class="cc28" type="text" name="phone" size="23"
			value="<%=uPhone%>">
		<div id="e5" class="cc29">Phone:</div>
		<input id="e4" class="cc28" type="text" name="firstname" size="23"
			value="<%=uFirstName%>">
		<div id="e3" class="cc29">First Name:</div>
		<input id="e2" class="cc28" type="text" name="lastname" size="23"
			value="<%=uLastName%>">
		<div id="e1" class="cc29">Last Name:</div>
	</form>
</body>
</html>