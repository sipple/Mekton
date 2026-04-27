class CharacterProfessionData < ApplicationRecord
  has_many :character_profession_skill_data, class_name: "CharacterProfessionSkillData"
end
