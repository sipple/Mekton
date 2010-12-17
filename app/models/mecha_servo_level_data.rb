class MechaServoLevelData < ActiveRecord::Base
  include Mekton::NamedScopes

  belongs_to :mecha_servo_data
end
