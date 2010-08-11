class CharacterArmor < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_armor_data
end
