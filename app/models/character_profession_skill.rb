class CharacterProfessionSkill < ActiveRecord::Base
  belongs_to :character
  has_one :character_profession_skill_data
end
