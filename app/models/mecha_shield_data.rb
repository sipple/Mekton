class MechaShieldData < ActiveRecord::Base
  include Mekton::NamedScopes

  def space
    "#{self.mounted_space}M\\#{self.handheld_space}H"
  end

end
