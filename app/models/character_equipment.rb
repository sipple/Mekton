class CharacterEquipment < ApplicationRecord
  belongs_to :character
  belongs_to :character_equipment_data

  def cost
    (quantity || 0) * character_equipment_data.cost if character_equipment_data
  end
end
