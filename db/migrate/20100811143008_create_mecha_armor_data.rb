class CreateMechaArmorData < ActiveRecord::Migration
  def self.up
    create_table :mecha_armor_data do |t|
      t.string :armor
      t.integer :stopping_power
      t.float :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_armor_data
  end
end
