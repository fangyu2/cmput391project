import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.text.*;
import java.net.*;
import cmput391.*;

/** This servlet is mostly the same as the provided example, except  
 * 
 * 
 *  This servlet sends one picture stored in the table below to the client 
 *  who requested the servlet.
 *
 *   picture( photo_id: integer, title: varchar, place: varchar, 
 *            sm_image: blob,   image: blob )
 *
 *  The request must come with a query string as follows:
 *    GetOnePic?12:        sends the picture in sm_image with photo_id = 12
 *    GetOnePicture?big12: sends the picture in image  with photo_id = 12
 *
 *  @author  Li-Yan Yuan
 *
 */
public class GetBigPic extends HttpServlet 
implements SingleThreadModel {

   /**
    *    This method first gets the query string indicating PHOTO_ID,
    *    and then executes the query 
    *          select image from yuan.photos where photo_id = PHOTO_ID   
    *    Finally, it sends the picture to the client
    */

   public void doGet(HttpServletRequest request,
         HttpServletResponse response)
               throws ServletException, IOException {

      //  construct the query  from the client's QueryString
      String picid  = request.getQueryString();
      String query;

      query = "select record_id, full_size from pacs_images where image_id="
            + picid.substring(3);

      //ServletOutputStream out = response.getOutputStream();
      PrintWriter out = response.getWriter();

      /*
       *   to execute the given query
       */
      //Connection conn = null;
      try {
         //conn = getConnected();
         //Statement stmt = conn.createStatement();
         //ResultSet rset = stmt.executeQuery(query);
         Statement stmt = null;
         ResultSet rset = null;

         stmt = UserConnection.getConnection().getConn().createStatement();
         rset = stmt.executeQuery(query);

         response.setContentType("text/html");
         String title, place;

         if ( rset.next() ) {
            title = "Picture";
            place = "RIS System";
            out.println("<html><head><title>"+title+ "</title>+</head>" +
                  "<body bgcolor=\"#000000\" text=\"#cccccc\">" +
                  "<center><img src = \"/GetOnePic?"+picid+"\">" +
                  "<h3>" + title +"  at " + place + " </h3>" +
                  "</body></html>");
         }
         else
            out.println("<html> Pictures are not avialable</html>");
         stmt.close();
      } catch( Exception ex ) {
         out.println(ex.getMessage() );
      }
      // to close the connection

   }


}

