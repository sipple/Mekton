class AddLocationAsTextFieldToModels < ActiveRecord::Migration
  def self.up
    add_column :mecha_weapons, :location, :string
    add_column :mecha_sensors, :location, :string
    add_column :mecha_subassemblies, :location, :string
    add_column :mecha_shields, :location, :string
  end

  def self.down
    remove_column :mecha_weapons, :location
    remove_column :mecha_sensors, :location
    remove_column :mecha_subassemblies, :location
    remove_column :mecha_shields, :location

  end
end
