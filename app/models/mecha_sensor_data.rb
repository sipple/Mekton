class MechaSensorData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(sensor: :asc) }
end
