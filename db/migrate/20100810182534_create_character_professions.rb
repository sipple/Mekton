class CreateCharacterProfessions < ActiveRecord::Migration
  def self.up
    create_table :character_professions do |t|
      t.integer :character_profession_data_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_professions
  end
end
