class AddWeightToSensorData < ActiveRecord::Migration
  def self.up
    add_column :mecha_sensor_data, :weight, :integer
  end

  def self.down
    remove_column :mecha_sensor_data, :weight
  end
end
