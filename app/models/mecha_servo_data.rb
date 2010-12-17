class MechaServoData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}

  has_many :mecha_servo_level_data
end
