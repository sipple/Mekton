class MechaShield < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_shield_data, optional: true
  belongs_to :mecha_servo, optional: true

  # --- RPG Math ---

  def weight
    mecha_shield_data&.weight || 0
  end

  def cost
    mecha_shield_data&.cost || 0
  end
end
