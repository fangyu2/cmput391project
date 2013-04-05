<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>ManageUsers</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Content-Style-Type" content="text/css;">
<link rel="stylesheet" href="cmput391_g.css" type="text/css"
	media="screen,projection,print">
<!--// Document Style //-->
<link rel="stylesheet" href="cmput391_006_p.css" type="text/css"
	media="screen,projection,print">
<!--// Page Style //-->
<script src="cmput391_g.js" type="text/javascript"></script>
<!--// Document Script //-->
<script src="cmput391_006_a.js" type="text/javascript"></script>
<!--// Motion Script //-->
</head>


<body id="page" onload="if(IE||V5) OnWeLoad()">

<%@ page import="cmput391.*" %>
<%@ page import="java.sql.*" %>

	<%
	   //deals with the action of hiting the submit/enter button, and calls the appropriate method
	   if (request.getParameter("mSubmit") != null)
	   {
	      checkUser(request, response, out);
	   }
	   
	   if (request.getParameter("rSubmit") != null)
	   {
	      try
	      {
	         response.sendRedirect("Register.jsp");
	      } catch (Exception ex)
	      {
	         System.out.println("" + ex.getMessage() + "");
	      }
	   }
//basic user guideance
	   try
	   {

	      out.println("<center>");
	      out.println("<form method=POST>");
	      out.println("<h3>Enter a user you would like to see info for</h3>");
	      out.println("<input class=cc41 type=text name=username value=userName size=23>");
	      out.println("<input type=submit name=mSubmit value=Submit>");
	      out.println("<input type=submit name=rSubmit value=\"Add/Update\">");
	      out.println("</form>");

	   } catch (Exception ex)
	   {
	      System.out.println("" + ex.getMessage() + "");
	   }
	%>

	<%!
	//Checks to make sure the user they are trying to edit exists
	public void checkUser(HttpServletRequest request,
         HttpServletResponse response, JspWriter out)
   {

      try
      {
         String username = (request.getParameter("username")).trim();
         String sql = "select * from users where user_name = '" + username
               + "'";
         Statement stmt = null;
         ResultSet rset = null;
         stmt = UserConnection.getConnection().getConn().createStatement();
         rset = stmt.executeQuery(sql);
         String trueuser = "";
         while (rset != null && rset.next())
         {
            trueuser = (rset.getString(1)).trim();
         }
         if (!username.equals(trueuser))
         {
            out.println("<center>");
            out.println("<p><b> That username does not exist! </b></p>");
         }
         if (username.equals(""))
         {
            out.println("<center>");
            out.println("<p><b> Username field not filled! </b></p>");
         }
         if (!username.equals("") && username.equals(trueuser))
         {
            queryUser(username, request, response, out);
         }
      } catch (Exception ex)
      {
         System.out.println("" + ex.getMessage() + "");
      }
   }

	//parses the users associated input into the proper variables and performs the required 
	//security checks.
   public void queryUser(String username, HttpServletRequest request,
         HttpServletResponse response, JspWriter out)
   {

      try
      {

         String sql = "select class from users where user_name = '" + username
               + "'";
         String classID = "";
         Statement stmt = null;
         ResultSet rset = null;

         stmt = UserConnection.getConnection().getConn().createStatement();
         rset = stmt.executeQuery(sql);

         while (rset != null && rset.next())
         {
            classID = (rset.getString(1)).trim();
         }

         if (classID.equals("d"))
         {
            out.println("<center>");
            out.println(username);
            String sql2 = "select u.password, u.class, u.date_registered, p.first_name, p.last_name, p.address, p.email, p.phone, fd.doctor_name, fd.patient_name "
                  + "from users u join persons p on u.user_name = p.user_name join family_doctor fd on u.user_name = fd.doctor_name where u.user_name = '"
                  + username + "'";
            Statement stmt2 = null;
            ResultSet rset2 = null;
            stmt2 = UserConnection.getConnection().getConn().createStatement();
            rset2 = stmt.executeQuery(sql2);
            displayResultSet(out, rset2, request);

         }

         if (classID.equals("p"))
         {
            out.println("<center>");
            out.println(username);
            String sql2 = "select u.password, u.class, u.date_registered, p.first_name, p.last_name, p.address, p.email, p.phone, fd.doctor_name, fd.patient_name "
                  + "from users u join persons p on u.user_name = p.user_name join family_doctor fd on u.user_name = fd.patient_name where u.user_name = '"
                  + username + "'";
            Statement stmt2 = null;
            ResultSet rset2 = null;
            stmt2 = UserConnection.getConnection().getConn().createStatement();
            rset2 = stmt.executeQuery(sql2);
            displayResultSet(out, rset2, request);

         }
         if (classID.equals("r"))
         {
            out.println("<center>");
            out.println(username);
            String sql2 = "select u.password, u.class, u.date_registered, p.first_name, p.last_name, p.address, p.email, p.phone "
                  + "from users u join persons p on u.user_name = p.user_name where u.user_name = '"
                  + username + "'";
            Statement stmt2 = null;
            ResultSet rset2 = null;
            stmt2 = UserConnection.getConnection().getConn().createStatement();
            rset2 = stmt.executeQuery(sql2);
            displayResultSet(out, rset2, request);
         }

         if (classID.equals("a"))
         {
            out.println("<center>");
            out.println(username);
            String sql2 = "select u.password, u.class, u.date_registered, p.first_name, p.last_name, p.address, p.email, p.phone "
                  + "from users u join persons p on u.user_name = p.user_name where u.user_name = '"
                  + username + "'";
            Statement stmt2 = null;
            ResultSet rset2 = null;
            stmt2 = UserConnection.getConnection().getConn().createStatement();
            rset2 = stmt.executeQuery(sql2);
            displayResultSet(out, rset2, request);
         }

      } catch (Exception ex)
      {
         System.out.println("" + ex.getMessage() + "");
      }
   }

   /*
    *   Display the result set in a generated HTML file
    */

   private void displayResultSet(JspWriter out, ResultSet rset,
         HttpServletRequest request)
   {

      try
      {

         HttpSession session = request.getSession(true);
         // set the maximum inactive interv al of the current session to be 5 minutes
         session.setMaxInactiveInterval(300);
         int i = 1;
         for (int n = 0; n < i; n++)
         {
            out.println("<BR>&nbsp;</BR>");
         }

         out.println("<table id=\"e13\" border = 1 alian ALIGN=center >");

         /* 
          *  to generate the column labels
          */

         String value = null;
         Object o = null;
         ResultSetMetaData rsetMetaData = rset.getMetaData();
         int columnCount = rsetMetaData.getColumnCount();

         out.println("<tr valign = \"top\">");

         for (int column = 1; column <= columnCount; column++)
         {
            value = rsetMetaData.getColumnLabel(column);
            out.print("<td>" + value + "</td>");
         }
         out.println("</tr>");

         /*
          *   generate answers, one tuple at a time
          */
         while (rset.next())
         {

            out.println("<tr valign = \"top\">");

            for (int index = 1; index <= columnCount; index++)
            {
               o = rset.getObject(index);
               if (o != null)
                  value = o.toString();
               else
                  value = "null";
               out.print("<td>" + value + "</td>");
            }
            out.println("</tr>");
         }

         out.println("</table>");

      } catch (Exception ex)
      {
         System.out.println("" + ex.getMessage() + "");
      }
   }%>

	<a href="adminUser.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[6],Img12,'cmput391_004.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[6],Img12,0,0)"> <img id="e12"
		name="e12" src="cmput391006011.jpg" title="" alt="cmput391006011.jpg"
		align="right" border="0"></a>
	<div id="e11" class="cc13">
		<a href="adminUser.jsp"> Home</a>
	</div>
	<a href="adminEditProfile.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[5],Img10,'cmput391_005.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[5],Img10,0,0)"> <img id="e10"
		name="e10" src="cmput391006009.jpg" title="" alt="cmput391006009.jpg"
		align="right" border="0"></a>
	<div id="e9" class="cc13">
		<a href="adminEditProfile.jsp"> Edit Profile</a>
	</div>
	<a href="Home.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[4],Img8,'index.html',1)"
		onmouseout="OnWeOver(0,0,0,IDP[4],Img8,0,0)"> <img id="e8"
		name="e8" src="cmput391006007.jpg" title="" alt="cmput391006007.jpg"
		align="right" border="0"></a>
	<div id="e7" class="cc13">
		<a href="Home.jsp"> Logout</a>
	</div>
	<a href="managerUsers.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[3],Img6,'cmput391_006.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[3],Img6,0,0)"> <img id="e6"
		name="e6" src="cmput391006005.jpg" title="" alt="cmput391006005.jpg"
		align="right" border="0"></a>
	<div id="e5" class="cc13">
		<a href="manageUsers.jsp"> Manage Users</a>
	</div>
	<a href="viewLogs.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[2],Img4,'cmput391_007.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[2],Img4,0,0)"> <img id="e4"
		name="e4" src="cmput391006003.jpg" title="" alt="cmput391006003.jpg"
		align="right" border="0"></a>
	<div id="e3" class="cc13">
		<a href="viewLogs.jsp"> View Logs</a>
	</div>
	<a href="adminSearch.jsp"
		onmouseover="OnWeOver(0,0,0,IDP[1],Img2,'cmput391_008.htm',1)"
		onmouseout="OnWeOver(0,0,0,IDP[1],Img2,0,0)"> <img id="e2"
		name="e2" src="cmput391006001.jpg" title="" alt="cmput391006001.jpg"
		align="right" border="0"></a>
	<div id="e1" class="cc13">
		<a href="adminSearch.jsp"> Search</a>
	</div>
</body>
</html>