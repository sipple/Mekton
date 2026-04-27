class MechaMovementData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(movement_system: :asc) }
end
