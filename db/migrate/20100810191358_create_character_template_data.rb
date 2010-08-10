class CreateCharacterTemplateData < ActiveRecord::Migration
  def self.up
    create_table :character_template_data do |t|
      t.string :template

      t.timestamps
    end
  end

  def self.down
    drop_table :character_template_data
  end
end
