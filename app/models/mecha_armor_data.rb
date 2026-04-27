class MechaArmorData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(armor: :asc) }
end
