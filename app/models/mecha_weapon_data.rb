class MechaWeaponData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(weapon: :asc) }
end
