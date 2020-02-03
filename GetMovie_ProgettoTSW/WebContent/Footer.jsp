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
<link rel="stylesheet" href="css/goToTop.css">
<style>

</style>
</head>
<body>
	<footer>
	<a onclick="topFunction()" id="myBtn" title="Go to top"> <i class="fas fa-arrow-up"></i> </a>
	
		<div class="jumbotron jumbotron-fluid"
			style="background: #6c757d; margin-bottom: 0px">
			<div class="tab-content">
				<div class="tab-pane active" id="contatti">
					<div class="row">
						<div class="col-sm-5">
							<div class="container ml-4">
								2019 <b> GetMovie.com </b>
								<p>Puoi contattarci attraverso i nostri social:</p>
								<!-- target="_blank" apre in una nuova finestra -->
								<a href="SocialPage.jsp" target="_blank" class="fa fa-facebook"></a>
								<a href="SocialPage.jsp" target="_blank" class="fa fa-twitter"></a>
								<a href="SocialPage.jsp" target="_blank" class="fa fa-instagram"></a>
								<br>
								<p>Per ulteriori problemi puoi utilizzare il form seguente:</p>
							</div>
						</div>

						<div class="col-sm-7">
							<div class="container mr-5">
							
									<div class="form-group row">
										<label for="email" class="col-md-4 col-form-label text-md-right"><b>Email:</b></label>
										<div class="col-md-8">
											<div id="emailErr" style="color:red"></div>
											<input type="email" class="form-control" id="email"
												placeholder="Indirizzo email">
										</div>
									</div>
									<div class="form-group row">
										<label for="oggetto" class="col-md-4 col-form-label text-md-right"><b>Oggetto:</b></label>
										<div class="col-md-8">
											<input type="text" class="form-control" id="oggetto"
												placeholder="tipologia di problema">
										</div>
									</div>
									<div class="form-group row">
										<label for="descrizione" class="col-md-4 col-form-label text-md-right"><b>Descrizione:</b></label>
										<div class="col-md-8">
											<textarea class="form-control" id="descrizione" rows="2"
												placeholder="descrizione del problema..."></textarea>
										</div>
									</div>
									<div class="text-center">
										<button onclick="contact()" type="submit" class="btn btn-primary">Submit</button>
									</div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript" src="js/Valid/pattern.js"></script>
	
<script>
// When the user scrolls down 50px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 60 || document.documentElement.scrollTop > 60) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}

function contact(){
	email= document.getElementById("email").value
	if (!email.match(validateEmail())){
		
		document.getElementById("emailErr").innerHTML="formato non corretto"
		return false;
	}

	else{
	document.getElementById("emailErr").innerHTML=""
	oggetto= document.getElementById("oggetto").value
	descrizione= document.getElementById("descrizione").value
	if(email != "" && oggetto != "" && descrizione != "" ){
		alert("Grazie per averci contattato!\nRiceverà una risposta a "+email)
	}
	else{
		alert("Uno dei campi è vuoto")
	}

	}
	return true;
}
</script>
</body>
</html>