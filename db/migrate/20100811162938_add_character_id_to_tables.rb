class AddCharacterIdToTables < ActiveRecord::Migration
  def self.up
    add_column :character_armors ,:character_id, :integer
    add_column :character_equipments ,:character_id, :integer
    add_column :character_profession_skills ,:character_id, :integer
    add_column :character_professions ,:character_id, :integer
    add_column :character_skills ,:character_id, :integer
    add_column :character_templates ,:character_id, :integer
    add_column :character_weapons ,:character_id, :integer

  end

  def self.down
    remove_column :character_armors ,:character_id
    remove_column :character_equipments ,:character_id
    remove_column :character_profession_skills ,:character_id
    remove_column :character_professions ,:character_id
    remove_column :character_skills ,:character_id
    remove_column :character_templates ,:character_id
    remove_column :character_weapons ,:character_id
  end
end
