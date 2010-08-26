function addProfessionSkill(checkbox) {
  $.ajax({
    url: $("#character_profession_data_id").text() + '/character_profession_skill_data',
    type: 'POST',
    data: "character_skill_data_id=" + checkbox.value,
    complete: function(xhr, textStatus){
      var response = $.parseJSON(xhr.responseText);
      var textBox = $("#" + checkbox.id + "-bonus");
      textBox.val(response.bonus);
      textBox.attr('disabled', '');

    }
  });
}

function deleteProfessionSkill(checkbox) {
  $.ajax({
    url:$("#character_profession_data_id").text() + '/character_profession_skill_data/' + checkbox.value,
    type: 'DELETE',
    complete: function(xhr, textStatus){
      var textBox = $("#" + checkbox.id + "-bonus");
      textBox.val('');
      textBox.attr('disabled', 'disabled');

    }
  });  
}

function updateProfessionSkill(textbox) {
  var id = textbox.id.split('-')[0];
  console.log($("#" + id));

  $.ajax({
    url:$("#character_profession_data_id").text() + '/character_profession_skill_data/' + $("#" + id).val(),
    type: 'PUT',
    data: "bonus=" + textbox.value,
    complete: function(xhr, textStatus){
      var response = xhr.responseText;

    }
  });  
}

$(document).ready(function() {

  $('.editable-checkbox').click(function() {

    if (this.checked) {
      addProfessionSkill(this);
    }
    else {
      deleteProfessionSkill(this);
    }

  });

  $('.editable-field').change(function() {
     updateProfessionSkill(this);
  });

});