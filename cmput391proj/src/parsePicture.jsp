<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java"
	import="cmput391.*,java.io.*, java.sql.*, java.util.*"%>
<%! private int recordID; %>



<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>

<%
 File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            out.println("Uploaded Filename: " + filePath + 
            fileName + "<br>");
            }
         }
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
}
%>

<%!
	public void addImg(FileItem item) {

		try {

			int pic_id = recordID + 1;

			//Get the image stream
			InputStream instream = item.getInputStream();

			BufferedImage img = ImageIO.read(instream);
			BufferedImage thumbNail = shrink(img, 10);
			BufferedImage largeimg = grow(img, 2);

			ResultSet rset = null;
			Statement stmt = null;

			String sql = "INSERT INTO pacs_images VALUES(" + recordID + ", "
					+ pic_id + ",empty_blob(),empty_blob(),empty_blob())";

			stmt = UserConnection.getConnection().getConn().createStatement();
			stmt.executeQuery(sql);

			sql = "SELECT * FROM pacs_images WHERE pic_id = " + pic_id
					+ " FOR UPDATE";
			rset = null;
			rset = stmt.executeQuery(sql);
			rset.next();
			BLOB myblob = ((OracleResultSet) rset).getBLOB(3);
			BLOB myblob2 = ((OracleResultSet) rset).getBLOB(4);
			BLOB myblob3 = ((OracleResultSet) rset).getBLOB(5);

			//Write the image to the blob object
			OutputStream outstream = myblob.getBinaryOutputStream();
			ImageIO.write(thumbNail, "jpg", outstream);

			int size = myblob.getBufferSize();
			byte[] buffer = new byte[size];
			int length = -1;
			while ((length = instream.read(buffer)) != -1)
				outstream.write(buffer, 0, length);

			outstream.close();

			//Write the image to the blob object
			OutputStream outstream2 = myblob2.getBinaryOutputStream();
			ImageIO.write(img, "jpg", outstream2);

			int size2 = myblob2.getBufferSize();
			byte[] buffer2 = new byte[size2];
			int length2 = -1;
			while ((length2 = instream.read(buffer2)) != -1)
				outstream2.write(buffer2, 0, length2);

			outstream2.close();

			//Write the image to the blob object
			OutputStream outstream3 = myblob3.getBinaryOutputStream();
			ImageIO.write(largeimg, "jpg", outstream3);

			int size3 = myblob3.getBufferSize();
			byte[] buffer3 = new byte[size3];
			int length3 = -1;
			while ((length = instream.read(buffer3)) != -1)
				outstream3.write(buffer3, 0, length3);

			instream.close();
			outstream3.close();

			stmt.close();
			UserConnection.getConnection().getConn().commit();

		} catch (Exception ex) {
			System.out.println(ex.getMessage());

		}

	}

	public static BufferedImage shrink(BufferedImage image, int n) {

		int w = image.getWidth() / n;
		int h = image.getHeight() / n;

		BufferedImage shrunkImage = new BufferedImage(w, h, image.getType());

		for (int y = 0; y < h; ++y) {
			for (int x = 0; x < w; ++x)
				shrunkImage.setRGB(x, y, image.getRGB(x * n, y * n));
		}
		return shrunkImage;
	}

	public static BufferedImage grow(BufferedImage image, int n) {

		int w = image.getWidth() * n;
		int h = image.getHeight() * n;

		BufferedImage growImage = new BufferedImage(w, h, image.getType());

		for (int y = 0; y < h; ++y)
			for (int x = 0; x < w; ++x)
				growImage.setRGB(x, y, image.getRGB(x * n, y * n));

		return growImage;
	}%>%>
<%

 recordID = (int) request.getSession().getAttribute("recordID");
  //Initialization for chunk management.
  boolean bLastChunk = false;
  int numChunk = 0;

  response.setContentType("text/plain");
  try{
    // Get URL Parameters.
    Enumeration paraNames = request.getParameterNames();
    out.println(" ------------------------------ ");
    String pname;
    String pvalue;
    while (paraNames.hasMoreElements()) {
      pname = (String)paraNames.nextElement();
      pvalue = request.getParameter(pname);
      out.println(pname + " = " + pvalue);
      if (pname.equals("jufinal")) {
      	bLastChunk = pvalue.equals("1");
      } else if (pname.equals("jupart")) {
      	numChunk = Integer.parseInt(pvalue);
      }
    }
    out.println(" ------------------------------ ");

    int ourMaxMemorySize  = 10000000;
    int ourMaxRequestSize = 2000000000;

	///////////////////////////////////////////////////////////////////////////////////////////////////////
	//The code below is directly taken from the jakarta fileupload common classes
	//All informations, and download, available here : http://jakarta.apache.org/commons/fileupload/
	///////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Create a factory for disk-based file items
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	// Set factory constraints
	factory.setSizeThreshold(ourMaxMemorySize);
	
	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	// Set overall request size constraint
	upload.setSizeMax(ourMaxRequestSize);
	
	// Parse the request
	List<FileItem>items = upload.parseRequest(request);
	// Process the uploaded items
	Iterator iter = items.iterator();
	FileItem fileItem;
    File fout;
	while (iter.hasNext()) {
	    fileItem = (FileItem) iter.next();
	
	    if (fileItem.isFormField()) {
	    } else {
	        addImg(fileItem);
	        
	        fileItem.delete();
	    }
	    out.println("SUCCESS");
	}//while
  }catch(Exception e){
    out.println("Exception e = " + e.toString());
  }
  
  out.close();
%>
