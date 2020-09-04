<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%@page import="model.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!--per i social-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/SocialButtonCSS.css">

<title>Insert title here</title>
<style type="text/css">
html {
	font-family: sans-serif;
		max-width: 1920px;
    margin-left: auto;
    margin-right: auto;
}

.wrapper {
	position: relative;
	background: url(img/inf.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
		width: 100%;
	height: 500px;
}

.box {
	position: absolute;
	top: 240px;
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
<h2>Login ADMIN</h2>
<form action="LoginAdmin" method="post">
<div class="inputBox">
<input type="text" name="usr" required="">
<label>Username</label>
</div>
<div class="inputBox">
<input type="password" name="psw" required="">
<label>Password</label>
</div>
<input type="submit" name="" value="Login">
</form><br><br>
<span style="color:white">Non sei registrato? </span><a href="Registrazione.jsp" style="color:#03a9f4">clicca qui</a><br><br>
<a href="Login.jsp" style="color:#03a9f4">Login Utente</a>
</div>
</div>
</div>
</body>
</html>