class CreateMechaServoData < ActiveRecord::Migration
  def self.up
    create_table :mecha_servo_data do |t|
      t.string :servo

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_servo_data
  end
end
