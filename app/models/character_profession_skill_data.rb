class CharacterProfessionSkillData < ActiveRecord::Base
  belongs_to :character_profession_data
  has_one :character_skill_data
end
