class CharacterProfessionSkillData < ActiveRecord::Base
  belongs_to :character_profession_data
  belongs_to :character_skill_data
end
