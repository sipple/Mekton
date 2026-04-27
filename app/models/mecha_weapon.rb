class MechaWeapon < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_weapon_data, optional: true
  belongs_to :mecha_servo, optional: true

  # --- RPG Math (quantity-aware) ---

  def cost
    mecha_weapon_data ? ((quantity || 1) * mecha_weapon_data.cost) : 0
  end

  def space
    mecha_weapon_data ? ((quantity || 1) * mecha_weapon_data.space) : 0
  end

  def weight
    mecha_weapon_data ? ((quantity || 1) * mecha_weapon_data.weight) : 0
  end
end
