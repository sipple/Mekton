class MechaServoLevelData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'level asc'

  belongs_to :mecha_servo_data
end
