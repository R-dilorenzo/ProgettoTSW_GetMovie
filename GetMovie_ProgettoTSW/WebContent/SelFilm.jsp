<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@page import="model.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	background: #E9EBEE;;
}
</style>
</head>
<body>
<%
Film film = (Film) request.getSession().getAttribute("InfoFilm");
Voti voto = (Voti) request.getSession().getAttribute("votoFilm");
	%>
	<!--NAVBAR -->
		<jsp:include page="Navbar.jsp"></jsp:include>
		<!-- fine navbar -->
		<div class="container-fluid"  style="margin-top:3%;margin-bottom:3%;margin-left:2%;margin-right:3%;">
	<div class="row">
	<div class="col-md-3">
	<img src="<%=film.getImg() %>" class="img-fluid"
								alt="<%=film.getImg() %>" style="height:24rem"><br><br>
	</div>
		<div class="col-md-9">
		<h3><%=film.getNome() %></h3>
		<br><lead>Regista: </lead><b><%=film.getRegista() %></b>
		<br><lead>Genere: </lead><b><%=film.getGenere() %></b>
		<br><lead>Attori: </lead><b><%=film.getAttori() %></b>
	    <br><lead>Descrizione: </lead><b><%=film.getDescrizione() %></b>
		<br><lead>Anno: </lead><b><%=film.getAnno() %></b>
		<br><lead>Prezzo: </lead><b><%String res=String.format("%.2f",film.getPrezzo());%><%=res%></b>
		<!--  
		<br><lead>Voti: </lead><b><%//if(voto.getNomeFilm()==null){ %>ancora nessun voto è stato inserito <%//}else{%>sono inseriti<%//} %></b>
		-->
		<div class="text-center">
		<form action="AddToCart" method="post">	<button href="#" class="btn btn-primary">Add to cart
							<i class="fa fa-shopping-cart"></i>
							</button></form>
		</div>
		</div>
	</div>

	
	</div>

	
		<!-- include footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
		
		
		<script type="text/javascript" src="js/checkDayNight.js"></script>
</body>
</html>