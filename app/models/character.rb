class Character < ApplicationRecord
  scope :active, -> { where(disabled: false).order(name: :asc) }

  has_many :character_armors, dependent: :destroy
  has_many :character_equipments, dependent: :destroy
  has_many :character_profession_skills, dependent: :destroy
  has_many :character_professions, dependent: :destroy
  has_many :character_skills, dependent: :destroy
  has_many :character_template_skills, dependent: :destroy
  has_many :character_weapons, dependent: :destroy

  has_one :character_template, dependent: :destroy

  # --- RPG Math: Skill Points ---

  def skill_points
    (intelligence || 0) + (education || 0) + 10
  end

  # --- RPG Math: Secondary Body Type Values ---

  def secondary_body_type_values
    case body_type
    when 2
      { head: 4, torso: 8, limbs: 6, stun: 4, lift: 20, throw: "6m", damage: -2, ev: 2 }
    when 3..4
      { head: 5, torso: 10, limbs: 7, stun: 5, lift: 40, throw: "12m", damage: -1, ev: 2 }
    when 5..7
      { head: 6, torso: 12, limbs: 9, stun: 6, lift: 60, throw: "20m", damage: 0, ev: 4 }
    when 8..9
      { head: 7, torso: 14, limbs: 10, stun: 7, lift: 90, throw: "26m", damage: 1, ev: 6 }
    when 10
      { head: 8, torso: 16, limbs: 12, stun: 8, lift: 120, throw: "30m", damage: 2, ev: 8 }
    else
      {}
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

  # --- RPG Math: Derived Stats ---

  def stability
    (cool * 2.5).truncate
  end

  def run
    move_allowance * 3
  end

  def jump
    (move_allowance / 4).truncate
  end

  def running_jump
    (run / 4).truncate
  end

  def anime_leap
    move_allowance * 2
  end

  # --- RPG Math: Mecha Skills (no SQL injection) ---

  def mecha_piloting
    skill = character_skills.find_by(character_skill_data_id: CharacterSkillData.mecha_piloting&.id)
    skill&.level || 0
  end

  def mecha_fighting
    skill = character_skills.find_by(character_skill_data_id: CharacterSkillData.mecha_fighting&.id)
    skill&.level || 0
  end

  def mecha_melee
    skill = character_skills.find_by(character_skill_data_id: CharacterSkillData.mecha_melee&.id)
    skill&.level || 0
  end

  def mecha_gunnery
    skill = character_skills.find_by(character_skill_data_id: CharacterSkillData.mecha_gunnery&.id)
    skill&.level || 0
  end

  def mecha_missiles
    skill = character_skills.find_by(character_skill_data_id: CharacterSkillData.mecha_missiles&.id)
    skill&.level || 0
  end

  # --- RPG Math: Maneuver Pool ---

  def maneuver_pool
    mecha_piloting >= 5 ? (mecha_piloting - 5) : 0
  end
end
