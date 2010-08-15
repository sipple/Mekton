class CreateCharacterTemplateSkills < ActiveRecord::Migration
  def self.up
    create_table :character_template_skills do |t|
      t.integer :character_template_skill_data_id
      t.integer :bonus
      t.integer :character_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_template_skills
  end
end
