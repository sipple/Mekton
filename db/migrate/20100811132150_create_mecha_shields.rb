class CreateMechaShields < ActiveRecord::Migration
  def self.up
    create_table :mecha_shields do |t|
      t.integer :mecha_shield_data_id
      t.bool :mounted
      t.integer :mecha_servo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_shields
  end
end
