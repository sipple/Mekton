class CreateMechaModifiers < ActiveRecord::Migration
  def self.up
    create_table :mecha_modifiers do |t|
      t.integer :mecha_attribute_data_id
      t.bool :multiply
      t.float :modifier

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_modifiers
  end
end
