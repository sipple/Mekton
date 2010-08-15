class AddDefenseAdjustmentToShieldData < ActiveRecord::Migration
  def self.up
    add_column :mecha_shield_data, :defense_adjustment, :integer
  end

  def self.down
    remove_column :mecha_shield_data, :defense_adjustment
  end
end
