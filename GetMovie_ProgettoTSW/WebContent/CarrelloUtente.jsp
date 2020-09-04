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
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>

<script type="text/javascript">
	function prezzo() {
		var x = document.querySelectorAll('input[name=price]');
		var text = 0;
		var i;
		for (i = 0; i < x.length; i++) {
			text += parseFloat(x[i].value);
		}
		document.getElementById("divPrezzo").innerHTML = parseFloat(text)
				.toFixed(2);
	}
	window.onload = prezzo;
</script>
<style>
body {
	background: #E9EBEE;
	max-width: 1920px;
	margin-left: auto !important;
	margin-right: auto !important;
}

.modal.custom {
	outline: none;
}

.modal.custom .modal-dialog {
	width: 350%;
	margin-left: 10px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 100; /* Sit on top */
	padding-top: 50px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: white; /* Fallback color */
	background-color: white; /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	/*background-color: #fefefe;*/
	margin: auto;
	margin-left:0px;
	padding: 8px;
	border: 1px solid #888;
	width: 100%;
}

#exampleModalLong {
	color: black !important
}

/*form nascoste off*/
.hidden {
	display: none;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
/* bottone + */
.plus {
	background: #284b6e;
	border-radius: 20px;
	height: 40px;
	width: 40px;
	color: #fff;
	text-align: center;
	line-height: 32px;
	font-size: 37px;
	left: -25px;
	top: calc(100%/ 2 - 20px);
	z-index: 1;
	margin-top: 12rem;
	margin-right: 20px;
}
/*table totale prezzo */
table {
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
}

@media only screen and (max-width: 575.98px) {
	.plus {
		margin-top: 0%;
		margin-left: 100px;
	}
}
</style>
<link rel="stylesheet" href="css/button4.css">
<link rel="stylesheet" href="css/Bconferma.css">
<link rel="stylesheet" href="css/Bshow.css">
</head>
<body>
	<%
		Utente utente = (Utente) request.getSession().getAttribute("Utente");
	%>
	<%
		if (request.getAttribute("carrel") == null) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ArticoliUtente");
			requestDispatcher.forward(request, response);
		}

		ArrayList<Carrello> carrello = (ArrayList<Carrello>) request.getAttribute("carrel");
		int size = carrello.size();
		int nSize = 0;
	%>
	<!--NAVBAR -->
	<jsp:include page="Navbar.jsp"></jsp:include>
	<!-- fine navbar -->

	<div class="container" style="margin-top: 3%; margin-bottom: 3%;">
		<h3>
			Carrello di
			<%=utente.getUsr()%>:
		</h3>
		<%
			if (size >= 1) {
		%>
		<div class="row">
			<%
				for (Carrello cart1 : carrello) {
			%>

			<div class="d-inline col-sm col-md-4 col-lg-3  align-items-stretch"
				style="padding-top: 20px; padding-bottom: 20px;">


				<div class="card border-secondary"
					style="width: 13rem; display: inline-block;">
					<img src="<%=cart1.getImg()%>" class="card-img-top img-fluid"
						alt="<%=cart1.getImg()%>" style="height: 18rem">
					<div class="card-body">
						<div style="height: 5rem;">
							<h5 class="card-title"><%=cart1.getNomeFilm()%></h5>
							<div class="text-center">
								<input type="hidden" name="price" value="<%=cart1.getPrezzo()%>">
								<p class="lead card-text pull-right">
									<%
										String res = String.format("%.2f", cart1.getPrezzo());
									%><%=res%>
									&euro;
								</p>
							</div>
						</div>
					</div>



				</div>

				<div style="margin-left: -10px;">
					<form action="RemoveFromCart" method="post">
						<input type="hidden" name="nome" value="<%=cart1.getNomeFilm()%>">
						<button type="submit" class="btn1 btn4">Rimuovi dal
							carrello</button>
					</form>
				</div>

			</div>



			<%
				nSize++;
						if ((size - nSize) >= 1) {
			%>
			<div class="plus" name="plus" id="plus">+</div>
			<%
				} else {
			%>

			<%
				}
			%>
			<%
				}
			%>
		</div>

		<table>

			<tr>
				<th>Totale</th>
			</tr>
			<tr>
				<td><div id="divPrezzo"></div></td>
				<td>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModalLong" id="triggerModal">
						Procedi all'acquisto</button>
				</td>
			</tr>
		</table>

		<%
			} else {
		%>
		<h4>
			Non hai aggiunto articoli al carrello... <br>Puoi cercare un
			film dalla sezione Film e cliccare "acquista" per aggiungerlo al
			carrello.
		</h4>
		<%
			}
		%>



		<!-- Modal -->
		<div class="modal fade" id="exampleModalLong" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLongTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">



					<div class="modal-body">


						<%
							if (utente.getBoolDati() == null) {
						%>
						Non sono ancora state impostate le informazioni di pagamento.<br>
						Inserisci i tuoi dati personali.

						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4>Dati Personali</h4>
						<form action="AggiungiDatiUtente" method="post">
							<div class="form-group">
								<input type="hidden" class="form-control" name="usr"
									placeholder="" value="<%=utente.getUsr()%>">
							</div>
							<div class="form-group">
								<label for="numeroCarta">Numero Carta:</label> <input
									type="text" class="form-control" id="numeroCartaS"
									name="numeroCartaNotSending" placeholder="Numero Carta..."
									maxlength="9" onkeyup="sendValue()"> <input
									type="hidden" class="form-control" id="numeroCartaF"
									name="numeroCarta" placeholder="Numero Carta..." maxlength="9">
							</div>
							<div class="form-group">
								<label for="scadenzaCarta">Scadenza Carta:</label> <select
									id="mese" name="mese">

									<option value="01">01</option>

									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>

								</select> <select id="anno" name="anno">
									<%
										int anno;
											for (anno = 2019; anno <= 2030; anno++) {
									%>
									<option value="<%=anno%>">
										<%=anno%></option>
									<%
										}
									%>
								</select> <input type="hidden" id="giorno" value="01"> <input
									type="hidden" id="scadenzaCarta" name="scadenzaCarta" value="">
							</div>
							<div class="form-group">
								<label for="dataNascita">Data di Nascita:</label> <input
									type="date" name="dataNascita">
							</div>
							<div class="form-group">
								<label for="luogoNascita">Luogo di Nascita:</label> <input
									type="text" class="form-control" name="luogoNascita"
									placeholder="Luogo di Nascita..." min="4" maxlength="25">
							</div>
							<div class="form-group">
								<label for="residenza">Residenza:</label> <input type="text"
									class="form-control" name="residenza"
									placeholder="indirizzo,città residenza" min="4" maxlength="30">
							</div>
							<input type="hidden" name="boolDati" value="1"> <input
								type="hidden" name="viewid" value="HomePage.jsp">
							<button onclick="myFunction()" type="submit"
								class="btn btn-primary">Submit</button>
						</form>

					</div>
					<%
						} else {
					%>
					<h4>I tuoi Dati:</h4>
					<label>Nome:</label> <b><%=utente.getNome()%></b> <label>Cognome:</label>
					<b><%=utente.getCognome()%></b><br>
					<div style="display: inline">
						<label>Email:</label> <b><%=utente.getEmail()%></b>
						<button class="btn btn-primary popover-test" id="Bemail" type="button">Modifica</button>
						<div style="display: inline-block" id="femail">
							<form action="ModificaDatiUtente" method="post">
								<input type="hidden" name="action" value="email"> <input
									type="text" name="dato" required
									pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$">
								<input type="hidden" name="viewid" value="AccountPage.jsp">
								<button type="submit" class="fButt">Conferma</button>
							</form>
						</div>
					</div>
					<div style="display: inline">
						<label>Password:</label> <b><%=utente.getPsw()%></b>
						<button class="btn btn-primary popover-test" id="Bpassword" type="button">Modifica</button>
						<div style="display: inline-block" id="fpassword">
							<form action="ModificaDatiUtente" method="post">
								<input type="hidden" name="action" value="psw"> <input
									type="text" name="dato" required> <input type="hidden"
									name="viewid" value="AccountPage.jsp">
								<button type="submit" class="fButt">Conferma</button>
							</form>
						</div>
					</div>
					<br>
					<%
						String dataNascitaStr = utente.getDataNascita();
							SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
							Date resultDataNascita = formater.parse(dataNascitaStr);
							SimpleDateFormat newFormater = new SimpleDateFormat("dd-MM-yyyy");
					%>
					<label>Data Nascita:</label> <b><%=newFormater.format(resultDataNascita)%></b>
					<label>Luogo di Nascita:</label> <b><%=utente.getLuogoNascita()%></b><br>
					<div style="display: inline">
						<label>Residenza:</label> <b><%=utente.getResidenza()%></b>
						<button class="btn btn-primary popover-test" id="Bresidenza" type="button">Modifica</button>
						<div style="display: inline-block" id="fresidenza">
							<form action="ModificaDatiUtente" method="post">
								<input type="hidden" name="action" value="residenza"> <input
									type="text" name="dato" required> <input type="hidden"
									name="viewid" value="AccountPage.jsp">
								<button type="submit" class="fButt">Conferma</button>
							</form>
						</div>
					</div>
					<br>
					<%
						String scadenzaCartaStr = utente.getScadenzaCarta();
							SimpleDateFormat formater1 = new SimpleDateFormat("yyyyMMdd");
							Date resultScadenzaCarta = formater1.parse(scadenzaCartaStr);
							SimpleDateFormat newFormater1 = new SimpleDateFormat("MM-yyyy");
					%>
					<div style="display: inline">
						<label>Numero Carta:</label> <b><%=utente.getNumeroCarta()%></b>
						<button class="btn btn-primary popover-test" id="BnumeroCarta" type="button">Modifica</button>
						<div style="display: inline-block" id="fnumeroCarta">
							<form action="ModificaDatiUtente" method="post">
								<input type="hidden" name="action" value="numeroCarta">
								<input type="text" name="dato" id="numeroCartaS1" maxlength="9"
									required> <input type="hidden" name="viewid"
									value="AccountPage.jsp">
								<button type="submit" class="fButt">Conferma</button>
							</form>
						</div>
					</div>
					<div style="display: inline">
						<label>Scadenza Carta:</label> <b><%=newFormater1.format(resultScadenzaCarta)%></b>
						<button class="btn btn-primary popover-test" id="BscadenzaCarta" type="button">Modifica</button>
						<div style="display: inline-block" id="fscadenzaCarta">
							<form action="ModificaDatiUtente" method="post">
								<input type="hidden" name="action" value="scadenzaCarta">
								<select id="mese1" name="mese">
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>

								</select> <select id="anno1" name="anno">
									<%
										int anno;
											for (anno = 2019; anno <= 2030; anno++) {
									%>
									<option value="<%=anno%>">
										<%=anno%></option>
									<%
										}
									%>
								</select> <input type="hidden" id="giorno1" value="01"> <input
									type="hidden" id="scadenzaCarta1" name="dato" value="">
								<input type="hidden" name="viewid" value="AccountPage.jsp">

								<button onclick="myFunct1()" type="submit" class="fButt">Conferma</button>
							</form>

						</div>
					</div>
					<br>

				</div>
				<div class="modal-footer">
					<form action="EliminaCarrello" method="post">
						<input class="btn btn-primary popover-test" type="submit"
							value="Acquista">
					</form>

				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>



	</div>

	</div>
	<!-- include footer -->
	<jsp:include page="Footer.jsp"></jsp:include>

	<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("Popup");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<script>
		function myFunction() {
			var anno = document.getElementById("anno").value;
			var mese = document.getElementById("mese").value;
			var giorno = document.getElementById("giorno").value;
			var concat = anno + mese + giorno;
			document.getElementById("scadenzaCarta").value = concat;

		}

		function myFunct1() {
			var anno1 = document.getElementById("anno1").value;
			var mese1 = document.getElementById("mese1").value;
			var giorno1 = document.getElementById("giorno1").value;
			var concat1 = anno1 + "-" + mese1 + "-" + giorno1;
			document.getElementById("scadenzaCarta1").value = concat1;
		}

		//script per toggle form nascosta
		function toggler(divId) {
			$("#" + divId).toggleClass('hidden');
		}
	</script>
	<script>
		$("#femail").hide();
		$("#Bemail").bind("click", function() {
			$("#femail").toggle();
			return false;
		})

		$("#fpassword").hide();
		$("#Bpassword").bind("click", function() {
			$("#fpassword").toggle();
			return false;
		})

		$("#fscadenzaCarta").hide();
		$("#BscadenzaCarta").bind("click", function() {
			$("#fscadenzaCarta").toggle();
			return false;
		})

		$("#fresidenza").hide();
		$("#Bresidenza").bind("click", function() {
			$("#fresidenza").toggle();
			return false;
		})

		$("#fnumeroCarta").hide();
		$("#BnumeroCarta").bind("click", function() {
			$("#fnumeroCarta").toggle();
			return false;
		})

		//controllo solo numeri e aggiunta spazi ogni 4 
		document.getElementById('numeroCartaS').addEventListener(
				'input',
				function(e) {
					e.target.value = e.target.value.replace(/[^\dA-Z]/g, '')
							.replace(/(.{4})/g, '$1 ').trim();
				});

		document.getElementById('numeroCartaS1').addEventListener(
				'input',
				function(e) {
					e.target.value = e.target.value.replace(/[^\dA-Z]/g, '')
							.replace(/(.{4})/g, '$1 ').trim();
				});
		
		function sendValue() {
			var value = document.getElementById('numeroCartaS').value;
			var target = document.getElementById('numeroCartaF');
			target.value = value.replaceAll(" ", "");
		}
	</script>
	<script type="text/javascript" src="js/checkDayNight.js"></script>

</body>
</html>