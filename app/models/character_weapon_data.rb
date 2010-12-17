class CharacterWeaponData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}
end
