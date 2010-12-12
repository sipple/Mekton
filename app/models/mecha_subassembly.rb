class MechaSubassembly < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_subassembly_data

  def weight
    self.mecha_subassembly_data ? self.mecha_subassembly_data.weight : 0
  end

end
