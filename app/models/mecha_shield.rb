class MechaShield < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_shield_data

  def weight
    self.mecha_shield_data ? self.mecha_shield_data.weight : 0
  end

end
