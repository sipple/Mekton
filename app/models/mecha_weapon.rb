class MechaWeapon < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_weapon_data
end
