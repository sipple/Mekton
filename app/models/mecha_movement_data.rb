class MechaMovementData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'movement ASC'
end
