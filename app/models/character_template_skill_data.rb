class CharacterTemplateSkillData < ActiveRecord::Base
  belongs_to :character_template_data
  belongs_to :character_skill_data
end
