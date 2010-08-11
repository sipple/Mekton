class CharacterTemplateSkillData < ActiveRecord::Base
  belongs_to :character_template_data
  has_one :character_skill_data
end
