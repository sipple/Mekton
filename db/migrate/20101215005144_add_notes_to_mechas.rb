class AddNotesToMechas < ActiveRecord::Migration
  def self.up
    add_column :mechas, :notes, :text
  end

  def self.down
    remove_columns :mechas, :notes
  end
end
