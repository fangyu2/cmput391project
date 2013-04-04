<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page
	import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,java.util.*,oracle.sql.*,oracle.jdbc.*,java.awt.Image,java.awt.image.BufferedImage,javax.imageio.ImageIO,cmput391.*,org.apache.commons.fileupload.DiskFileUpload,org.apache.commons.fileupload.FileItem"%>

<%!private Record record;%>

<%!public void addImage(HttpServletRequest request,
			HttpServletResponse response, JspWriter out) {
		try {
			int recordID = record.getRecordID();
			int pic_id = record.getImgID();

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
			response.sendRedirect("upload.jsp");

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
				growImage.setRGB(x, y, image.getRGB(x / n, y / n));

		return growImage;
	}%>

<%
	record = (Record) request.getSession().getAttribute("record");
	if (record == null) {
		response.sendRedirect("addRecords.jsp");
	}
	addImage(request, response, out);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>