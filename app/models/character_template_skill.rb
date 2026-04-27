class CharacterTemplateSkill < ApplicationRecord
  belongs_to :character
  belongs_to :character_template_skill_data
end
