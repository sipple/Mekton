class CharacterSkill < ActiveRecord::Base
  belongs_to :character
  has_one :character_skill_data
end
