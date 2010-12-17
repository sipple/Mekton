module Mekton
  module NamedScopes
    ActiveRecord::Base.named_scope :active, :conditions => {:disabled => false}
    ActiveRecord::Base.named_scope :inactive, :conditions => {:disabled => true}
  end
end