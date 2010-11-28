class Character < ActiveRecord::Base
  has_many :character_armors
  has_many :character_equipments
  has_many :character_profession_skills
  has_many :character_professions
  has_many :character_skills
  has_many :character_template_skills
  has_many :character_weapons

  has_one :character_template

  def skill_points
    (self.intelligence || 0) + (self.education || 0) + 10
  end

  def secondary_body_type_values

    case self.body_type
      when 2
        {:head => 4, :torso => 8, :limbs => 6, :stun => 4, :lift => 20, :throw => "6m", :damage => -2, :ev => 2}
      when 3..4
        {:head => 5, :torso => 10, :limbs => 7, :stun => 5, :lift => 40, :throw => "12m", :damage => -1, :ev => 2}
      when 5..7
        {:head => 6, :torso => 12, :limbs => 9, :stun => 6, :lift => 60, :throw => "20m", :damage => 0, :ev => 4}
      when 8..9
        {:head => 7, :torso => 14, :limbs => 10, :stun => 7, :lift => 90, :throw => "26m", :damage => 1, :ev => 6}
      when 10
        {:head => 8, :torso => 16, :limbs => 12, :stun => 8, :lift => 120, :throw => "30m", :damage => 2, :ev => 8}
    end
  end

  def head
    secondary_body_type_values[:head]
  end

  def torso
    secondary_body_type_values[:torso]
  end

  def limbs
    secondary_body_type_values[:limbs]
  end

  def stun
    secondary_body_type_values[:stun]
  end

  def lift
    secondary_body_type_values[:lift]
  end

  def throw_distance
    secondary_body_type_values[:throw]
  end

  def melee_damage_mod
    secondary_body_type_values[:damage]
  end

  def ev
    secondary_body_type_values[:ev]
  end

  def stability
    (self.cool * 2.5).truncate
  end

  def run
    self.move_allowance * 3
  end

  def jump
    (self.move_allowance / 4).truncate
  end

  def running_jump
    (self.run / 4).truncate
  end

  def anime_leap
    self.move_allowance * 2
  end

  def mecha_piloting
    piloting_skill = self.character_skills.
            find(:first, :conditions => "character_skill_data_id = #{CharacterSkillData.mecha_piloting.id}")

    piloting_skill.nil? ? 0 : piloting_skill.level

  end


end
