class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.integer :money
      t.integer :ip
      t.integer :intelligence
      t.integer :cool
      t.integer :reflexes
      t.integer :attractiveness
      t.integer :empathy
      t.integer :luck
      t.integer :move_allowance
      t.integer :body_type
      t.integer :education

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
