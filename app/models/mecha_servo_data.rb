class MechaServoData < ActiveRecord::Base
  include Mekton::NamedScopes

  has_many :mecha_servo_level_data
end
