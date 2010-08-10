class CreateCharacterSkillData < ActiveRecord::Migration
  def self.up
    create_table :character_skill_data do |t|
      t.string :skill
      t.bool :hard

      t.timestamps
    end
  end

  def self.down
    drop_table :character_skill_data
  end
end
