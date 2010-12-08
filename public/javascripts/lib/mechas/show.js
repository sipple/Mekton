

function submitMechaUpdate(value, settings) {

  $.ajax({
    url: $('#mecha_id').text() +'.json',
    type: 'PUT',
    data: "field=" + this.id + "&value=" + value,
    complete: function(xhr, textStatus) {
      var response =  $.parseJSON(xhr.responseText);
      updateSecondaryStats(response.mecha);
      updateSkills(response.mecha);
    }
  });

  return value
}
function submitRowUpdate(value, settings) {
  var field_id_hash = this.id.split('-');
  var model = field_id_hash[0];
  var id = field_id_hash[1];
  var field = field_id_hash[2];

  $.ajax({
    url: $('#mecha_id').text() + '/' + model + '/' + id + '.json',
    type: 'PUT',
    data: 'field=' + field + "&value=" + value,
    complete: function(xhr, textStatus) {
      var response = $.parseJSON(xhr.responseText);

      for(var field in response) {
        updateDiv($("#" + model + '-' + id + '-' + field), response[field]);
      }
    }
  });

  return "Updating...";
}

function updateSecondaryStats(mecha) {
  //updateDiv($("#head"), character.head);

}

function updateSkills(mecha) {
  //var skills = mecha.character_skills
  //for(var skill in skills) {
  //  updateDiv($("#character_skills-" + skills[skill].id + "-attribute_bonus"), skills[skill].attribute_bonus);
  //  updateDiv($("#character_skills-" + skills[skill].id + "-total"), skills[skill].total);
  //}
}


function updateDiv(div, value) {
  if(div.text() != value)
  {
    if (div.hasClass('editable-row-field') && value == null) {
      div.html('Click to edit');
    }
    else {
      div.html(value);
    }
    div.effect("highlight", {}, 3000);
  }
}

function addItem(element) {
  var id_elements = element.attr('id').split('-');
  var model = id_elements[0];

  $.ajax({
    url: $('#mecha_id').text() + '/' + model,
    type: 'POST',
    data: "mecha_id=" + $('#mecha_id').text(),
    complete: function(xhr, textStatus){
      var addRow = $('#' + element.attr('id')).before(xhr.responseText);
      bindDeletes(addRow.prev());
      bindEditableSelectRows(addRow.prev());
      bindEditableFieldRows(addRow.prev());
    }
  });
}

function deleteItem(element) {

  var id_elements = element.attr('id').split('-');
  var model = id_elements[0];
  var id = id_elements[1];

  if (confirm("Are you sure you want to delete this?"))
  {
    $.ajax({
      url: $('#mecha_id').text() + '/' + model + '/' + id + '.json',
      type:'DELETE',
      complete: function(xhr, textStatus){
        element.fadeOut(1000, function (){
          element.remove();
        });
      }
    });
  }
}

function bindEditableSelectRows(scope) {
  $('.editable-row-select', scope).editable(submitRowUpdate, {
    method:'GET',
    type: 'select',
    loadurl: $('#mecha_id').text() + '/select_options',
    onblur:'submit'
  });
}

function bindEditableFieldRows(scope) {
  $('.editable-row-field', scope).editable(submitRowUpdate, {
    method: 'PUT',
    id: 'field',
    name: 'value'
  })
}

function bindDeletes(scope) {
  $('.delete', scope).click(function(){
    deleteItem($(this).parents('tr'));
  });
}

$(document).ready(function(){

  $('.edit').editable(submitMechaUpdate, {
    method: 'PUT',
    id: 'field',
    name: 'value'
  });

  bindEditableSelectRows(this);
  bindEditableFieldRows(this);
  bindDeletes(this);

  $('.add').click(function() {
    addItem($(this).parents('tr'));
  });
});