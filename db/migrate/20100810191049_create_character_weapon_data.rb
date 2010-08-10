class CreateCharacterWeaponData < ActiveRecord::Migration
  def self.up
    create_table :character_weapon_data do |t|
      t.string :weapon
      t.integer :weapon_adjustment
      t.string :range
      t.string :damage
      t.string :shots
      t.string :burst_value
      t.string :concealment
      t.float :weight
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :character_weapon_data
  end
end
