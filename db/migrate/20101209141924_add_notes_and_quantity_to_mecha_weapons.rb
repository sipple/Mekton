class AddNotesAndQuantityToMechaWeapons < ActiveRecord::Migration
  def self.up
    add_column :mecha_weapons, :quantity, :integer
    add_column :mecha_weapons, :notes, :string
  end

  def self.down
    remove_column :mecha_weapons, :quantity
    remove_column :mecha_weapons, :notes
  end
end
