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
<style type="text/css">
body {
	background: #E9EBEE;;
}
</style>
</head>
<body>
<!--NAVBAR -->
		<jsp:include page="Navbar.jsp"></jsp:include>
		<!-- fine navbar -->
<%
		//Film film = (Film) request.getAttribute("1Film");
Film film = (Film) request.getSession().getAttribute("1Film");
	%>
	<div class="container-fluid"  style="margin-top:3%;margin-bottom:3%;margin-left:2%;margin-right:3%;">
	<div class="row">
	<div class="col-md-3">
	<img src="<%=film.getImg() %>" class="img-fluid"
								alt="<%=film.getImg() %>" style="height:24rem"><br><br>
								<div class="text-md-center">
	<button id="Bimg" type="button" >Modifica</button>
								</div>
	<div style="display:none" id="img">
					<form action="ModificaImg" method="post"
			enctype="multipart/form-data"">
						
						<input type="file" class="form-control-file border " name="img"
												placeholder="Immagine"> <input
							type="submit" value="Submit">
					</form>
				</div>
	</div>
		<div class="col-md-9">
		<h3><%=film.getNome() %></h3>
		<br><lead>Regista: </lead><b><%=film.getRegista() %></b>
		<button id="Bregista" type="button" >Modifica</button>
		<div style="display:none" id="regista">
					<form action="ModificaFilm" method="post">
						<input type="hidden" name="action" value="regista">
						<input type="text" class="form-control" name="dato"> 
						<input type="submit" value="Submit">
					</form>
				</div>
		<br><br><lead>Genere: </lead><b><%=film.getGenere() %></b>
		<button id="Bgenere" type="button" >Modifica</button>
		<div style="display:none" id="genere">
					<form action="ModificaFilm" method="post">
						<input type="hidden" name="action" value="genere">
						<input type="text" class="form-control" name="dato"> 
						<input type="submit" value="Submit">
					</form>
				</div>
		<br><br><lead>Attori: </lead><b><%=film.getAttori() %></b>
		<button id="Battori" type="button" >Modifica</button>
		<div style="display:none" id="attori">
					<form action="ModificaFilm" method="post">
						<input type="hidden" name="action" value="attori">
						<input type="text" class="form-control" name="dato"> 
						<input type="submit" value="Submit">
					</form>
				</div>
		<br><br><lead>Descrizione: </lead><b><%=film.getDescrizione() %></b>
		<button id="Bdescrizione" type="button" >Modifica</button>
		<div style="display:none" id="descrizione">
					<form action="ModificaFilm" method="post">
						<input type="hidden" name="action" value="descrizione">
						<input type="text" class="form-control" name="dato"> 
						<input type="submit" value="Submit">
					</form>
				</div>		
		<br><br><lead>Anno: </lead><b><%=film.getAnno() %></b>
		<button id="Banno" type="button" >Modifica</button>
		<div style="display:none" id="anno">
					<form action="ModificaFilm" method="post">
						<input type="hidden" name="action" value="anno">
						<input type="text" class="form-control" name="dato"> 
						<input type="submit" value="Submit">
					</form>
				</div>
		<br><br><lead>Prezzo: </lead><b><%=film.getPrezzo() %></b>
		<button id="Bprezzo" type="button" >Modifica</button>
		<div style="display:none" id="prezzo">
					<form action="ModificaFilm" method="post">
						<input type="hidden" name="action" value="prezzo">
						<input type="text" class="form-control" name="dato"> 
						<input type="submit" value="Submit">
					</form>
				</div>
		</div>
	</div>

	
	</div>

	
		<!-- include footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
<script >
		//script per form nascosta
		$(document).ready(function() {
			$("#Bimg").click(function() {
				$("#img").toggle();
			});
			$("#Bregista").click(function() {
				$("#regista").toggle();
			});
			$("#Bgenere").click(function() {
				$("#genere").toggle();
			});
			$("#Battori").click(function() {
				$("#attori").toggle();
			});
			$("#Bdescrizione").click(function() {
				$("#descrizione").toggle();
			});
			$("#Banno").click(function() {
				$("#anno").toggle();
			});
			$("#Bprezzo").click(function() {
				$("#prezzo").toggle();
			});
			
		});
	</script>
		</script>
</body>
</html>