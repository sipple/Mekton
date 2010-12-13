class MechaWeapon < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_weapon_data
  belongs_to :mecha_servo

  def cost
    self.mecha_weapon_data ? ((self.quantity || 1) * self.mecha_weapon_data.cost) : 0
  end

  def space
    self.mecha_weapon_data ? ((self.quantity || 1) * self.mecha_weapon_data.space) : 0
  end

  def weight
    self.mecha_weapon_data ? ((self.quantity || 1) * self.mecha_weapon_data.weight) : 0
  end

end
