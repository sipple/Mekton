class AddLocationToMechaMovement < ActiveRecord::Migration
  def self.up
    add_column :mecha_movements, :location, :string
  end

  def self.down
    remove_column :mecha_movements, :location
  end
end
