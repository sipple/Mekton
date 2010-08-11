class CreateMechaSensorData < ActiveRecord::Migration
  def self.up
    create_table :mecha_sensor_data do |t|
      t.string :sensor
      t.string :range
      t.string :communication_range
      t.integer :kills
      t.float :cost
      t.float :space

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_sensor_data
  end
end
