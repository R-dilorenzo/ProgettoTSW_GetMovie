<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%@page import="model.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>

<title>Insert title here</title>
<style type="text/css">
html {
	background: url(img/inf.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	font-family: sans-serif;
}

.wrapper {
	position: relative;
}

.box {
	position: absolute;
	top: 350px;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	padding: 40px;
	background: rgba(0, 0, 0, .8);
	box-sizing: border-box;
	box-shadow: 0 15px 25px rgba(0, 0, 0, .5);
	border-radius: 10px;
}

.box h2 {
	margin: 0 0 30px;
	padding: 0;
	color: #fff;
	text-align: center;
}

.box .inputBox {
	position: relative;
}

.box .inputBox input {
	width: 100%;
	padding: 10px 0;
	font-size: 16px;
	color: #fff;
	letter-spacing: 1px;
	margin-bottom: 30px;
	border: none;
	border-bottom: 1px solid #fff;
	ouline: none;
	background: transparent;
}

.box .inputBox label {
	position: absolute;
	top: 0;
	left: 0;
	padding: 10px 0;
	font-size: 16px;
	color: #fff;
	pointer-events: none;
	transition: .5s;
}

.box .inputBox input:focus ~ label, .box .inputBox input:valid ~ label {
	top: -18px;
	left: 0;
	color: #03a9f4;
	font-size: 12px;
}

.box input[type="submit"] {
	background: transparent;
	border: none;
	outline: none;
	color: #fff;
	background: #03a9f4;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 5px;
}

/* breakpoint  sm-bootstrap */
@media ( max-width : 575.98px) {

}
</style>
</head>
<body>

	<!--NAVBAR -->
	<jsp:include page="Navbar.jsp"></jsp:include>
	<!-- fine navbar -->
	
	<div class="wrapper">

		<div class="box">
			<h2>Registrazione</h2>
			<form action="Registrazione" method="post" name="registrazione" onSubmit="return validateForm(this);">
				<div class="inputBox">
					<input type="text" name="nome" required> <label>Nome</label>
				</div>
				<div class="inputBox">
					<input type="text" name="cognome" required> <label>Cognome</label>
				</div>
				<div class="inputBox">
					<input type="text" name="email" required> <label>Email</label>
				</div>
				<div class="inputBox">
					<input type="text" name="usr" required>
					<label>Username</label>
				</div>
				<div class="inputBox">
					<input type="password" name="psw" required> <label>Password</label>
				</div>
				<input type="submit" name="" value="Registrati">
			</form>
			<br>
			<div id="err" style="color:red"></div>
			
			<br> <span style="color: white">Hai già un account? </span><a
				href="Login.jsp" style="color: #03a9f4">clicca qui</a><br>
			<br> <a href="LoginAdmin.jsp" style="color: #03a9f4">Login
				Admin</a>
		</div>

	</div>
	
	<!-- Validation -->
<script type="text/javascript" src="js/Valid/pattern.js"></script>
<script type="text/javascript" src="js/Valid/form/RegistrationVal.js"></script>
	<!-- End Validation -->
</body>
</html>