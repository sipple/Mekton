class MechaMultiplier < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_multiplier_data

  def cost
    ((self.quantity || 1) * multiple * self.mecha.base_cost).round
  end

  def multiple
    self.mecha_multiplier_data ? self.mecha_multiplier_data.multiple : 0
  end

end
