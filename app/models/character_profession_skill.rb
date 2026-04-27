class CharacterProfessionSkill < ApplicationRecord
  belongs_to :character
  belongs_to :character_profession_skill_data
end
