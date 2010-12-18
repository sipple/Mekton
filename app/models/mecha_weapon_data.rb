class MechaWeaponData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'weapon ASC'
end
