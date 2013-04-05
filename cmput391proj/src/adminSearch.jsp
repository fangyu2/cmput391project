<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title> AdminSearch </title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<meta http-equiv="Content-Style-Type" content="text/css;">
	<link rel="stylesheet" href="cmput391_g.css" type="text/css" media="screen,projection,print">	<!--// Document Style //-->
	<link rel="stylesheet" href="cmput391_008_p.css" type="text/css" media="screen,projection,print">	<!--// Page Style //-->
	<script src="cmput391_g.js" type="text/javascript"></script>		<!--// Document Script //-->
	<script src="cmput391_008_a.js" type="text/javascript"></script>		<!--// Motion Script //-->
</head>
<%@ page import="java.sql.*,cmput391.*,java.util.*,java.io.*,javax.servlet.*"%>
<%@ page import="javax.servlet.http.*,java.sql.*,oracle.jdbc.driver.*,java.text.*,java.net.*"%>
<%!   private User loggedUser;
private String uName = "";

public void search(HttpServletRequest request,
      HttpServletResponse response, JspWriter out){
   try {

      String search = (request.getParameter("search")).trim();
      String sql = "";   
      String dash = "-";
      String sort = request.getParameter("sort").trim();
      int dateSearch = request.getParameter("sdd").trim().compareTo(dash);
      String start_date = "";
      String end_date = "";
      String tempday = "";
      String tempyr = "";
      String tempmon = "";



      if (dateSearch != 0) {


         tempday = (request.getParameter("sdd")).trim();
         tempyr = (request.getParameter("sdy")).trim();
         tempmon = (request.getParameter("sdm")).trim();

         start_date = tempday.concat(dash).concat(tempmon).concat(dash)
               .concat(tempyr);

         tempday = (request.getParameter("edd")).trim();
         tempyr = (request.getParameter("edy")).trim();
         tempmon = (request.getParameter("edm")).trim();

         end_date = tempday.concat(dash).concat(tempmon).concat(dash)
               .concat(tempyr);
      }


      StringTokenizer queryTokens = new StringTokenizer(search);

      sql = sqlBuilder(dateSearch, sort, start_date, end_date, queryTokens, out);




      Statement stmt = null;
      ResultSet rset = null;

      stmt = UserConnection
            .getConnection()
            .getConn()
            .createStatement();
      rset = stmt.executeQuery(sql);

      try{
         int i = 12;
         for(int n = 0; n<i; n++){
            out.println("<BR>&nbsp;</BR>");
         }

         out.println("<table border=1 align=right >");

         /*
          *  to generate the column labels
          */

         String value = null;
         Object o = null;
         ResultSetMetaData rsetMetaData = rset.getMetaData();
         int columnCount = rsetMetaData.getColumnCount();

         String r_id;
         String i_id;
         Statement stmt2 = null;
    	 ResultSet rset2 = null;

      	 stmt2 = UserConnection
            .getConnection()
            .getConn()
            .createStatement();

         out.println("<tr valign = \"top\">");

         for ( int column = 1; column <= columnCount; column++) {
            if (column<columnCount){
            	value = rsetMetaData.getColumnLabel(column);
            	out.print("<td>" + value + "</td>");
            }
           else {
           	out.print("<td>Pictures</td>");
            }
         }
         out.println("</tr>");

         /*
          *   generate answers, one tuple at a time
          */
         while (rset.next() ) {

            out.println("<tr>");

            for ( int index = 1; index <= columnCount; index++) {
               o = rset.getObject(index);
               if (o != null )
                  value = o.toString();
               else
                  value = "null";
               if (index < columnCount) {  		
               		out.print("<td>" + value + "</td>");
               	}
             	else {
             		out.print("<td>"); 
             		
             		r_id = (rset.getObject(1)).toString();
             		sql = "select image_id from pacs_images where record_id = "+r_id;
             		rset2 = stmt2.executeQuery(sql);
             		
             		while (rset2.next() ) {
             			i_id = (rset2.getObject(1)).toString();
             			// specify the servlet for the image
           				out.print("<a href=\"GetOnePic?big"+i_id+"\">");
	      				// specify the servlet for the themernail
	       				out.print("<img src=\"GetOnePic?"+i_id +"\">");           		
             		
             		}            		
             		out.print("</td>");
             	}


            }
            out.println("</tr>");
         }

         out.println("</table>");
         
         stmt2.close();


      }
      catch (Exception ex) {
         System.out.println("" + ex.getMessage() + "");
      }

      stmt.close();
      UserConnection.getConnection().getConn().commit();
   } catch (Exception ex) {
      System.out.println("" + ex.getMessage() + "");
   }

}

public String sqlBuilder(int dateSearch, String sort, String s_date, String e_date, StringTokenizer query, JspWriter out) {

   String sql = "";
   
   try {    
      String search = "";
      String search2 = "";
      int tokenCount;

      tokenCount = query.countTokens();   
      if (query.hasMoreTokens()) {
         search = query.nextToken();
         if (tokenCount == 2) {
            search2 = query.nextToken();
         }
      }

      if (dateSearch == 0) {
         if (tokenCount == 1) {
            sql = "SELECT radiology_record.*, Score(1)*6 + Score(2)*3 + Score(3) as Score FROM radiology_record WHERE ((contains(patient_name, '"+search+"',1) > 0 OR contains(diagnosis, '"+search+"',2) > 0 OR contains(description, '"+search+"',3) > 0)) ORDER BY Score Desc"; 
         }

         if (tokenCount == 2) {
            sql = "SELECT radiology_record.*, Score(1)*6 + Score(2)*3 + Score(3) + Score(4)*6 + Score(5)*3 + Score(6) as Score FROM radiology_record WHERE ((contains(patient_name, '"+search+"',1) > 0 OR contains(diagnosis, '"+search+"',2) > 0 OR contains(description, '"+search+"',3) > 0 OR contains(patient_name, '"+search2+"',4) > 0 OR contains(diagnosis, '"+search2+"',5) > 0 OR contains(description, '"+search2+"',6) > 0)) ORDER BY Score Desc";
         }
      }
      else if (sort.compareTo("Ascending") == 0 && dateSearch != 0){
         if (tokenCount == 1) {
            sql = "SELECT radiology_record.*, Score(1)*6 + Score(2)*3 + Score(3) as Score FROM radiology_record WHERE ((contains(patient_name, '"+search+"',1) > 0 OR contains(diagnosis, '"+search+"',2) > 0 OR contains(description, '"+search+"',3) > 0) AND (test_date between to_date('"+s_date+"', 'DD-Mon-YY') and to_date('"+e_date+"', 'DD-Mon-YY'))) ORDER BY test_date ASC"; 
         }

         if (tokenCount == 2) {
            sql = "SELECT radiology_record.*, Score(1)*6 + Score(2)*3 + Score(3) + Score(4)*6 + Score(5)*3 + Score(6) as Score FROM radiology_record WHERE ((contains(patient_name, '"+search+"',1) > 0 OR contains(diagnosis, '"+search+"',2) > 0 OR contains(description, '"+search+"',3) > 0 OR contains(patient_name, '"+search2+"',4) > 0 OR contains(diagnosis, '"+search2+"',5) > 0 OR contains(description, '"+search2+"',6) > 0) AND (test_date between to_date('"+s_date+"', 'DD-Mon-YY') and to_date('"+e_date+"', 'DD-Mon-YY'))) ORDER BY test_date ASC";
         }
      }
      else if (sort.compareTo("Descending") == 0 && dateSearch != 0) {
         if (tokenCount == 1) {
            sql = "SELECT radiology_record.*, Score(1)*6 + Score(2)*3 + Score(3) as Score FROM radiology_record WHERE ((contains(patient_name, '"+search+"',1) > 0 OR contains(diagnosis, '"+search+"',2) > 0 OR contains(description, '"+search+"',3) > 0) AND (test_date between to_date('"+s_date+"', 'DD-Mon-YY') and to_date('"+e_date+"', 'DD-Mon-YY'))) ORDER BY test_date DESC"; 
         }

         if (tokenCount == 2) {
            sql = "SELECT radiology_record.*, Score(1)*6 + Score(2)*3 + Score(3) + Score(4)*6 + Score(5)*3 + Score(6) as Score FROM radiology_record WHERE ((contains(patient_name, '"+search+"',1) > 0 OR contains(diagnosis, '"+search+"',2) > 0 OR contains(description, '"+search+"',3) > 0 OR contains(patient_name, '"+search2+"',4) > 0 OR contains(diagnosis, '"+search2+"',5) > 0 OR contains(description, '"+search2+"',6) > 0) AND (test_date between to_date('"+s_date+"', 'DD-Mon-YY') and to_date('"+e_date+"', 'DD-Mon-YY'))) ORDER BY test_date DESC";

         }
      }
      else {
         out.println("You must both a start date, end date, and order in which to sort by.");
      }

   } catch (Exception ex) {
      System.out.println("" + ex.getMessage() + "");
   } 
   return sql;
}

%>

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
   uName = loggedUser.getUserName();
   if (request.getParameter("bSubmit") != null) {
      search(request, response, out);
   }
} catch (Exception ex) {
   System.out.println("" + ex.getMessage() + "");
}
%>

<body id="page" onload="if(IE||V5) OnWeLoad()">
<form method="post">
	<a href="adminUser.jsp" onmouseover="OnWeOver(0,0,0,IDP[6],Img24,'cmput391_004.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[6],Img24,0,0)">
		<img id="e24" name="e24" src="cmput391008011.jpg" title="" alt="cmput391008011.jpg" align="right" border="0"></a>
	<div id="e23" class="cc19">
		<a href="adminUser.jsp">
		Home</a>
	</div>
	<a href="adminEditProfile.jsp" onmouseover="OnWeOver(0,0,0,IDP[5],Img22,'cmput391_005.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[5],Img22,0,0)">
		<img id="e22" name="e22" src="cmput391008009.jpg" title="" alt="cmput391008009.jpg" align="right" border="0"></a>
	<div id="e21" class="cc19">
		<a href="adminEditProfile.jsp">
		Edit Profile</a>
	</div>
	<a href="Home.jsp" onmouseover="OnWeOver(0,0,0,IDP[4],Img20,'index.html',1)" onmouseout="OnWeOver(0,0,0,IDP[4],Img20,0,0)">
		<img id="e20" name="e20" src="cmput391008007.jpg" title="" alt="cmput391008007.jpg" align="right" border="0"></a>
	<div id="e19" class="cc19">
		<a href="Home.jsp">
		Logout</a>
	</div>
	<a href="manageUsers.jsp" onmouseover="OnWeOver(0,0,0,IDP[3],Img18,'cmput391_006.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[3],Img18,0,0)">
		<img id="e18" name="e18" src="cmput391008005.jpg" title="" alt="cmput391008005.jpg" align="right" border="0"></a>
	<div id="e17" class="cc19">
		<a href="manageUsers.jsp">
		Manage Users</a>
	</div>
	<a href="viewLogs.jsp" onmouseover="OnWeOver(0,0,0,IDP[2],Img16,'cmput391_007.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[2],Img16,0,0)">
		<img id="e16" name="e16" src="cmput391008003.jpg" title="" alt="cmput391008003.jpg" align="right" border="0"></a>
	<div id="e15" class="cc19">
		<a href="viewLogs.jsp">
		View Logs</a>
	</div>
	<a href="adminSearch.jsp" onmouseover="OnWeOver(0,0,0,IDP[1],Img14,'cmput391_008.htm',1)" onmouseout="OnWeOver(0,0,0,IDP[1],Img14,0,0)">
		<img id="e14" name="e14" src="cmput391008001.jpg" title="" alt="cmput391008001.jpg" align="right" border="0"></a>
	<div id="e13" class="cc19">
		<a href="adminSearch.jsp">
		Search</a>
	</div>
	<input id="e12" class="cc20" type="text" name="search" size="24">
	<input id="e11" class="cc21" type="submit" name="bSubmit" value="Submit">
	<div id="e10" class="cc22">
		Enter Search Term(s):
	</div>
	<div id="e9" class="cc23">
		From:
	</div>
	<select id="e8" class="cc21" size="1" name="sdd" title="Day">
		<option>-</option>
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
	<select id="e7" class="cc21" size="1" name="sdm" title="Month">
		<option>-</option>
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
	</select>
	<select id="e6" class="cc21" size="1" name="sdy" title="Year">
		<option>-</option>
		<option>00</option>
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
	</select>
	<div id="e5" class="cc23">
		To:
	</div>
	<select id="e4" class="cc21" size="1" name="edd" title="Day">
		<option>-</option>
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
	<select id="e3" class="cc21" size="1" name="edm" title="Month">
		<option>-</option>
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
	</select>
	<select id="e2" class="cc21" size="1" name="edy" title="Year">
		<option>-</option>
		<option>00</option>
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
	</select>
	<select id="e1" class="cc21" size="1" name="sort">
	<option>-</option>
	<option>Ascending</option>
	<option>Descending</option>
	</select>
</form>
</body>
</html>
