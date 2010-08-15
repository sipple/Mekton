class AddTechAbilityToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :tech_ability, :integer
  end

  def self.down
    remove_column :characters, :tech_ability
  end
end
