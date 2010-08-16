function stats()
{
    return {
        required: true,
        number: true,
        range: [1, 10]
    };
}

function toInt(selector)  {
    return isNaN(parseInt(selector.val())) ? 0: parseInt(selector.val());
    
}

function stat_points_spent() {
    var points = 0;
    points += toInt($('#character_intelligence'));
    points += toInt($('#character_cool'));
    points += toInt($('#character_reflexes'));
    points += toInt($('#character_attractiveness'));
    points += toInt($('#character_empathy'));
    points += toInt($('#character_tech_ability'));
    points += toInt($('#character_luck'));
    points += toInt($('#character_move_allowance'));
    points += toInt($('#character_body_type'));
    points += toInt($('#character_education'));
    return points;
    
}

function reset_stat_points_spent() {
    $('#character_points_spent').html( stat_points_spent());
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

    $('#character_intelligence').change(function() {
        reset_stat_points_spent();
    });
    $('#character_cool').change(function() {
        reset_stat_points_spent();
    });
    $('#character_reflexes').change(function() {
        reset_stat_points_spent();
    });
    $('#character_attractiveness').change(function() {
        reset_stat_points_spent();
    });
    $('#character_empathy').change(function() {
        reset_stat_points_spent();
    });
    $('#character_tech_ability').change(function() {
        reset_stat_points_spent();
    });
    $('#character_luck').change(function() {
        reset_stat_points_spent();
    });
    $('#character_move_allowance').change(function() {
        reset_stat_points_spent();
    });
    $('#character_body_type').change(function() {
        reset_stat_points_spent();
    });
    $('#character_education').change(function() {
        reset_stat_points_spent();
    });


    $('#character_points_spent').html( stat_points_spent());

});