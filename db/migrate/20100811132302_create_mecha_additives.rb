class CreateMechaAdditives < ActiveRecord::Migration
  def self.up
    create_table :mecha_additives do |t|
      t.string :system
      t.float :cost
      t.string :effect

      t.timestamps
    end
  end

  def self.down
    drop_table :mecha_additives
  end
end
