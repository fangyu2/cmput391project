<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Upload image</title>
</head>
<body>

	<h4>Click Submit To Upload A Picture and Finish To Go Back</h4>
	<p>
	<hr>
	Please input or select the path of the image!
	<form name="upload-image" method="POST" enctype="multipart/form-data"
		action="parsePicture.jsp">
		<table>
			<tr>
				<th>File path:</th>
				<td><input name="file-path" type="file" size="30"></input></td>
			</tr>
			<tr>
				<td ALIGN=CENTER COLSPAN="2"><input type="submit"
					name="rsubmit" value="Upload"></td>
			</tr>
		</table>
	</form>
</body>
</html>