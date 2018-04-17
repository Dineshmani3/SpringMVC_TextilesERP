
$.validator.addMethod("noTild",function(value,element){

		var tildRegex=/^[^`]+$/i;

		return this.optional(element) || value.match(tildRegex);

	},"This charatcer is not allowed");



	$.validator.addMethod("validName",function(value,element){

		var nameRegex=/^[a-zA-Z ]+$/i;

		return this.optional(element) || value.match(nameRegex);

	},"This field should contain only letters");

	

	$.validator.addMethod("validEmail",function(value,element){

		var emailRegex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

		return this.optional(element) || value.match(emailRegex);

	},"Enter a valid email address");

	$.validator.addMethod("validContact",function(value,element){
	   var contactRegex=/^[0-9-()]+$/i;
        return this.optional(element) || value.match(contactRegex);
	},"Enter a valid number");

	$.validator.addMethod("validText",function(value,element){
		var textRegex=/^[a-zA-Z0-9-\/\.(),_\'\+--@%" ]+$/i;
		return this.optional(element) || value.match(textRegex);
	},"You can only enter text,numbers and some special characters");
    

	
    $.validator.addMethod("validPin",function(value,element){

		var pinRegex=/^[0-9- ]+$/i;

		return this.optional(element) || value.match(pinRegex);

	},"Enter a valid pincode");

	