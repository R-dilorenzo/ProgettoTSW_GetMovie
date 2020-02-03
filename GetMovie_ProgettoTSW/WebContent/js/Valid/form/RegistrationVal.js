

function validateForm(form)
{
	
	clearForm(form);

	var err="";
	var errpos;

	var nome=document.forms["registrazione"]["nome"].value;
	var cognome=document.forms["registrazione"]["cognome"].value;
	var email=document.forms["registrazione"]["email"].value;
	
	var usr=document.forms["registrazione"]["usr"].value;
	var psw=document.forms["registrazione"]["psw"].value;
	
	if (usr.length >= 12){
		errpos = document.forms["registrazione"]["usr"];
		err = "Il numero di caratteri deve essere inferiore a 12";
	}else if (psw.length >= 12){
		errpos = document.forms["registrazione"]["psw"];
		err = "Il numero di caratteri deve essere inferiore a 12";
	}else if (!nome.match(letterWith2space())){
		errpos = document.forms["registrazione"]["nome"];
		err = "formato non corretto";
	}else if (!cognome.match(letterWith2space())){
		errpos = document.forms["registrazione"]["cognome"];
		err = "formato non corretto";
	}else if (!email.match(validateEmail())){
		errpos = document.forms["registrazione"]["email"];
		err = "formato non corretto";
	}
	

	if (err.length > 0){
		errpos.style.borderColor = "red"; 
		
		var msgEl =" ERROR: "+err;

	    document.getElementById("err").innerHTML =msgEl;
	    

		return false;
	}
	
	
	return true;
}