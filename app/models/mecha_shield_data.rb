class MechaShieldData < ActiveRecord::Base

  def space
    "#{self.mounted_space}M\\#{self.handheld_space}H"
  end

end
