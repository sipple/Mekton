class AddWeightToWeaponData < ActiveRecord::Migration
  def self.up
    add_column :mecha_weapon_data, :weight, :float
  end

  def self.down
    remove_column :mecha_weapon_data, :weight
  end
end
