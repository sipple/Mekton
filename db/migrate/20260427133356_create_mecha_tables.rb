class CreateMechaTables < ActiveRecord::Migration[8.0]
  def change
    create_table :mechas do |t|
      t.string :name
      t.references :character
      t.references :mecha_servo
      t.integer :mv_bonus
      t.integer :ma_bonus
      t.integer :mp_bonus
      t.text :notes
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_additives do |t|
      t.string :system
      t.float :cost
      t.string :effect
      t.references :mecha

      t.timestamps
    end

    create_table :mecha_armor_data do |t|
      t.string :armor
      t.integer :stopping_power
      t.float :cost
      t.float :weight
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_attribute_data do |t|
      t.string :attribute

      t.timestamps
    end

    create_table :mecha_modifiers do |t|
      t.references :mecha_attribute_data
      t.float :modifier
      t.references :mecha

      t.timestamps
    end

    create_table :mecha_movement_data do |t|
      t.string :movement_system
      t.float :multiple
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_movements do |t|
      t.references :mecha_movement_data
      t.references :mecha_servo
      t.integer :speed
      t.references :mecha
      t.string :location

      t.timestamps
    end

    create_table :mecha_multiplier_data do |t|
      t.string :multiplier
      t.float :multiple
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_multipliers do |t|
      t.references :mecha_multiplier_data
      t.integer :quantity
      t.references :mecha

      t.timestamps
    end

    create_table :mecha_sensor_data do |t|
      t.string :sensor
      t.string :range
      t.string :communication_range
      t.integer :kills
      t.float :cost
      t.float :space
      t.integer :weight
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_sensors do |t|
      t.references :mecha_sensor_data
      t.references :mecha
      t.string :location

      t.timestamps
    end

    create_table :mecha_servo_data do |t|
      t.string :servo
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_servo_level_data do |t|
      t.references :mecha_servo_data
      t.string :level
      t.integer :kills
      t.float :space
      t.integer :cost
      t.float :weight
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_servos do |t|
      t.references :mecha_servo_data
      t.references :mecha_servo_level_data
      t.integer :kills
      t.float :space
      t.references :mecha_armor_data
      t.references :mecha

      t.timestamps
    end

    create_table :mecha_shield_data do |t|
      t.string :shield
      t.integer :stopping_power
      t.float :mounted_space
      t.float :handheld_space
      t.float :weight
      t.float :cost
      t.integer :defense_adjustment
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_shields do |t|
      t.references :mecha_shield_data
      t.references :mecha_servo
      t.references :mecha
      t.string :location

      t.timestamps
    end

    create_table :mecha_subassembly_data do |t|
      t.string :subassembly
      t.float :space
      t.integer :kills
      t.float :weight
      t.float :cost
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_subassemblies do |t|
      t.references :mecha_subassembly_data
      t.references :mecha_servo
      t.references :mecha
      t.string :location

      t.timestamps
    end

    create_table :mecha_weapon_data do |t|
      t.string :weapon
      t.integer :weapon_adjustment
      t.string :range
      t.string :damage
      t.string :shots
      t.integer :kills
      t.float :space
      t.float :cost
      t.float :weight
      t.string :burst_value
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :mecha_weapons do |t|
      t.references :mecha_weapon_data
      t.references :mecha_servo
      t.references :mecha
      t.integer :quantity
      t.string :notes
      t.string :location

      t.timestamps
    end
  end
end
