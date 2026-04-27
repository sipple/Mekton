class MechaServoData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(servo: :asc) }

  has_many :mecha_servo_level_data, class_name: "MechaServoLevelData", dependent: :destroy
end
