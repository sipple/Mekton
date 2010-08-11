class CharacterArmor < ActiveRecord::Base
  belongs_to :character
  has_one :character_armor_data
end
