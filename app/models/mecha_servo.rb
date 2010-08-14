class MechaServo < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_servo_data
  belongs_to :mecha_servo_level_data
  belongs_to :mecha_armor_data
end
