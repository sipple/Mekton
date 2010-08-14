class MechaMovement < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_movement_data
end
