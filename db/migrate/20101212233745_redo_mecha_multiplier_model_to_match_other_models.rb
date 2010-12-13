class RedoMechaMultiplierModelToMatchOtherModels < ActiveRecord::Migration
  def self.up
    drop_table :mecha_multipliers

    create_table :mecha_multipliers do |t|
      t.integer :mecha_multiplier_data_id
      t.integer :quantity

      t.timestamps
    end
    create_table :mecha_multiplier_data do |t|
      t.string :multiplier
      t.float :multiple

      t.timestamps
        end
  end


  def self.down
    drop_table :mecha_multipliers
    drop_table :mecha_multiplier_data
    create_table :mecha_multipliers do |t|
      t.string :system
      t.float :multiplier
      t.string :effect

      t.timestamps
    end
  end
end
