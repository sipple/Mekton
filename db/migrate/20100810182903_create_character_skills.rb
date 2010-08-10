class CreateCharacterSkills < ActiveRecord::Migration
  def self.up
    create_table :character_skills do |t|
      t.integer :character_skill_data_id
      t.integer :level
      t.integer :ip_earned

      t.timestamps
    end
  end

  def self.down
    drop_table :character_skills
  end
end
