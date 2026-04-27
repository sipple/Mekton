class CharacterWeapon < ApplicationRecord
  belongs_to :character
  belongs_to :character_weapon_data

  def cost
    (quantity || 0) * character_weapon_data.cost if character_weapon_data
  end
end
