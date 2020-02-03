
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@page import="model.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>

<style>
body {
	background: #E9EBEE;;
}
</style>
</head>
<body>
	<%
		ArrayList<Film> filmgenere = (ArrayList<Film>) request.getAttribute("AllFilmGenere");
	%>
	<!--NAVBAR -->
	<jsp:include page="Navbar.jsp"></jsp:include>
	<!-- fine navbar -->
	<div class="tab-content">

		<div class="container">

			<div class="row">
				<%
					for (Film film : filmgenere) {
				%>
				<div class="col-sm col-md-4 col-lg-3 d-flex align-items-stretch"
					style="padding-top: 20px; padding-bottom: 20px;">
					<div class="card" style="width: 13rem;">
						<a href="InfoFilm?nome=<%=film.getNome() %>"><img src="<%=film.getImg()%>" class="card-img-top img-fluid"
							alt="<%=film.getImg()%>" style="height: 20rem"></a>
						<div class="card-body">
							<div style="height: 5rem;">
								<h5 class="card-title"><%=film.getNome()%></h5>
								<small class="text-muted"><p class="card-text"><%=film.getGenere()%></p></small>

							</div>
							<p class="lead card-text text-right"><%=film.getPrezzo()%></p>

							<span> <a href="InfoFilm?nome=<%=film.getNome() %>" class="btn btn-primary pull-right">Acquista</a>
							</span>
						</div>
					</div>
				</div>

				<%
					}
				%>
			</div>
		</div>


	</div>
	
	<script type="text/javascript" src="js/checkDayNight.js"></script>
	
	<!-- include footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>

