class CharacterProfession < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_profession_data
end
