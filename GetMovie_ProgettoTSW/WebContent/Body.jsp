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
<link rel="stylesheet" href="css/DayNightSwitch.css">
<link rel="stylesheet" href="css/Body.css">
</head>
<body>
				<%
				if (request.getAttribute("AllFilm") == null) {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/ReturnAllFilm");
					requestDispatcher.forward(request, response);
				}

				ArrayList<Film> pren = (ArrayList<Film>) request.getAttribute("AllFilm");
				%>
				
				
	<div class="body">
			<div class="x" name="x" id="x">
				<jsp:include page="Slider.jsp"></jsp:include>
			</div>			
			<div class="function">
			<!-- inizio input cercaFilm -->
			<%
			for (Film pre1 : pren) {
				%>
				<input style="display:none" name="fname" class="class" type="text" value="<%=pre1.getNome()%>">
				<% 
			}
			%>
			<label class="ml-0 ml-sm-2 ml-md-5" id="cercaFilm"><strong>Cerca Film</strong>:</label>
			<div class="block">
     			<form autocomplete="off" action="InfoFilm" method="post">
    				<input type="text" class=" " name="nome" id="myInput" placeholder="Inizia a digitare..." >
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
			<!-- fine input -->
			<div class="mr-0 mr-sm-2 mr-md-5" id="dn">
				<div id="Day">
					DAY/NIGHT 
				    <label class="switch">
						<input type="checkbox" id="myCheck" onclick="DayFunction()">
						<span class="slider round"></span>
				    </label>
				</div>
			    <div id="Night">
			      	DAY/NIGHT 
			      	<label class="switch">
			        	<input type="checkbox" id="myCheck1" onclick="NightFunction()" checked>
			        	<span class="slider round"></span>
			      	</label>
			    </div>
			    <div id="LocalSt">
			    	DAY/NIGHT: Il tuo browser non supporta questa funzionalità</div>
			</div>
		</div>
    	<div class="tab-content">
    		<div class="tab-pane active" id="Film">
				<div class="row ml-0 ml-sm-3 ml-md-5">
    				<%
						for (Film pre : pren) {
					%>
					<div class="col col-lg-3 col-md-4 col-sm-6 col-12 pt-3 pb-3 pl-5">
						<div class="card">
							<a href="InfoFilm?nome=<%=pre.getNome() %>"><img src="<%=pre.getImg()%>"
								alt="<%=pre.getImg()%>" style="height:20rem;width:230px"></a>	
							<div class="rowXS__text card-body" style="padding:8px">
								<h5 class="card-title" ><%=pre.getNome()%></h5>
								<small class="text-muted">
									<p class="card-text"><%=pre.getGenere()%></p>
								</small>
									<span class="rowXS__price" style="padding:8px">
							
								<p class="lead card-text text-right"><%String res=String.format("%.2f",pre.getPrezzo());%><%=res%>	&euro;</p>
									<a href="InfoFilm?nome=<%=pre.getNome() %>" class="btn btn-primary pull-right">Acquista</a>
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
	</div>
	
	
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
      /*
      Poichè lo switch day/night cambia il colore del font del body a white per evitare che cambia anche 
      nel div che viene creato attraverso questo evento viene settato il colore del div come nero e inserisco
      attributo !important per evitare che il div creato eredita il colore white di body
      */
      a.setAttribute("style", "color:black !important")    
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

//--
 
 var x=[];
 var elements = document.querySelectorAll('.class');
 for (var i = 0; i < elements.length; i++) {
	 x.push(elements[i].value);
    
 }

var film = x;

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), film);

</script>		
 <script>
 //var nightBOOL=localStorage.getItem('night');
 //localStorage.setItem('night',nightBOOL)
 
 //checkDayNight()

 var nightBOOL;
 function DayFunction() {
 // Get the checkbox
 var checkBox = document.getElementById("myCheck");
 
   // If the checkbox is checked, display the output text
   if (checkBox.checked == true){
       nightBOOL="true";
       localStorage.setItem('night',nightBOOL)
       checkDayNight()
   } else {
       nightBOOL="false";
       localStorage.setItem('night',nightBOOL)
       checkDayNight()
   }
 } 

 function NightFunction() {
 // Get the checkbox
 var checkBox1 = document.getElementById("myCheck1");
 
   // If the checkbox is checked, display the output text
   if (checkBox1.checked == true){
       nightBOOL="true";
       localStorage.setItem('night',nightBOOL)
       checkDayNight()
   } else {
       nightBOOL="false";
       localStorage.setItem('night',nightBOOL)
       checkDayNight()
   }
 } 
 
 //manipolazione css con JavaScript e JQuery
 function checkDayNight(){
   var currentStorage=localStorage.getItem('night');
   if(currentStorage=="true"){
       document.body.style.backgroundColor = "#222";
       document.body.style.color="white";
              
       $('#jumbo').css({"background-color": "#222"});
		
       $('.card-body').addClass('bg-dark text-white');
   }else if (currentStorage=="false"){
       document.body.style.backgroundColor = "white";
       document.body.style.color="#212529";
       $('.card-body').removeClass('bg-dark text-white');
       
       $('#jumbo').css({"background-color": "#e9ecef"});
   }
 }

 
 //changeDayNight()

 function changeDayNight(){
   var currentStorage1=localStorage.getItem('night');
   if(currentStorage1==null){
	   document.getElementById("Day").style.display = "block";
       document.getElementById("Night").style.display = "none";
       document.getElementById("LocalSt").style.display = "none";
   }else{
	   if(currentStorage1=="true"){
	       document.getElementById("Day").style.display = "none";
	       document.getElementById("Night").style.display = "block";
	       document.getElementById("LocalSt").style.display = "none";
	   }else if (currentStorage1=="false"){
	       document.getElementById("Day").style.display = "block";
	       document.getElementById("Night").style.display = "none";
	       document.getElementById("LocalSt").style.display = "none";
	   }   
   }
 }

 function noLocalStorage(){
   document.getElementById("Day").style.display = "none";
   document.getElementById("Night").style.display = "none";
   document.getElementById("LocalSt").style.display = "block";
 }

 function lsTest(){
 var test = 'test';
 try {
     localStorage.setItem(test, test);
     localStorage.removeItem(test);
     return true;
 } catch(e) {
     return false;
 }
}

if(lsTest() === true){
 // available
 changeDayNight()
 checkDayNight()
}else{
 // unavailable
 noLocalStorage()
}
 
 </script> 
</body>
</html>