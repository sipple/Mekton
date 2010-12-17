class MechaMovementData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}
end
