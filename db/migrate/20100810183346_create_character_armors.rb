class CreateCharacterArmors < ActiveRecord::Migration
  def self.up
    create_table :character_armors do |t|
      t.integer :character_armor_data_id
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :character_armors
  end
end
