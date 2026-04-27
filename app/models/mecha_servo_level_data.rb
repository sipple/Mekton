class MechaServoLevelData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(level: :asc) }

  belongs_to :mecha_servo_data, optional: true
end
