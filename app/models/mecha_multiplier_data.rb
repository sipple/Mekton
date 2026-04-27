class MechaMultiplierData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(multiplier: :asc) }
end
