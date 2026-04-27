class CharacterTemplateData < ApplicationRecord
  has_many :character_template_skill_data, class_name: "CharacterTemplateSkillData"
end
