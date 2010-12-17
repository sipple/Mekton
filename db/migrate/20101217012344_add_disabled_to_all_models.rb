class AddDisabledToAllModels < ActiveRecord::Migration
  def self.up
    add_column :characters, :disabled, :boolean, :default => false
    add_column :character_armor_data, :disabled, :boolean, :default => false
    add_column :character_equipment_data, :disabled, :boolean, :default => false
    add_column :character_skill_data, :disabled, :boolean, :default => false
    add_column :character_weapon_data, :disabled, :boolean, :default => false
    add_column :mechas, :disabled, :boolean, :default => false
    add_column :mecha_armor_data, :disabled, :boolean, :default => false
    add_column :mecha_movement_data, :disabled, :boolean, :default => false
    add_column :mecha_multiplier_data, :disabled, :boolean, :default => false
    add_column :mecha_sensor_data, :disabled, :boolean, :default => false
    add_column :mecha_servo_data, :disabled, :boolean, :default => false
    add_column :mecha_servo_level_data, :disabled, :boolean, :default => false
    add_column :mecha_shield_data, :disabled, :boolean, :default => false
    add_column :mecha_subassembly_data, :disabled, :boolean, :default => false
    add_column :mecha_weapon_data, :disabled, :boolean, :default => false

  end

  def self.down
    
    remove_column :characters, :disabled
    remove_column :character_armor_data, :disabled
    remove_column :character_equipment_data, :disabled
    remove_column :character_skill_data, :disabled
    remove_column :character_weapon_data, :disabled
    remove_column :mechas, :disabled, :boolean
    remove_column :mecha_armor_data, :disabled
    remove_column :mecha_movement_data, :disabled
    remove_column :mecha_multiplier_data, :disabled
    remove_column :mecha_sensor_data, :disabled
    remove_column :mecha_servo_data, :disabled
    remove_column :mecha_servo_level_data, :disabled
    remove_column :mecha_shield_data, :disabled
    remove_column :mecha_subassembly_data, :disabled
    remove_column :mecha_weapon_data, :disabled
    
  end
end
