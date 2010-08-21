
function submitCharacterUpdate(value, settings) {

  $.ajax({
    url: $('#character_id').text() +'.json',
    type: 'PUT',
    data: "field=" + this.id + "&value=" + value,
    complete: function(xhr, textStatus) {
      var response =  $.parseJSON(xhr.responseText);
      updateSecondaryStats(response.character);
    }
  });

  return value
  
}

function updateSecondaryStats(character) {
  updateDiv($("#head"), character.head);
  updateDiv($("#limbs"), character.limbs);
  updateDiv($("#torso"), character.torso);
  updateDiv($("#melee_damage_mod"), character.melee_damage_mod);
  updateDiv($("#stability"), character.stability);
  updateDiv($("#run"), character.run);
  updateDiv($("#jump"), character.jump);
  updateDiv($("#running_jump"), character.running_jump);
  updateDiv($("#anime_leap"), character.anime_leap);
  updateDiv($("#stun"), character.stun);
  updateDiv($("#lift"), character.lift);
  updateDiv($("#ev"), character.ev);
  updateDiv($("#throw_distance"), character.throw_distance);
}

function updateDiv(div, value) {
  if(div.text() != value)
  {
    div.html(value);
    div.effect("highlight", {}, 3000);
  }
}


$(document).ready(function() {

  $('.edit').editable(submitCharacterUpdate, {
    method: 'PUT',
    id: 'field',
    name: 'value'
  })

});