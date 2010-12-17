class MechaSubassemblyData < ActiveRecord::Base
  named_scope :active, :conditions => {:disabled => false}

  def weight
    super || 0
  end

end
