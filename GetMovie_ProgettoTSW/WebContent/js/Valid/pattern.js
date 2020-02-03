const letterWith2space = () => /^([A-Za-z]+[ ]{0,}){1,2}$/;

const allLetter = () => /^[A-Za-z]+$/;

const alphanumeric = () => /^[0-9a-zA-Z]+$/;

const numeric = () => /^[0-9]+$/;

const validateEmail = () => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

const validateCF = () => /^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$/;


function clearForm(form){
	//reset input border color
	var inputs = form.getElementsByTagName("input");
	for(var i = 0; i<inputs.length; i++)
		inputs[i].style.borderColor = "black"; 
	
	//delete previous error messages
	var spans = form.getElementsByTagName("span");
	for(var i = 0; i<spans.length; i++)
		form.removeChild(spans[i]);
}
