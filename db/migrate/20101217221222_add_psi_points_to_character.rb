class AddPsiPointsToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :psi_points, :integer
  end

  def self.down
    remove_column :characters, :psi_points
  end
end
