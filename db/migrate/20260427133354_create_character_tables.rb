class CreateCharacterTables < ActiveRecord::Migration[8.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.integer :money
      t.integer :ip
      t.integer :intelligence
      t.integer :cool
      t.integer :reflexes
      t.integer :attractiveness
      t.integer :empathy
      t.integer :luck
      t.integer :move_allowance
      t.integer :body_type
      t.integer :education
      t.integer :tech_ability
      t.string :character_type
      t.integer :psi_ability
      t.text :notes
      t.boolean :disabled, default: false
      t.integer :psi_points, default: 0

      t.timestamps
    end

    create_table :character_armor_data do |t|
      t.string :armor
      t.string :stopping_power
      t.integer :cost
      t.float :weight
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :character_armors do |t|
      t.references :character_armor_data
      t.string :location
      t.references :character

      t.timestamps
    end

    create_table :character_equipment_data do |t|
      t.string :equipment
      t.float :weight
      t.integer :cost
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :character_equipments do |t|
      t.references :character_equipment_data
      t.integer :quantity
      t.references :character

      t.timestamps
    end

    create_table :character_profession_data do |t|
      t.string :profession

      t.timestamps
    end

    create_table :character_profession_skill_data do |t|
      t.references :character_profession_data
      t.references :character_skill_data
      t.integer :bonus

      t.timestamps
    end

    create_table :character_profession_skills do |t|
      t.references :character_profession_skill_data
      t.references :character

      t.timestamps
    end

    create_table :character_professions do |t|
      t.references :character_profession_data
      t.references :character

      t.timestamps
    end

    create_table :character_skill_data do |t|
      t.string :skill
      t.string :related_attribute
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :character_skills do |t|
      t.references :character_skill_data
      t.integer :level
      t.integer :ip_earned
      t.references :character

      t.timestamps
    end

    create_table :character_template_data do |t|
      t.string :template

      t.timestamps
    end

    create_table :character_template_skill_data do |t|
      t.references :character_template_data
      t.references :character_skill_data
      t.integer :bonus

      t.timestamps
    end

    create_table :character_template_skills do |t|
      t.references :character_template_skill_data
      t.integer :bonus
      t.references :character

      t.timestamps
    end

    create_table :character_templates do |t|
      t.references :character_template_data
      t.references :character

      t.timestamps
    end

    create_table :character_weapon_data do |t|
      t.string :weapon
      t.integer :weapon_adjustment
      t.string :range
      t.string :damage
      t.string :shots
      t.string :burst_value
      t.string :concealment
      t.float :weight
      t.integer :cost
      t.boolean :disabled, default: false

      t.timestamps
    end

    create_table :character_weapons do |t|
      t.references :character_weapon_data
      t.integer :quantity
      t.references :character

      t.timestamps
    end
  end
end
