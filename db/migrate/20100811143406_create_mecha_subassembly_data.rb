class CreateMechaSubassemblyData < ActiveRecord::Migration
  def self.up
    create_table :mecha_subassembly_data do |t|
      t.string :subassembly
      t.float :space
      t.integer :kills
      t.float :weight
      t.float :cost

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_subassembly_data
  end
end
