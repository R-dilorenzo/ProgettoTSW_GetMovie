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
<style>
/* per eliminare il punto (bullet) vicino al dropdown a destra <li> */
#bullet {
	float: left;
	list-style-type: none;
}
</style>
</head>
<body>
<!-- Jumbotron per logo  -->
	<div class="jumbotron jumbotron-fluid"
		style="background: #6c757d; margin-bottom: 0px">
		<img alt="logo" src="img/img.png" style="heigth:50px;width:250px;margin-left:40%">
		</div>
		
	<!-- NAVBAR con Bootstrap  collapse-->
	<nav class=" navbar navbar-expand-sm navbar-toggleable-sm"
		style="background: #284b6e;">
		<div class="container">
			<!-- per schermi di dimensione piccola (576px) la navbar viene ridotta a icona -->
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#mainNav">
				<span class="navbar-toggler-icon"> <i
					class="fas fa-align-justify text-white align-middle"></i>
				</span>
			</button>
			<div class="collapse navbar-collapse" id="mainNav">
				<div class="navbar-nav nav-pills">
					<a class="nav-link  text-white" href="HomePage.jsp" id="tab">Home</a>
					<%
					String path = ((HttpServletRequest) request).getRequestURI();
				     if (path.endsWith("/HomePage.jsp")) { %>
					<a class="nav-link  text-white" href="#Film" id="tab"> Film</a>
					<%}else{ %>
						<a class="nav-link  text-white" href="HomePage.jsp" id="tab"> Film</a>
					<%} %>
						<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-white" data-toggle="dropdown"
						href="#" role="button" aria-haspopup="true" aria-expanded="false">Generi</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="ReturnGenere?genere=azione">Azione</a>
							<a class="dropdown-item" href="ReturnGenere?genere=drammatico">Drammatico</a>
							<a class="dropdown-item" href="ReturnGenere?genere=animazione">Animazione</a>
							<a class="dropdown-item" href="ReturnGenere?genere=commedia">Commedia</a>
							<a class="dropdown-item" href="ReturnGenere?genere=fantascienza">Fantascienza</a>
							<a class="dropdown-item" href="ReturnGenere?genere=thriller">Thriller</a>
							<a class="dropdown-item" href="ReturnGenere?genere=horror">Horror</a>
							<div class="dropdown-divider"></div>
						<%
				     if (path.endsWith("/HomePage.jsp")) { %>
					<a class="nav-link  text-white" href="#Film" id="tab"> Film</a>
					<%}else{ %>
						<a class="nav-link  text-white" href="HomePage.jsp" id="tab"> Film</a>
					<%} %>
						</div></li> 
					<%
				     if (path.endsWith("/Login.jsp") || path.endsWith("/Registrazione.jsp")) {}else{ %>
				 <a class="nav-link  text-white" href="#contatti" id="tab">
						Contatti</a>
					<% } %>
				</div>
				<%
					if (session.getAttribute("Utente") == null && session.getAttribute("Admin") == null) {
				%>
				<div class="collapse justify-content-end navbar-collapse"
					id="mainNav">
					<a class="nav-link  text-white" href="Registrazione.jsp" id="tab">
						Registrazione</a> <a class="nav-link  text-white" href="Login.jsp"
						id="tab"> Login</a>
				</div>
				<%
					} else {
						if (request.getSession().getAttribute("Utente") != null) {
							Utente utente = (Utente) request.getSession().getAttribute("Utente");
				%>
				<div class="collapse justify-content-end navbar-collapse"
					id="mainNav">
					<li id="bullet" class="dropdown"><a
						class="nav-link dropdown-toggle text-white" data-toggle="dropdown"
						href="#" role="button" aria-haspopup="true" aria-expanded="false"><%=utente.getUsr()%></a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="AccountPage.jsp">Account</a> <a
								class="dropdown-item" href="CarrelloUtente.jsp">Carrello</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="Logout">Logout</a>
						</div></li>
				</div>
				<%
					} else if (request.getSession().getAttribute("Admin") != null) {
							Admin admin = (Admin) request.getSession().getAttribute("Admin");
				%>
				<div class="collapse justify-content-end navbar-collapse"
					id="mainNav">
					
					<a class="nav-link  text-white" href="AdminPage.jsp" id="tab"> AdminPage</a>
					<a class="nav-link  text-white" href="Logout" id="tab"> Logout</a>
				</div>
				<%
					}
					}
				%>
			</div>
		</div>
	</nav>
</body>
</html>