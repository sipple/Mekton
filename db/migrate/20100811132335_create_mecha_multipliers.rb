class CreateMechaMultipliers < ActiveRecord::Migration
  def self.up
    create_table :mecha_multipliers do |t|
      t.string :system
      t.float :multiplier
      t.string :effect

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_multipliers
  end
end
