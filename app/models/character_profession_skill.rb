class CharacterProfessionSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_profession_skill_data
end
