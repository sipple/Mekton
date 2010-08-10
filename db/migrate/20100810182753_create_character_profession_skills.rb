class CreateCharacterProfessionSkills < ActiveRecord::Migration
  def self.up
    create_table :character_profession_skills do |t|
      t.integer :character_profession_skill_data_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_profession_skills
  end
end
