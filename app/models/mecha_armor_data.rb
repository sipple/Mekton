class MechaArmorData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'armor ASC'
end
