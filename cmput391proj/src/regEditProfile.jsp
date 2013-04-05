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
			verifyUEmail = uEmail;
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException ex) {
			System.out.println("" + ex.getMessage() + "");
		}
	}

	//updates the user info with the provided
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

			return true;
		} catch (Exception ex) {

		}
	}

	//updates the password with the provided when called
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
		//checks whether the user logged in is a patient or doctor
		loggedUser = (User) request.getSession().getAttribute(
				"loggedUser");
		if (loggedUser == null) {
			response.sendRedirect("Home.jsp");
		} else {
			String uClass = loggedUser.getUserClass();
			if (uClass.compareTo("a") == 0
					|| uClass.compareTo("r") == 0)
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

				//query the data base to see if a user already exist with the
				//specified email
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
<title>EditProfile</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_013_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_013_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">
	<form method="post">
		<a href="regUser.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[4],Img28,'cmput391_003.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[4],Img28,0,0)"> <img id="e28"
			name="e28" src="cmput391013007.jpg" title="" alt="cmput391013007.jpg"
			align="right" border="0"></a>
		<div id="e27" class="cc32">
			<a href="regUser.jsp"> Home</a>
		</div>
		<a href="regEditProfile.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[3],Img26,'cmput391_013.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[3],Img26,0,0)"> <img id="e26"
			name="e26" src="cmput391013005.jpg" title="" alt="cmput391013005.jpg"
			align="right" border="0"></a>
		<div id="e25" class="cc32">
			<a href="regEditProfile.jsp"> Edit Profile</a>
		</div>
		<a href="Home.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[2],Img24,'index.html',1)"
			onmouseout="OnWeOver(0,0,0,IDP[2],Img24,0,0)"> <img id="e24"
			name="e24" src="cmput391013003.jpg" title="" alt="cmput391013003.jpg"
			align="right" border="0"></a>
		<div id="e23" class="cc32">
			<a href="Home.jsp"> Logout</a>
		</div>
		<a href="regSearch.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[1],Img22,'cmput391_014.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[1],Img22,0,0)"> <img id="e22"
			name="e22" src="cmput391013001.jpg" title="" alt="cmput391013001.jpg"
			align="right" border="0"></a>
		<div id="e21" class="cc32">
			<a href="regSearch.jsp"> Search</a>
		</div>
		<input id="e20" class="cc33" type="password" name="password" size="10">
		<input id="e19" class="cc33" type="password" name="password" size="10">
		<input id="e18" class="cc34" type="button" value="Ok" name="bSubmit">
		<div id="e17" class="cc34">New Password:</div>
		<div id="e16" class="cc34">Re-Type Password:</div>
		<div id="e15" class="cc35">Change Password:</div>
		<div id="e14" class="cc36">Edit Profile</div>
		<div id="e13" class="cc35">Change Email:</div>
		<input id="e12" class="cc33" type="text" name="newemail" size="23"
			value="<%=uEmail%>">
		<div id="e11" class="cc34">New Email:</div>
		<input id="e10" class="cc33" type="text" name="renewemail" size="23"
			value="<%=uEmail%>">
		<div id="e9" class="cc35">Change Personal Information:</div>
		<input id="e8" class="cc33" type="text" name="address" size="23"
			value="<%=Address%>">
		<div id="e7" class="cc34">Address:</div>
		<input id="e6" class="cc33" type="text" name="phone" size="23"
			value="<%=uPhone%>">
		<div id="e5" class="cc34">Phone:</div>
		<input id="e4" class="cc33" type="text" name="firstname" size="23"
			value="<%=uFirstName%>">
		<div id="e3" class="cc34">First Name:</div>
		<input id="e2" class="cc33" type="text" name="lastname" size="23"
			value="<%=uLastName%>">
		<div id="e1" class="cc34">Last Name:</div>
	</form>
</body>
</html>