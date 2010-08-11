class CharacterEquipment < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_equipment_data
end
