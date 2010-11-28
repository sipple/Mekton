class CharacterSkillData < ActiveRecord::Base

  def self.mecha_piloting
    self.find(:first, :conditions => "skill like '%Mecha Piloting%'")
  end

end
