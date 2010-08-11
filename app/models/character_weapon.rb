class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_weapon_data
end
