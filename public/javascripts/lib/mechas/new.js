$(document).ready(function(){
  var newMechaForm = $("#new_mecha_form");

  var validationRules = {
    rules :{
      "mecha[name]": {
        required: true
      }
    }
  };

  newMechaForm.validate(validationRules); 
});