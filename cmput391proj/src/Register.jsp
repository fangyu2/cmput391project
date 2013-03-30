<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="cmput391.*" %>
<%@ page import="java.sql.*" %>
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


<%@ page import="cmput391.*" %>
<%@ page import="java.sql.*" %>

<%
if(request.getParameter("rSubmit")!=null)
{
    checkUser(request, response, out);
}
%>

<%!public void checkUser(HttpServletRequest request, HttpServletResponse response, JspWriter out) {
	
	try {
			String username = (request.getParameter("username")).trim();
			String sql = "select * from users where user_name = '" + username + "'";
			Statement stmt = null;
			ResultSet rset = null;
			stmt = UserConnection.getConnection().getConn().createStatement();
			rset = stmt.executeQuery(sql);
			String trueuser = "";
			while (rset != null && rset.next()) {
				trueuser = (rset.getString(1)).trim();
			}
			if (username.equals(trueuser)) {
				out.println("<p><b> This user name already exists! </b></p>");
			} 
			if (username.equals("")) {
				out.println("<p><b> Username field not filled! </b></p>");
			}
			else {
				checkPassword(username,request, response, out);
			}
		} catch (Exception ex) {
			System.out.println("" + ex.getMessage() + "");
		}
	}
	
	
	public void checkPassword(String username, HttpServletRequest request, HttpServletResponse response, JspWriter out) {
		try {
		String password = (request.getParameter("password")).trim();
		String retypepassword = (request.getParameter("retypepassword")).trim();
		if(!password.equals(retypepassword)){
			out.println("<p><b> Passwords dont match! </b></p>");
		}
		if (password.equals("")) {
			out.println("<p><b> Password field not filled! </b></p>");
		}
		else{
			checkEmail(username, password, request, response, out);
		}

		} catch (Exception ex) {
		System.out.println("" + ex.getMessage() + "");
		}
	}
	
	public void checkEmail(String username, String password, 
			HttpServletRequest request, HttpServletResponse response, JspWriter out) {
		try {
		
		String email = (request.getParameter("email"));
		String sql = "select * from persons where email = '" + email + "'";
		Statement stmt = null;
		ResultSet rset = null;

			stmt = UserConnection.getConnection().getConn().createStatement();
			rset = stmt.executeQuery(sql);

			String trueEmail = "";

			while (rset != null && rset.next()) {
				trueEmail = (rset.getString(5)).trim();
			}

			if (email.equals(trueEmail)) {
				out.println("<p><b> This Email is already registered by another user! </b></p>");
			}
			if (email.equals("")) {
				out.println("<p><b> Email field not filled! </b></p>");
			}
			else {
				registerUser(username, password, email, request, response, out);
			}
		} catch (Exception ex) {
			System.out.println("" + ex.getMessage() + "");
		}

	}
	
	
	public void registerUser(String username, String password, String email, 
			HttpServletRequest request, HttpServletResponse response, JspWriter out) {
		try {
		
		String comboBox = (request.getParameter("combo_box"));
		
		if(comboBox.equals("1. Patient")){
			comboBox = "p";
		}
		if(comboBox.equals("2. Doctor")){
			comboBox = "d";
		}
		if(comboBox.equals("3. Radiologist")){
			comboBox = "r";
		}
		if(comboBox.equals("4. Admin")){
			comboBox = "a";
		}
		
		try{
		String sql = "insert into users values ('" +username+ "','" +password+ "', '" +comboBox+ "', SYSDATE)";
		Statement stmt = null;
		ResultSet rset = null;

			stmt = UserConnection.getConnection().getConn().createStatement();
			rset = stmt.executeQuery(sql);
			UserConnection.getConnection().getConn().commit();
		} catch (Exception ex) {
			System.out.println("" + ex.getMessage() + "");
		}
		
		String firstname = (request.getParameter("firstname"));
		String lastname = (request.getParameter("lastname"));
		String address = "N/A";
		String phone = (request.getParameter("phone"));
		try {
		String sql2 = "insert into persons values ('" +username+ "', '" +firstname+ "', '" +lastname+ "','" +address+ "', '" +email+ "', '" +phone+ "')";
		Statement stmt = null;
		ResultSet rset = null;
		
			stmt = UserConnection.getConnection().getConn().createStatement();
			rset = stmt.executeQuery(sql2);
			UserConnection.getConnection().getConn().commit();
		} catch (Exception ex) {
			System.out.println("" + ex.getMessage() + "");
		}
		
		}catch (Exception ex) {
			System.out.println("" + ex.getMessage() + "");
		}

	}
	
	public void openPage(HttpServletResponse response, JspWriter out) {
		try{
			response.sendRedirect("Login.jsp");
		}catch (Exception ex) {
			System.out.println("" + ex.getMessage() + "");
		}
	}
	%>


<form method="post">
	<input id="e24" class="cc41" type="text" name="username" value="userName" size="23">
	<input id="e23" class="cc41" type="password" name="password" size="23">
	<input id="e22" class="cc42" type="submit" value="Register" name="rSubmit">
	<div id="e21" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName:
	</div>
	<div id="e20" class="cc42">
		&nbsp;&nbsp;Password:
	</div>
	<div id="e19" class="cc43">
		Register:
	</div>
	<input id="e18" class="cc41" type="password" name="retypepassword" size="23">
	<div id="e17" class="cc42">
		Retype Password:
	</div>
	<div id="e16" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Class:
	</div>
	<div id="e15" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:
	</div>
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img14,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img14,0,0)">
		<img id="e14" name="e14" src="cmput391015003.jpg" title="" alt="cmput391015003.jpg" align="right" border="0"></a>
	<div id="e13" class="cc44">
		<a href="Home.jsp">
		Home</a>
	</div>
	<a href="Login.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img12,'cmput391_002.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img12,0,0)">
		<img id="e12" name="e12" src="cmput391015001.jpg" title="" alt="cmput391015001.jpg" align="right" border="0"></a>
	<div id="e11" class="cc44">
		<a href="Login.jsp">
		Login</a>
	</div>
	<input id="e10" class="cc41" type="text" name="firstname" value="FirstName" size="23">
	<div id="e9" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Name:
	</div>
	<input id="e8" class="cc41" type="text" name="lastname" value="lastName" size="23">
	<div id="e7" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name:
	</div>
	<input id="e6" class="cc41" type="text" name="phone" value="phone" size="23">
	<div id="e5" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone:
	</div>
	<input id="e4" class="cc41" type="text" name="address" value="address" size="23">
	<div id="e3" class="cc42">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:
	</div>
	<input id="e2" class="cc41" type="text" name="text_box" value="email" size="23">
	<select id="e1" class="cc45" size="1" name="combo_box">
	<option> 1. Patient</option>
	<option> 2. Doctor</option>
	<option> 3. Radiologist</option>
	<option> 4. Admin</option>
	</select>
</form>
</body>
</html>