class MechaMovementData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'movement_system ASC'
end
