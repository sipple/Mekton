class CharacterProfessionData < ActiveRecord::Base
  has_many :character_profession_skill_data
end
