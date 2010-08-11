class CharacterSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_skill_data
end
