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


<style>
body {
	background: #E9EBEE;;
}
/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

#myInput {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

#myInput {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  
  margin-left:15px;
  width:95%;
  
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>
</head>
<body>
	<!--NAVBAR -->
		<jsp:include page="Navbar.jsp"></jsp:include>
		<!-- fine navbar -->
		
		<%
	Admin admin = (Admin) request.getSession().getAttribute("Admin");
%>
	<%
				if (request.getAttribute("AllFilm1") == null) {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/RedirectAdmin");
					requestDispatcher.forward(request, response);
				}

				ArrayList<Film> pren1 = (ArrayList<Film>) request.getAttribute("AllFilm1");
			%>
<%
			for (Film pre : pren1) {
				%>
		<input style="display:none" name="fname" class="class" type="text" value="<%=pre.getNome()%>">
				<% 
			}
			%>
<div  style="margin-top:3%;margin-bottom:3%;"class="container">
 
  <div id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="card-link" data-toggle="collapse" href="#AggiungiFilm">Aggiungi Film
        </a>
      </div>
      <div id="AggiungiFilm" class="collapse" data-parent="#accordion">
        <div  style="margin-bottom:3%" class="card-body">
                <form action="AggiungiFilm" method="post" enctype="multipart/form-data">
									<div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Nome:</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control " name="nome" id="nome"
												placeholder="Nome Film">
										</div>
									</div>
											<div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Regista:</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control " name="regista" id="regista"
												placeholder="Regista">
										</div>
									</div>
                                    <div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Genere:</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control " name="genere" id="genere"
												placeholder="Genere Film">
										</div>
									</div>
                                    	<div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Immagine:</b></label>
										<div class="col-sm-10">
											<input type="file" class="form-control-file border " name="img" id="img"
												placeholder="Immagine">
										</div>
									</div>
                                    
                                    <div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Attori:</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control " name="attori" id="attori"
												placeholder="Attori">
										</div>
									</div>
                                    
                                    <div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Descrizione:</b></label>
										<div class="col-sm-10">
										
											<textarea class="form-control" name="descrizione" id="descrizione" rows="2"
												placeholder="Trama del film..."></textarea>
										</div>
									</div>
                                    									<div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right "><b>Anno:</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control " name="anno" id="anno"
												placeholder="Anno">
										</div>
									</div>
                                    									<div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Prezzo:</b></label>
										<div class="col-sm-10">
											<input type="text" class="form-control " name="prezzo" id="prezzo"
												placeholder="Prezzo">
										</div>
									</div>
									<button type="submit" class="btn btn-primary pull-right">Aggiungi Film</button>
								</form>

        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#ModificaFilm">
        Modifica Film 
      </a>
      </div>
      <div id="ModificaFilm" class="collapse" data-parent="#accordion">
        <div  style="margin-bottom:3%" class="card-body">
        <div id="demo">
        
         <div style="display:inline" >
          
                <form action="SelezioneFilm" method="post" onsubmit ="myFunct()">
                Scegli film:
         <select name="nome">
         <%
			for (Film pre : pren1) {
				%>
		<option value="<%=pre.getNome()%>"><%=pre.getNome()%></option>
				<% 
			}
			%>
         </select>
         <button type="submit" class="btn btn-primary pull-right">Submit</button>
         </form>
         </div>
         </div>
 
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-link" data-toggle="collapse" href="#EliminaFilm">
          Elimina Film
        </a>
      </div>
      <div id="EliminaFilm" class="collapse" data-parent="#accordion">
        <div  style="margin-bottom:3%" class="card-body">
        <form autocomplete="off" action="EliminaFilm" method="post">
        		<div class="form-group row ">
										<label for="nome" class="col-sm-2 col-form-label text-md-right"><b>Nome Film:</b></label>
										<div class="col-sm-10">
											<input type="text" class=" " name="nome" id="myInput"
												placeholder="Nome Film da eliminare">
										</div>
										
									</div>
									<button type="submit" class="btn btn-primary pull-right">Elimina Film</button>
								</form>
        </div>
      </div>
    </div>
  </div>
    
  
</div>
		
		<!-- include footer -->
		<jsp:include page="Footer.jsp"></jsp:include>
		
<script>

function myFunct() {
	var node = document.getElementById('nascosto');

	htmlContent = node.innerHTML;

	  document.getElementById("demo").innerHTML = htmlContent;
}

function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}


 
 var x=[];
 var elements = document.querySelectorAll('.class');
 for (var i = 0; i < elements.length; i++) {
	 x.push(elements[i].value);
    
 }

var film = x;

//document.getElementById("p1").innerHTML=x;

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), film);

</script>
</body>
</html>