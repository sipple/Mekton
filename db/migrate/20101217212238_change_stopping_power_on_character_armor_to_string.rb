class ChangeStoppingPowerOnCharacterArmorToString < ActiveRecord::Migration
  def self.up
    change_table :character_armor_data do |t|
      t.change :stopping_power, :string
    end
  end

  def self.down
    change_table :character_armor_data do |t|
      t.change :stopping_power, :integer
    end
  end
end
