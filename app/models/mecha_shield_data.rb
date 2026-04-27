class MechaShieldData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(shield: :asc) }

  def space
    "#{mounted_space}M\\#{handheld_space}H"
  end
end
