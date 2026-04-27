class MechaSubassembly < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_subassembly_data, optional: true
  belongs_to :mecha_servo, optional: true

  # --- RPG Math ---

  def weight
    mecha_subassembly_data&.weight || 0
  end

  def cost
    mecha_subassembly_data&.cost || 0
  end
end
