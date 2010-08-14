class MechaShield < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_shield_data
end
