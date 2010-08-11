class CreateMechaWeaponData < ActiveRecord::Migration
  def self.up
    create_table :mecha_weapon_data do |t|
      t.string :weapon
      t.integer :weapon_adjustment
      t.string :range
      t.string :damage
      t.string :shots
      t.integer :kills
      t.float :space
      t.float :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_weapon_data
  end
end
