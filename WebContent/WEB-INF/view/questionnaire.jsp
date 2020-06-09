<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">
	var myVar = setInterval(function() {
		myTimer()
	}, 1000);
	var counter = 0;
	function myTimer() {
		var date = new Date();
		document.getElementById("clock").innerHTML = new Date();
	}
	
</script>
<title>Questionnaire</title>
</head>
<body>
	<h2>Computer Science Questionnaire</h2>
	<p>

		<i>[Server time: <span id="clock"></span>]
		</i>
	</p>
	<hr>
	<form:form method="POST" action="result" modelAttribute="answer"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>Your name (*):</td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" cssClass="error" /></td>

			</tr>
			<tr>
				<td>Your pet's name (optional):</td>
				<td><form:input path="petName" /></td>
			</tr>
			<tr>
				<td>Upload your photo (for no reason):</td>
				<td><input type="file" name="file"></td>
			</tr>
		</table>


		<br>
		<hr>
		<br>
		<b>Question 1:</b> Provide a correct explanation of SOAP
 (choose one) <span id="answer1"></span>
		<br>

		<form:radiobutton path="userAnswer[0]" value="1a" /> Specified Object Access Provider
		<br>
		<form:radiobutton path="userAnswer[0]" value="1b" /> Simple Object Action Provider
		<br>
		<form:radiobutton path="userAnswer[0]" value="1c" /> Simple Object Access Protocol
		<br>
		<form:radiobutton path="userAnswer[0]" value="1d" /> Specified Object Access Protocol
		<br>
		<br>
		<b>Question 2:</b> Web services can be discovered using 
		<form:select path="userAnswer[1]"> 
			<form:option value=" " label=" " />
			<form:option value="2a" label="UDDII" />
			<form:option value="2b" label="UDDI" />
			<form:option value="2c" label="UDDDI" />
			<form:option value="2d" label="UDII" />
		</form:select> <span id="answer2"></span>
		<br>
		<br>
		<b>Question 3:</b> We use <i><form:input path="userAnswer[2]" />
			messaging system </i> with SOAP web services. <span id="answer3"></span>
		<br>
		<br>


		<b>Question 4:</b> The basic Web Services platform is combination of: (choose many) <span id="answer4"></span>
		<br>
		<form:checkbox path="userAnswer[3]" value="4a"/> CSS
		<br>
		<form:checkbox path="userAnswer[3]" value="4b"/> XML
		<br>
		<form:checkbox path="userAnswer[3]" value="4c"/> HTML
		<br>
		<form:checkbox path="userAnswer[3]" value="4d"/> HTTP


		<br>
		<br>
		<script type="text/javascript">
		function showAnswers(){
		document.getElementById("answer1").innerHTML = "[Simple Object Access Protocol]";
		document.getElementById("answer2").innerHTML = "[UDDI]"
			document.getElementById("answer3").innerHTML = "[XML]"
				document.getElementById("answer4").innerHTML = "[XML+HTTP]"
		}
		</script>
		<button type="button" onclick="showAnswers()">Show answers</button>
		<input type="submit" value="Check score" />
	</form:form>




</body>
</html>