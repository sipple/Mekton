class CreateMechaServoLevelData < ActiveRecord::Migration
  def self.up
    create_table :mecha_servo_level_data do |t|
      t.integer :mecha_servo_data_id
      t.string :level
      t.integer :kills
      t.float :space
      t.integer :cost
      t.float :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_servo_level_data
  end
end
