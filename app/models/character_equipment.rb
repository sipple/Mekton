class CharacterEquipment < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_equipment_data

  def cost
    (self.quantity || 0) * self.character_equipment_data.cost
  end
  
end
