class CreateMechas < ActiveRecord::Migration
  def self.up
    create_table :mechas do |t|
      t.string :name
      t.integer :character_id
      t.integer :mecha_servo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mechas
  end
end
