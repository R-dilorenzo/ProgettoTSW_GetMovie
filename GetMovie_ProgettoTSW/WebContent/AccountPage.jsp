<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@page import="model.Utente"%>
<%@page import="model.Admin"%>
<%@page import="controller.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="css/Bconferma.css">
<link rel="stylesheet" href="css/Bshow.css">
<style>
body {
	background: #E9EBEE;;
	max-width: 1920px;
	margin-left: auto !important;
	margin-right: auto !important;
}

.hidden {
	display: none;
}

.container .form-group .form-control {
	width: 100%
}

@media ( max-width : 767.98px) {
	.container .form-group .form-control {
		width: 100%
	}
}
</style>
</head>
<body>
	<!--NAVBAR -->
	<jsp:include page="Navbar.jsp"></jsp:include>
	<!-- fine navbar -->

	<%
		Utente utente = (Utente) request.getSession().getAttribute("Utente");
	%>

	<div class="container" style="margin-top: 2%; margin-bottom: 2%">

		<p class="h1">
			Area Personale di: <b><%=utente.getUsr()%></b>
		</p>
		<p>Puoi impostare i tuoi dati dal seguente form o quando effettui
			il primo acquisto.</p>
		<div class=" container">
			<%
				if (utente.getBoolDati() == null) {
			%>
			Non sono ancora state impostate le informazioni di pagamento.<br>
			Puoi inserirle dal seguente form o con il primo acquisto.<br>
			<br>

			<h4>Dati Personali</h4>
			<form action="AggiungiDatiUtente" method="post">
				<div class="form-group">
					<input type="hidden" class="form-control" name="usr" placeholder=""
						value="<%=utente.getUsr()%>">
				</div>
				<div class="form-group">
					<label for="numeroCarta">Numero Carta:</label> <input type="text"
						class="form-control" id="numeroCartaS"
						name="numeroCartaNotSending" placeholder="Numero Carta..."
						maxlength="9" onkeyup="sendValue()"> <input type="hidden"
						class="form-control" id="numeroCartaF" name="numeroCarta"
						placeholder="Numero Carta..." maxlength="9">
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
				<button onclick="myFunction()" type="submit" class="btn btn-primary">Submit</button>
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
			<button class="Bshow" id="Bemail" type="button">Modifica</button>
			<div style="display: inline-block" id="femail">
				<form action="ModificaDatiUtente" method="post">
					<input type="hidden" name="action" value="email"> <input
						type="text" name="dato" required
						pattern="^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"> <input
						type="hidden" name="viewid" value="AccountPage.jsp">
					<button type="submit" class="fButt">Conferma</button>
				</form>
			</div>
		</div>
		<div style="display: inline">
			<label>Password:</label> <b><%=utente.getPsw()%></b>
			<button class="Bshow" id="Bpassword" type="button">Modifica</button>
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
			<button class="Bshow" id="Bresidenza" type="button">Modifica</button>
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
			<button class="Bshow" id="BnumeroCarta" type="button">Modifica</button>
			<div style="display: inline-block" id="fnumeroCarta">
				<form action="ModificaDatiUtente" method="post">
					<input type="hidden" name="action" value="numeroCarta"> <input
						type="text" name="dato" id="numeroCartaS1" maxlength="9" required>
					<input type="hidden" name="viewid" value="AccountPage.jsp">
					<button type="submit" class="fButt">Conferma</button>
				</form>
			</div>
		</div>
		<div style="display: inline">
			<label>Scadenza Carta:</label> <b><%=newFormater1.format(resultScadenzaCarta)%></b>
			<button class="Bshow" id="BscadenzaCarta" type="button">Modifica</button>
			<div style="display: inline-block" id="fscadenzaCarta">
				<form action="ModificaDatiUtente" method="post">
					<input type="hidden" name="action" value="scadenzaCarta"> <select
						id="mese1" name="mese">
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
						type="hidden" id="scadenzaCarta1" name="dato" value=""> <input
						type="hidden" name="viewid" value="AccountPage.jsp">

					<button onclick="myFunct1()" type="submit" class="fButt">Conferma</button>
				</form>

			</div>
		</div>
		<br>
		<%
			}
		%>

	</div>
	</div>

	<!-- include footer -->
	<jsp:include page="Footer.jsp"></jsp:include>

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