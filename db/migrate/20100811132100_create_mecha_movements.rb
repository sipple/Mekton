class CreateMechaMovements < ActiveRecord::Migration
  def self.up
    create_table :mecha_movements do |t|
      t.integer :mecha_movement_data_id
      t.integer :mecha_servo_id
      t.integer :speed

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_movements
  end
end
