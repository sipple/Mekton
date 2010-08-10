class CreateCharacterEquipmentData < ActiveRecord::Migration
  def self.up
    create_table :character_equipment_data do |t|
      t.string :equipment
      t.float :weight
      t.integer :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :character_equipment_data
  end
end
