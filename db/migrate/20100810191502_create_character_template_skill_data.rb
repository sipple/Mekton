class CreateCharacterTemplateSkillData < ActiveRecord::Migration
  def self.up
    create_table :character_template_skill_data do |t|
      t.integer :character_template_data_id
      t.integer :character_skill_data_id
      t.integer :bonus

      t.timestamps
    end
  end

  def self.down
    drop_table :character_template_skill_data
  end
end
