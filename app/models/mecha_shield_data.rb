class MechaShieldData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}

  def space
    "#{self.mounted_space}M\\#{self.handheld_space}H"
  end

end
