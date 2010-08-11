class CreateMechaSubassemblies < ActiveRecord::Migration
  def self.up
    create_table :mecha_subassemblies do |t|
      t.integer :mecha_subassembly_data_id
      t.integer :mecha_servo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_subassemblies
  end
end
