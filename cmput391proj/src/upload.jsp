<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<%@ page import="cmput391.*" %>
<%
	Record record = (Record) request.getSession().getAttribute("record");
	if(record == null) {
		response.sendRedirect("addRecords.jsp");
	}%>
<head>
<title>Upload image</title>
</head>
<body>

	<h4>Click Submit To Upload A Picture and Return to return to add records</h4>
	<p>
	<hr>
	Please input or select the path of the image!
	<form name="upload-image" method="POST" enctype="multipart/form-data"
		action="parseImage.jsp">
		<table>
			<tr>
				<th>File path:</th>
				<td><input name="file-path" type="file" size="30"></input></td>
			</tr>
			<tr>
				<td ALIGN=CENTER COLSPAN="2"><input type="submit"
					name=".submit" value="Upload"></td>
			</tr>
			<tr>
				<td ALIGN=CENTER COLSPAN="2"><input type="button"
					 value="Return" onclick="location.href='addRecords.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>