class MechaSubassemblyData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}, :order => 'subassembly ASC'

  def weight
    super || 0
  end

end
