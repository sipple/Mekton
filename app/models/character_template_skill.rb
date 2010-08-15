class CharacterTemplateSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_template_skill_data
end
