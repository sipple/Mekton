class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_weapon_data

  def cost
    self.quantity * self.character_weapon_data.cost
  end

end
