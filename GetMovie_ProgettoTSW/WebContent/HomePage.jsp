
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@page import="model.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="css/DayNightSwitch.css">

<style>
.page{
	max-width: 1920px;
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>
	<div class="page">
		<!--NAVBAR -->
		<jsp:include page="Navbar.jsp"></jsp:include>
		<!-- fine navbar -->
		
		<!-- BODY -->
		<jsp:include page="Body.jsp"></jsp:include>
		<!-- fine body -->
		
		<!-- include footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
		
	</div>

</body>
</html>