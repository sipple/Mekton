class MechaServoData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'servo ASC'

  has_many :mecha_servo_level_data
end
