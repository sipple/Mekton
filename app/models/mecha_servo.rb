class MechaServo < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_servo_data
  belongs_to :mecha_servo_level_data
  belongs_to :mecha_armor_data

  def weight
    servo_weight + armor_weight
  end

  def cost
    servo_cost + armor_cost
  end

  def servo_weight
    self.mecha_servo_level_data ? self.mecha_servo_level_data.weight : 0
  end

  def armor_weight
    self.mecha_armor_data ? self.mecha_armor_data.weight : 0
  end

  def servo_cost
    self.mecha_servo_level_data ? self.mecha_servo_level_data.cost : 0
  end

  def armor_cost
    self.mecha_armor_data ? self.mecha_armor_data.cost : 0
  end
end
