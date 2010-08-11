class CreateMechaWeapons < ActiveRecord::Migration
  def self.up
    create_table :mecha_weapons do |t|
      t.integer :mecha_weapon_data_id
      t.integer :mecha_servo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_weapons
  end
end
