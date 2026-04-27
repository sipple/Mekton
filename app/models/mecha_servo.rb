class MechaServo < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_servo_data, optional: true
  belongs_to :mecha_servo_level_data, optional: true
  belongs_to :mecha_armor_data, optional: true

  # --- RPG Math: Weight ---

  def weight
    servo_weight + armor_weight
  end

  def servo_weight
    mecha_servo_level_data&.weight || 0
  end

  def armor_weight
    mecha_armor_data&.weight || 0
  end

  # --- RPG Math: Cost ---

  def cost
    servo_cost + armor_cost
  end

  def servo_cost
    mecha_servo_level_data&.cost || 0
  end

  def armor_cost
    mecha_armor_data&.cost || 0
  end
end
