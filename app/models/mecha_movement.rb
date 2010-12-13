class MechaMovement < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_movement_data

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
    self.mecha_movement_data ? self.mecha_movement_data.movement_system : nil
  end

  private

  def movement_cost_and_space
    self.mecha_movement_data ? ((self.speed || 0) * self.mecha.weight * self.mecha_movement_data.multiple) : 0
  end

end
