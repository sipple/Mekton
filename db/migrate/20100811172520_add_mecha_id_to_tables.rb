class AddMechaIdToTables < ActiveRecord::Migration
  def self.up
    add_column :mecha_additives ,:mecha_id, :integer
    add_column :mecha_modifiers ,:mecha_id, :integer
    add_column :mecha_movements ,:mecha_id, :integer
    add_column :mecha_multipliers ,:mecha_id, :integer
    add_column :mecha_sensors ,:mecha_id, :integer
    add_column :mecha_servos ,:mecha_id, :integer
    add_column :mecha_shields ,:mecha_id, :integer
    add_column :mecha_subassemblies ,:mecha_id, :integer
    add_column :mecha_weapons ,:mecha_id, :integer
  end

  def self.down
    remove_column :mecha_additives ,:mecha_id
    remove_column :mecha_modifiers ,:mecha_id
    remove_column :mecha_movements ,:mecha_id
    remove_column :mecha_multipliers ,:mecha_id
    remove_column :mecha_sensors ,:mecha_id
    remove_column :mecha_servos ,:mecha_id
    remove_column :mecha_shields ,:mecha_id
    remove_column :mecha_subassemblies ,:mecha_id
    remove_column :mecha_weapons ,:mecha_id
  end
end
