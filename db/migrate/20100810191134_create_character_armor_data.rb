class CreateCharacterArmorData < ActiveRecord::Migration
  def self.up
    create_table :character_armor_data do |t|
      t.string :armor
      t.integer :stopping_power
      t.integer :cost
      t.float :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :character_armor_data
  end
end
