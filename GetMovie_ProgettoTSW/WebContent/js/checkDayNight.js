/**
 * 
 */
checkDayNight();
	 //manipolazione css con JavaScript e JQuery
	 function checkDayNight(){
	   var currentStorage=localStorage.getItem('night');
	   if(currentStorage=="true"){
	       document.body.style.backgroundColor = "#222";
	       document.body.style.color="white";
	       
	       //$('#demo').addClass('bg-dark text-white');
	       
	       //$('#x').css({"background-color": "#222", "font-size": "200%"});
			
	       $('.card-body').addClass('bg-dark text-white');
	   }else if (currentStorage=="false"){
	       document.body.style.backgroundColor = "white";
	       document.body.style.color="#212529";
	       $('.card-body').removeClass('bg-dark text-white');
	       
	   }
	 }
