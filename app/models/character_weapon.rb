class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  has_one :character_weapon_data
end
