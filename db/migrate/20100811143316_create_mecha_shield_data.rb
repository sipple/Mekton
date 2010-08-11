class CreateMechaShieldData < ActiveRecord::Migration
  def self.up
    create_table :mecha_shield_data do |t|
      t.string :shield
      t.integer :stopping_power
      t.float :mounted_space
      t.float :handheld_space
      t.float :weight
      t.float :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_shield_data
  end
end
