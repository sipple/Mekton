class CreateMechaAttributeData < ActiveRecord::Migration
  def self.up
    create_table :mecha_attribute_data do |t|
      t.string :attribute

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_attribute_data
  end
end
