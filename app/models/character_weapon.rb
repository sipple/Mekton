class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_weapon_data

  def cost
    (self.quantity || 0) * self.character_weapon_data.cost if self.character_weapon_data
  end

end
