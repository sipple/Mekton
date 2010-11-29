class CharacterSkillData < ActiveRecord::Base

  def self.mecha_piloting
    self.find(:first, :conditions => "skill like '%Mecha Piloting%'")
  end
  def self.mecha_fighting
    self.find(:first, :conditions => "skill like '%Mecha Fighting%'")
  end
  def self.mecha_melee
    self.find(:first, :conditions => "skill like '%Mecha Melee%'")
  end
  def self.mecha_missiles
    self.find(:first, :conditions => "skill like '%Mecha Missiles%'")
  end
  def self.mecha_gunnery
    self.find(:first, :conditions => "skill like '%Mecha Gunnery%'")
  end

end
