class MechaSubassemblyData < ActiveRecord::Base

  def weight
    super || 0
  end

end
