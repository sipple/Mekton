class MechaMultiplierData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'multiplier ASC'

end