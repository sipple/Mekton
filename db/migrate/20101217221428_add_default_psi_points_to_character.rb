class AddDefaultPsiPointsToCharacter < ActiveRecord::Migration
  def self.up
    remove_column :characters, :psi_points
    add_column :characters, :psi_points, :integer, :default => 0
  end

  def self.down
    remove_column :characters, :psi_points
    add_column :characters, :psi_points, :integer
  end
end
