class MechaSensor < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_sensor_data, optional: true

  # --- RPG Math ---

  def weight
    mecha_sensor_data&.weight || 0
  end

  def cost
    mecha_sensor_data&.cost || 0
  end
end
