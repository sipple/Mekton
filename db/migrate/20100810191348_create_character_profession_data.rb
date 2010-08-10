class CreateCharacterProfessionData < ActiveRecord::Migration
  def self.up
    create_table :character_profession_data do |t|
      t.string :profession

      t.timestamps
    end
  end

  def self.down
    drop_table :character_profession_data
  end
end
