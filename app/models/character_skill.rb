class CharacterSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :character_skill_data


  def profession_and_template_bonus
    bonus = 0

    self.character.character_profession_skills.each do |profession_skill|
      bonus += profession_skill.character_profession_skill_data.bonus
    end
    self.character.character_template_skills.each do |template_skill|
      bonus += template_skill.character_template_skill_data.bonus 
    end

    bonus
  end

  def attribute_bonus
    attribute = self.character_skill_data.related_attribute
    self.character.send(attribute.downcase)
  end

  def total
    self.level + self.profession_and_template_bonus + self.attribute_bonus
  end

end
