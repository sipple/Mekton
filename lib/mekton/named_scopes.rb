module Mekton
  module NamedScopes
    named_scope :active, :conditions => {:disabled => false}
    named_scope :inactive, :conditions => {:disabled => true}
  end
end