<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<body>
	<h2>Result</h2>
	<hr>
	<img width="100px" height="100px" src="${path}" />
	<br>
	<a href="${path}" target="_blank">Click here</a> if you can not see
	your photo.
	<br>
	<br> Congratulations, ${answer.name}!
	<br>You scored ${answer.checkResult()}/4.
	<br>
	<br>
	<button onclick="goBack()">Try again</button>

	<script>
		function goBack() {
			window.history.back();
		}
	</script>
	
</body>
</html>