class MechaSensorData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'sensor ASC'
end
