<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_002_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_002_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>

<%@ page import="java.sql.*, cmput391.*, javax.servlet.http"%>

<%! private String uName;
	private String uPass;%>

<%
	uName = request.getParameter("userName").trim();
	uPass = request.getParameter("password").trim();
%>

<%!public String openPage(String uClass, HttpServletRequest request) {
		String jspPage = null;
		if (uClass.equals("a")) {
			request.getRequestDispatcher("/adminUser.jsp");
		} else if (uClass.equals("p") || uClass.equals("d")) {
			request.getRequestDispatcher("/regUser.jsp");
		} else if (uClass.equals("r")) {
			request.getRequestDispatcher("/radioUser.jsp");
		}
		return jspPage;
	}

	public void queryUser(HttpServletRequest request) {
		String tempClass;
		String sql = "select * from Users where user_name = '" + uName
				+ "' and" + "password = ' " + uPass + "'";
		Statement stmt = null;
		ResultSet rset = null;

		try {
			stmt = UserConnection.getConnection().getConn().createStatement();
			rset = stmt.executeQuery(sql);
		} catch (Exception ex) {
			System.out.println("" + ex.getMessage() + "");
		}

		String truepwd = "";

		while (rset != null && rset.next()) {
			truepwd = (rset.getString(1)).trim();
			tempClass = (rset.getString(2)).trim();
		}

		if (uPass.equals(truepwd)) {
			openPage(tempClass, request);
		} else {
			System.out
					.println("<p><b> Either You Username or Your password is invald </b></p>");
		}
	}%>
<body id="page" onload="if(IE||V5) OnWeLoad()">
	<form method="post">
		<a href="Home.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[2],Img11,'index.html',1)"
			onmouseout="OnWeOver(0,0,0,IDP[2],Img11,0,0)"> <img id="e11"
			name="e11" src="cmput391002003.jpg" title="" alt="cmput391002003.jpg"
			align="right" border="0"></a>
		<div id="e10" class="cc02">
			<a href="Home.jsp"> Home</a>
		</div>
		<a href="Login.jsp"
			onmouseover="OnWeOver(0,0,0,IDP[1],Img9,'cmput391_002.htm',1)"
			onmouseout="OnWeOver(0,0,0,IDP[1],Img9,0,0)"> <img id="e9"
			name="e9" src="cmput391002001.jpg" title="" alt="cmput391002001.jpg"
			align="right" border="0"></a>
		<div id="e8" class="cc02">
			<a href="Login.jsp"> Login</a>
		</div>
		<input id="e7" class="cc03" type="text" name="userName" size="23">
		<input id="e6" class="cc03" type="password" name="password" size="23">
		<input id="e5" class="cc04" type="button" value="Login"
			onclick="queryUser(request);">
		<div id="e4" class="cc04">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UserName:
		</div>
		<div id="e3" class="cc04">&nbsp;&nbsp;Password:</div>
		<div id="e2" class="cc05">User Login:</div>
		<input id="e1" class="cc04" type="button" value="Register"
			onclick="location.href='Register.jsp'">
	</form>
</body>
</html>