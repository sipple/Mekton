class MechaSubassembly < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_subassembly_data
end
