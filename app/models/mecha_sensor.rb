class MechaSensor < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_sensor_data
end
