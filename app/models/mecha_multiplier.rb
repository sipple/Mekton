class MechaMultiplier < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_multiplier_data, optional: true

  # --- RPG Math ---

  def cost
    ((quantity || 1) * multiple * mecha.base_cost).round
  end

  def multiple
    mecha_multiplier_data&.multiple || 0
  end

  def quantity
    super || 1
  end
end
