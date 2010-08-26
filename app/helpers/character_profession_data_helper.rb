module CharacterProfessionDataHelper
  def skill_checkbox(profession_id, skill, skill_id)
    check_box_tag skill, skill_id, checked?(profession_id, skill_id), :class => 'editable-checkbox'   
  end

  def skill_bonus_textbox(profession_id, skill, skill_id)
    profession = CharacterProfessionData.find(profession_id)
    text_field_tag "#{skill}-bonus", bonus(profession, skill_id),
                   :size => 3, :disabled => true, :class => 'editable-field',
                   :disabled => !has_skill?(profession, skill_id)

  end

  private

  def checked?(profession_id, skill_id)
    profession = CharacterProfessionData.find(profession_id)
    has_skill?(profession, skill_id)
  end

  def bonus(profession, skill_id)


    skill = profession.character_profession_skill_data.find(:first, :conditions =>  { :character_skill_data_id => skill_id })
    skill.bonus if skill

  end

  def has_skill?(profession, skill_id)
     profession.character_profession_skill_data.exists?(:character_skill_data_id => skill_id)
  end

end
