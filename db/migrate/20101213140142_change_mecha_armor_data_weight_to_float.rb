class ChangeMechaArmorDataWeightToFloat < ActiveRecord::Migration
  def self.up
    change_table :mecha_armor_data do |t|
      t.change :weight, :float
    end
  end

  def self.down
    change_table :mecha_armor_data do |t|
      t.change :weight, :integer
    end
  end
end
