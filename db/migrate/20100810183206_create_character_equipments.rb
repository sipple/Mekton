class CreateCharacterEquipments < ActiveRecord::Migration
  def self.up
    create_table :character_equipments do |t|
      t.integer :character_equipment_data_id
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :character_equipments
  end
end
