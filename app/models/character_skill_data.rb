class CharacterSkillData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(skill: :asc) }

  def self.mecha_piloting
    find_by("skill LIKE ?", "%Mecha Piloting%")
  end

  def self.mecha_fighting
    find_by("skill LIKE ?", "%Mecha Fighting%")
  end

  def self.mecha_melee
    find_by("skill LIKE ?", "%Mecha Melee%")
  end

  def self.mecha_gunnery
    find_by("skill LIKE ?", "%Mecha Gunnery%")
  end

  def self.mecha_missiles
    find_by("skill LIKE ?", "%Mecha Missiles%")
  end
end
