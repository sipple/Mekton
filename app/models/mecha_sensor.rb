class MechaSensor < ActiveRecord::Base
  belongs_to :mecha
  belongs_to :mecha_sensor_data

  def weight
    self.mecha_sensor_data ? self.mecha_sensor_data.weight : 0
  end

  def cost
    self.mecha_sensor_data ? self.mecha_sensor_data.cost : 0
  end

end
