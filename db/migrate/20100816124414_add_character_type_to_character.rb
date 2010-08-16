class AddCharacterTypeToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :character_type, :string
  end

  def self.down
    remove_column :characters, :character_type
  end
end
