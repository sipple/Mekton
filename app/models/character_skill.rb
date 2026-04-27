class CharacterSkill < ApplicationRecord
  belongs_to :character
  belongs_to :character_skill_data

  def profession_and_template_bonus
    bonus = 0

    character.character_profession_skills.each do |profession_skill|
      bonus += profession_skill.character_profession_skill_data.bonus
    end
    character.character_template_skills.each do |template_skill|
      bonus += template_skill.character_template_skill_data.bonus
    end

    bonus
  end

  def attribute_bonus
    if character_skill_data
      attribute = character_skill_data.related_attribute
      character.send(attribute.gsub(" ", "").underscore)
    else
      0
    end
  end

  def total
    level + profession_and_template_bonus + attribute_bonus
  end
end
