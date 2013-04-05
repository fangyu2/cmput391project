import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import oracle.jdbc.driver.*;
import java.text.*;
import java.net.*;
import cmput391.*;

/**
 *  We are using this servlet, with most of the code remaining from the original
 *  example. All we have changed is how the connection is dealt with, and the
 *  sql commands and tables used to retrieve the proper information required
 *  for the system to function. All credit goes to Li-Yan Yuan.
 *  
 *  All credit goes to Li-Yan Yuan.
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
 *    GetOnePic?big12: sends the picture in image  with photo_id = 12
 *
 *  @author  Li-Yan Yuan
 *
 */
public class GetOnePic extends HttpServlet 
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
      
      //query to return the full_size image to the user
      if ( picid.startsWith("big") )  
         query = 
         "select full_size from pacs_images where image_id=" + picid.substring(3);
      else
         query = "select thumbnail from pacs_images where image_id=" + picid;

      ServletOutputStream out = response.getOutputStream();

      /*
       *   to execute the given query
       */
      try {
         //opens the connection for use
         Statement stmt = null;
         ResultSet rset = null;

         stmt = UserConnection.getConnection().getConn().createStatement();
         rset = stmt.executeQuery(query);

         if ( rset.next() ) {
            response.setContentType("image/jpg");
            InputStream input = rset.getBinaryStream(1);	    
            int imageByte;
            while((imageByte = input.read()) != -1) {
               out.write(imageByte);
            }
            input.close();
         } 
         else 
            out.println("no picture available");
         //closes the connection before exiting the servlet
         stmt.close();
      } catch( Exception ex ) {
         out.println(ex.getMessage() );
      }

   }

}

