class MechaWeapon < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_weapon_data
  belongs_to :mecha_servo

  def cost
    (self.quantity || 0) * self.mecha_weapon_data.cost if self.mecha_weapon_data
  end

  def space
    (self.quantity || 0) * self.mecha_weapon_data.space if self.mecha_weapon_data
  end

  def weight
    (self.quantity || 0) * self.mecha_weapon_data.weight if self.mecha_weapon_data
  end

end
