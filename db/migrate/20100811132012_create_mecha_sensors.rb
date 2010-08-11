class CreateMechaSensors < ActiveRecord::Migration
  def self.up
    create_table :mecha_sensors do |t|
      t.integer :mecha_sensor_data_id
      t.intetger :mecha_servo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_sensors
  end
end
