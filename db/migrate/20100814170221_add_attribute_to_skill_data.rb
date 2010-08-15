class AddAttributeToSkillData < ActiveRecord::Migration
  def self.up
    add_column :character_skill_data, :related_attribute, :string
  end

  def self.down
    remove_column :character_skill_data, :related_attribute
  end
end
