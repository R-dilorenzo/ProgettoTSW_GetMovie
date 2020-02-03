

function validateForm(form)
{
	clearForm(form);

	var err="";
	var errpos;

	var usr=document.forms["login"]["usr"].value;
	var psw=document.forms["login"]["psw"].value;
	
	if (usr.length >= 12){
		errpos = document.forms["login"]["usr"];
		err = "Il numero di caratteri deve essere inferiore a 12";
	}else if (psw.length >= 12){
		errpos = document.forms["login"]["psw"];
		err = "Il numero di caratteri deve essere inferiore a 12";
	}
	

	if (err.length > 0){
		errpos.style.borderColor = "red"; 
		
		var msgEl =" ERROR: "+err;

	    document.getElementById("err").innerHTML =msgEl;
	    

		return false;
	}
	
	
	return true;
}