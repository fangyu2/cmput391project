<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="cmput391.*" %>
<%! private User loggedUser; %>

<%
//checks what class the user is then send him/her back to their respective home
//page
if(request.getParameter("bSubmit") != null) {
	loggedUser = (User) request.getSession().getAttribute("loggedUser");
	if(loggedUser.getUserClass().compareTo("r") == 0 ){
		response.sendRedirect("radioUser.jsp");
	}
	else if(loggedUser.getUserClass().compareTo("a") == 0) {
		response.sendRedirect("adminUser.jsp");
	}
	else {
		response.sendRedirect("regUser.jsp");
	}
	
}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Help</title>
</head>
<body>
<p>&nbsp;</p>
<form method="post">
<input type="submit" name="bSubmit" value="Click To Return">
</form>
<p>&nbsp;</p>
	<p>
		<strong><span style="text-decoration: underline;">General
				Functionalities</span></strong>
	</p>
	<p>
		<strong>Searching:</strong><br /> <br /> To use the search by date
		all three fields from, to, and ascending or descending need to be
		filled out, if you are just searching without dates for patient name,
		diagnosis or description then just type in the terms. (up to 2 terms max)
	</p>
	<p>
		<strong>Editing Profile:</strong>
	</p>
	<p>To edit your profile simply click on edit profile tab to the
		side after logging in, then enter the information you wish to edit and
		click ok to save. Note that if you are changing your password or email
		then new email and password must match the verification password and
		email. Also for email it must be unique. (meaning no one else is using
		the email already)</p>
	<p>
		<br />
		<strong><span style="text-decoration: underline;">Radiologists
				only</span></strong>
	</p>
	<p>
		<strong>Adding a Record:</strong><br /> <br /> To add a record
		simply fill out the necessary information on the page. If you wish to
		attach photos simply check box the attach photo option. Then user is 
		taken to the upload picture page. There user is
		prompt to continue uploading photos till the user presses return
		button.
	</p>
	<p>
		<br />
		<strong><span style="text-decoration: underline;">Admins
				Only</span></strong>
	</p>
	<p>
		<strong>Managing Users:</strong>
	</p>
	<p>
		To manage users, simply click on the manage users and enter a user
		name, then type in a user name and press enter if you would like to
		view information on the user. If you would like to change the users
		information then just press add and modify. When arrived on the
		designated page, just enter the username and any information you would
		like to change. Then press add/modify button to change the
		information. If you would like to delete the user, simply press the
		delete button with a user name entered.<br />If the user name entered
		matches a doctors name, and patient name is entered, then a doctor
		patient relationship is automatically created, and the same goes for
		patient name matching the user name and a doctor name is entered.
	</p>
	<p>
		<strong>Viewing Logs:</strong>
	</p>
	<p>To view logs as an administrator, simple type in the diagnosis
		term and specify the date range you would like from a certain date to
		another date then press search and the results will be displayed in a
		table below.</p>
	<p>&nbsp;</p>
</body>
</html>