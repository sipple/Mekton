class CreateMechaMovementData < ActiveRecord::Migration
  def self.up
    create_table :mecha_movement_data do |t|
      t.string :movement_system
      t.float :multiple

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_movement_data
  end
end
