class CharacterEquipmentData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'equipment ASC'
end
