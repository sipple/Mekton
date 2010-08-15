class AddBurstValueToWeaponData < ActiveRecord::Migration
  def self.up
    add_column :mecha_weapon_data, :burst_value, :string
  end

  def self.down
    remove_column :mecha_weapon_data, :burst_value
  end
end
