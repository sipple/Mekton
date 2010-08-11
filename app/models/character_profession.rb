class CharacterProfession < ActiveRecord::Base
  belongs_to :character
  has_one :character_profession_data
end
