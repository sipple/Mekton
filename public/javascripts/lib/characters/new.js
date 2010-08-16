function stats()
{
    return {
        required: true,
        number: true,
        range: [1, 10]
    };
}

$(document).ready(function() {

  var newCharacterForm = $('#new_character_form');


      var validationRules = {
        rules :{
            "character[name]": {
                required: true
            },
            "character[intelligence]": stats(),
            "character[cool]": stats(),
            "character[reflexes]": stats(),
            "character[attractiveness]": stats(),
            "character[empathy]": stats(),
            "character[tech_ability]": stats(),
            "character[luck]": stats(),
            "character[move_allowance]": stats(),
            "character[body_type]": stats(),
            "character[education]": stats()
        }
    };
    newCharacterForm.validate(validationRules);

});