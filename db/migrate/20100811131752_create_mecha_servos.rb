class CreateMechaServos < ActiveRecord::Migration
  def self.up
    create_table :mecha_servos do |t|
      t.integer :mecha_servo_data_id
      t.integer :mecha_servo_level_data_id
      t.integer :kills
      t.float :space
      t.integer :mecha_armor_data_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_servos
  end
end
