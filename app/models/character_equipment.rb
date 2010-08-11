class CharacterEquipment < ActiveRecord::Base
  belongs_to :character
  has_one :character_equipment_data
end
