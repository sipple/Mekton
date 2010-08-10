class CreateCharacterWeapons < ActiveRecord::Migration
  def self.up
    create_table :character_weapons do |t|
      t.integer :character_weapon_data_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :character_weapons
  end
end
