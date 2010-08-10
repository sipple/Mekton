class CreateCharacterTemplates < ActiveRecord::Migration
  def self.up
    create_table :character_templates do |t|
      t.integer :character_template_data_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_templates
  end
end
