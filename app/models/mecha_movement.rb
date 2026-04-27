class MechaMovement < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_movement_data, optional: true
  belongs_to :mecha_servo, optional: true

  # --- RPG Math ---

  def cost
    movement_cost_and_space.round
  end

  def space
    movement_cost_and_space.round
  end

  def weight
    0
  end

  def movement_system
    mecha_movement_data&.movement_system
  end

  private

  def movement_cost_and_space
    return 0 unless mecha_movement_data

    ((speed || 0) * mecha.weight * mecha_movement_data.multiple)
  end
end
