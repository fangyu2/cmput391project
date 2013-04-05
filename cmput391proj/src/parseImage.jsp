<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page
	import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,java.util.*,oracle.sql.*,oracle.jdbc.*,java.awt.Image,java.awt.image.BufferedImage,javax.imageio.ImageIO,cmput391.*,org.apache.commons.fileupload.DiskFileUpload,org.apache.commons.fileupload.FileItem"%>

<%!private Record record;
private int pic_id;%>

<%!
//get the highest image_id currently in database then assign it as the new
//picture id after incremeting it by 1
public void getPicID() {
	try {
		
		pic_id = 1; // assign pic_id as 1 if the database is unpopulated
		
		String sql = "select image_id from pacs_images order by image_id desc";
		Statement stmt = null;
		ResultSet rset = null;

		stmt = UserConnection.getConnection().getConn().createStatement(
				ResultSet.TYPE_SCROLL_INSENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
		rset = stmt.executeQuery(sql);
		
		if(rset.first()){
			pic_id = rset.getInt(1);
			pic_id++;
		}
		stmt.close();	
	
	} catch (Exception ex) {
	}
}
//stores the images into sql table as thumbnails, regular sized and fullsized
public void addImage(HttpServletRequest request,
			HttpServletResponse response, JspWriter out) {
		try {
			int recordID = record.getRecordID();

			DiskFileUpload fu = new DiskFileUpload();
			List FileItems = fu.parseRequest(request);

			// Process the uploaded items, assuming only 1 image file uploaded
			Iterator i = FileItems.iterator();
			FileItem item = (FileItem) i.next();
			while (i.hasNext() && item.isFormField()) {
				item = (FileItem) i.next();
			}

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

			sql = "SELECT * FROM pacs_images WHERE image_id = " + pic_id
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

			outstream.close();

			//Write the image to the blob object
			OutputStream outstream2 = myblob2.getBinaryOutputStream();
			ImageIO.write(img, "jpg", outstream2);

			outstream2.close();

			//Write the image to the blob object
			OutputStream outstream3 = myblob3.getBinaryOutputStream();
			ImageIO.write(largeimg, "jpg", outstream3);

			instream.close();
			outstream3.close();

			stmt.close();
			UserConnection.getConnection().getConn().commit();
			request.getSession().setAttribute("record", record);
			response.sendRedirect("upload.jsp");

		} catch (Exception ex) {
			try{
				out.println("<body onLoad=\"setTimeout(\'delayer()\',5000)\">");
				out.println("<center><b> Either Images too big or Out of SQL"
						+ "</b></center></body>");
			}
			catch(Exception ex2){}

		}
	}
	//shrinks the given buffered image by factor of n
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
	// grows the given buffered image by n times
	public static BufferedImage grow(BufferedImage image, int n) {

		int w = image.getWidth() * n;
		int h = image.getHeight() * n;

		BufferedImage growImage = new BufferedImage(w, h, image.getType());

		for (int y = 0; y < h; ++y)
			for (int x = 0; x < w; ++x)
				growImage.setRGB(x, y, image.getRGB(x / n, y / n));

		return growImage;
	}%>

<%
	//checks whether a record is in the given session, if not then
	//return to the addRecords page
	record = (Record) request.getSession().getAttribute("record");
	if (record == null) {
		response.sendRedirect("addRecords.jsp");
	}
	getPicID();
	addImage(request, response, out);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
</html>