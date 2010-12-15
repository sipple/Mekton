class AddNotesAndPsiToCharacters < ActiveRecord::Migration
  def self.up
    add_column :characters, :psi_ability, :integer
    add_column :characters, :notes, :text
  end

  def self.down
    remove_column :characters, :psi_ability
    remove_column :characters, :notes
  end
end
