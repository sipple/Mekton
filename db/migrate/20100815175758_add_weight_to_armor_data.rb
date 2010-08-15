class AddWeightToArmorData < ActiveRecord::Migration
  def self.up
    add_column :mecha_armor_data, :weight, :integer
  end

  def self.down
    remove_column :mecha_armor_data, :weight
  end
end
