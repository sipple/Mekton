

function submitMechaUpdate(value, settings) {

  $.ajax({
    url: $('#mecha_id').text() +'.json',
    type: 'PUT',
    data: "field=" + this.id + "&value=" + value,
    complete: function(xhr, textStatus) {
      var response =  $.parseJSON(xhr.responseText);
      updatePrimaryStats($.parseJSON(response.mecha).mecha);
    }
  });

  return value
}

function submitMechaSelectUpdate(value, settings) {
  var field_id_hash = this.id.split('-');

  $.ajax({
     url: $('#mecha_id').text() + '.json',
    type: 'PUT',
    data: "field=" + field_id_hash[2] + "&value=" + value,
    complete: function(xhr, textStatus) {
      var response =  $.parseJSON(xhr.responseText);
      updatePrimaryStats($.parseJSON(response.mecha).mecha);
  }
  });
  return "Updating...";
}

function submitNameUpdate(value, settings) {
  $.ajax({
    url: $('#mecha_id').text() + '.json',
    type: 'PUT',
    data: "field=name&value=" + value,
    complete: function(xhr, textStatus) {
      var response = $.parseJSON(xhr.responseText);
    }
  });
  return value;
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

      updatePrimaryStats($.parseJSON(response.mecha).mecha);
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

function updatePrimaryStats(mecha) {
  updateDiv($("#mecha_piloting"), mecha.mecha_piloting);
  updateDiv($("#mecha_fighting"), mecha.mecha_fighting);
  updateDiv($("#mecha_melee"), mecha.mecha_melee);
  updateDiv($("#mecha_gunnery"), mecha.mecha_gunnery);
  updateDiv($("#mecha_missiles"), mecha.mecha_missiles);
  updateDiv($("#mv"), mecha.mv);
  updateDiv($("#mecha_reflexes"), mecha.mecha_reflexes);
  updateDiv($("#land_ma"), mecha.land_ma);
  updateDiv($("#flight_ma"), mecha.flight_ma);
  updateDiv($("#wings_flight_ma"), (mecha.flight_ma + 2));
  updateDiv($("#ground_effects"), mecha.ground_effects);
  updateDiv($('#mecha_weight'), mecha.weight);
  updateDiv($('#mecha_cost'), mecha.cost);
  updateDiv($('#maneuver_pool'), mecha.maneuver_pool);
  updateDiv($('.pilot'), mecha.character.name);

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

  // Make mecha name editable (This could be rolled into that "Edit" class I think)
  $('#mecha_name').editable(submitNameUpdate, {
    method: 'PUT',
    id: 'field',
    name: 'value'
  });

  // Make the mecha modifier fields editable
  $('.modifier').editable(submitMechaUpdate, {
    method: 'PUT',
    id: 'field',
    name: 'value'
  });

  // Make the notes area editable
  $('.editable-text-area').editable(submitMechaUpdate, {
   type      : 'textarea',
    method: 'PUT',
    id: 'field',
    name: 'value',
    cancel    : 'Cancel',
    submit    : 'OK',
   rows       : 4
  });

  $('.editable-select', this).editable(submitMechaSelectUpdate, {
    method:'GET',
    type: 'select',
    loadurl: $('#mecha_id').text() + '/select_options',
    onblur:'submit'
  });

  bindEditableSelectRows(this);
  bindEditableFieldRows(this);
  bindDeletes(this);

  $('.add').click(function() {
    addItem($(this).parents('tr'));
  });
});