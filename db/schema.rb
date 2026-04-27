# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_27_143124) do
  create_table "character_armor_data", force: :cascade do |t|
    t.string "armor"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.string "stopping_power"
    t.datetime "updated_at", null: false
    t.float "weight"
  end

  create_table "character_armors", force: :cascade do |t|
    t.integer "character_armor_data_id"
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.string "location"
    t.datetime "updated_at", null: false
    t.index ["character_armor_data_id"], name: "index_character_armors_on_character_armor_data_id"
    t.index ["character_id"], name: "index_character_armors_on_character_id"
  end

  create_table "character_equipment_data", force: :cascade do |t|
    t.integer "cost"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.string "equipment"
    t.datetime "updated_at", null: false
    t.float "weight"
  end

  create_table "character_equipments", force: :cascade do |t|
    t.integer "character_equipment_data_id"
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["character_equipment_data_id"], name: "index_character_equipments_on_character_equipment_data_id"
    t.index ["character_id"], name: "index_character_equipments_on_character_id"
  end

  create_table "character_profession_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "profession"
    t.datetime "updated_at", null: false
  end

  create_table "character_profession_skill_data", force: :cascade do |t|
    t.integer "bonus"
    t.integer "character_profession_data_id"
    t.integer "character_skill_data_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_profession_data_id"], name: "idx_on_character_profession_data_id_5b64bd0956"
    t.index ["character_skill_data_id"], name: "idx_on_character_skill_data_id_eadde831d1"
  end

  create_table "character_profession_skills", force: :cascade do |t|
    t.integer "character_id"
    t.integer "character_profession_skill_data_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_profession_skills_on_character_id"
    t.index ["character_profession_skill_data_id"], name: "idx_on_character_profession_skill_data_id_4bcfb1cb3d"
  end

  create_table "character_professions", force: :cascade do |t|
    t.integer "character_id"
    t.integer "character_profession_data_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_professions_on_character_id"
    t.index ["character_profession_data_id"], name: "index_character_professions_on_character_profession_data_id"
  end

  create_table "character_skill_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.string "related_attribute"
    t.string "skill"
    t.datetime "updated_at", null: false
  end

  create_table "character_skills", force: :cascade do |t|
    t.integer "character_id"
    t.integer "character_skill_data_id"
    t.datetime "created_at", null: false
    t.integer "ip_earned"
    t.integer "level"
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["character_skill_data_id"], name: "index_character_skills_on_character_skill_data_id"
  end

  create_table "character_template_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "template"
    t.datetime "updated_at", null: false
  end

  create_table "character_template_skill_data", force: :cascade do |t|
    t.integer "bonus"
    t.integer "character_skill_data_id"
    t.integer "character_template_data_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_skill_data_id"], name: "index_character_template_skill_data_on_character_skill_data_id"
    t.index ["character_template_data_id"], name: "idx_on_character_template_data_id_97cadc01d2"
  end

  create_table "character_template_skills", force: :cascade do |t|
    t.integer "bonus"
    t.integer "character_id"
    t.integer "character_template_skill_data_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_template_skills_on_character_id"
    t.index ["character_template_skill_data_id"], name: "idx_on_character_template_skill_data_id_9d1df66e47"
  end

  create_table "character_templates", force: :cascade do |t|
    t.integer "character_id"
    t.integer "character_template_data_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_templates_on_character_id"
    t.index ["character_template_data_id"], name: "index_character_templates_on_character_template_data_id"
  end

  create_table "character_weapon_data", force: :cascade do |t|
    t.string "burst_value"
    t.string "concealment"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.string "damage"
    t.boolean "disabled", default: false
    t.string "range"
    t.string "shots"
    t.datetime "updated_at", null: false
    t.string "weapon"
    t.integer "weapon_adjustment"
    t.float "weight"
  end

  create_table "character_weapons", force: :cascade do |t|
    t.integer "character_id"
    t.integer "character_weapon_data_id"
    t.datetime "created_at", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_weapons_on_character_id"
    t.index ["character_weapon_data_id"], name: "index_character_weapons_on_character_weapon_data_id"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "age"
    t.integer "attractiveness"
    t.integer "body_type"
    t.string "character_type"
    t.integer "cool"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.integer "education"
    t.integer "empathy"
    t.integer "intelligence"
    t.integer "ip"
    t.integer "luck"
    t.integer "money"
    t.integer "move_allowance"
    t.string "name"
    t.text "notes"
    t.integer "psi_ability"
    t.integer "psi_points", default: 0
    t.integer "reflexes"
    t.integer "tech_ability"
    t.datetime "updated_at", null: false
  end

  create_table "mecha_additives", force: :cascade do |t|
    t.float "cost"
    t.datetime "created_at", null: false
    t.string "effect"
    t.integer "mecha_id"
    t.string "system"
    t.datetime "updated_at", null: false
    t.index ["mecha_id"], name: "index_mecha_additives_on_mecha_id"
  end

  create_table "mecha_armor_data", force: :cascade do |t|
    t.string "armor"
    t.float "cost"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.integer "stopping_power"
    t.datetime "updated_at", null: false
    t.float "weight"
  end

  create_table "mecha_attribute_data", force: :cascade do |t|
    t.string "attribute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mecha_modifiers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "mecha_attribute_data_id"
    t.integer "mecha_id"
    t.float "modifier"
    t.datetime "updated_at", null: false
    t.index ["mecha_attribute_data_id"], name: "index_mecha_modifiers_on_mecha_attribute_data_id"
    t.index ["mecha_id"], name: "index_mecha_modifiers_on_mecha_id"
  end

  create_table "mecha_movement_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.string "movement_system"
    t.float "multiple"
    t.datetime "updated_at", null: false
  end

  create_table "mecha_movements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.integer "mecha_id"
    t.integer "mecha_movement_data_id"
    t.integer "mecha_servo_id"
    t.integer "speed"
    t.datetime "updated_at", null: false
    t.index ["mecha_id"], name: "index_mecha_movements_on_mecha_id"
    t.index ["mecha_movement_data_id"], name: "index_mecha_movements_on_mecha_movement_data_id"
    t.index ["mecha_servo_id"], name: "index_mecha_movements_on_mecha_servo_id"
  end

  create_table "mecha_multiplier_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.float "multiple"
    t.string "multiplier"
    t.datetime "updated_at", null: false
  end

  create_table "mecha_multipliers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "mecha_id"
    t.integer "mecha_multiplier_data_id"
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["mecha_id"], name: "index_mecha_multipliers_on_mecha_id"
    t.index ["mecha_multiplier_data_id"], name: "index_mecha_multipliers_on_mecha_multiplier_data_id"
  end

  create_table "mecha_sensor_data", force: :cascade do |t|
    t.string "communication_range"
    t.float "cost"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.integer "kills"
    t.string "range"
    t.string "sensor"
    t.float "space"
    t.datetime "updated_at", null: false
    t.integer "weight"
  end

  create_table "mecha_sensors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.integer "mecha_id"
    t.integer "mecha_sensor_data_id"
    t.datetime "updated_at", null: false
    t.index ["mecha_id"], name: "index_mecha_sensors_on_mecha_id"
    t.index ["mecha_sensor_data_id"], name: "index_mecha_sensors_on_mecha_sensor_data_id"
  end

  create_table "mecha_servo_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.string "servo"
    t.datetime "updated_at", null: false
  end

  create_table "mecha_servo_level_data", force: :cascade do |t|
    t.integer "cost"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.integer "kills"
    t.string "level"
    t.integer "mecha_servo_data_id"
    t.float "space"
    t.datetime "updated_at", null: false
    t.float "weight"
    t.index ["mecha_servo_data_id"], name: "index_mecha_servo_level_data_on_mecha_servo_data_id"
  end

  create_table "mecha_servos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "kills"
    t.integer "mecha_armor_data_id"
    t.integer "mecha_id"
    t.integer "mecha_servo_data_id"
    t.integer "mecha_servo_level_data_id"
    t.float "space"
    t.datetime "updated_at", null: false
    t.index ["mecha_armor_data_id"], name: "index_mecha_servos_on_mecha_armor_data_id"
    t.index ["mecha_id"], name: "index_mecha_servos_on_mecha_id"
    t.index ["mecha_servo_data_id"], name: "index_mecha_servos_on_mecha_servo_data_id"
    t.index ["mecha_servo_level_data_id"], name: "index_mecha_servos_on_mecha_servo_level_data_id"
  end

  create_table "mecha_shield_data", force: :cascade do |t|
    t.float "cost"
    t.datetime "created_at", null: false
    t.integer "defense_adjustment"
    t.boolean "disabled", default: false
    t.float "handheld_space"
    t.float "mounted_space"
    t.string "shield"
    t.integer "stopping_power"
    t.datetime "updated_at", null: false
    t.float "weight"
  end

  create_table "mecha_shields", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.integer "mecha_id"
    t.integer "mecha_servo_id"
    t.integer "mecha_shield_data_id"
    t.datetime "updated_at", null: false
    t.index ["mecha_id"], name: "index_mecha_shields_on_mecha_id"
    t.index ["mecha_servo_id"], name: "index_mecha_shields_on_mecha_servo_id"
    t.index ["mecha_shield_data_id"], name: "index_mecha_shields_on_mecha_shield_data_id"
  end

  create_table "mecha_subassemblies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.integer "mecha_id"
    t.integer "mecha_servo_id"
    t.integer "mecha_subassembly_data_id"
    t.datetime "updated_at", null: false
    t.index ["mecha_id"], name: "index_mecha_subassemblies_on_mecha_id"
    t.index ["mecha_servo_id"], name: "index_mecha_subassemblies_on_mecha_servo_id"
    t.index ["mecha_subassembly_data_id"], name: "index_mecha_subassemblies_on_mecha_subassembly_data_id"
  end

  create_table "mecha_subassembly_data", force: :cascade do |t|
    t.float "cost"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.integer "kills"
    t.float "space"
    t.string "subassembly"
    t.datetime "updated_at", null: false
    t.float "weight"
  end

  create_table "mecha_weapon_data", force: :cascade do |t|
    t.string "burst_value"
    t.float "cost"
    t.datetime "created_at", null: false
    t.string "damage"
    t.boolean "disabled", default: false
    t.integer "kills"
    t.string "range"
    t.string "shots"
    t.float "space"
    t.datetime "updated_at", null: false
    t.string "weapon"
    t.integer "weapon_adjustment"
    t.float "weight"
  end

  create_table "mecha_weapons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.integer "mecha_id"
    t.integer "mecha_servo_id"
    t.integer "mecha_weapon_data_id"
    t.string "notes"
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["mecha_id"], name: "index_mecha_weapons_on_mecha_id"
    t.index ["mecha_servo_id"], name: "index_mecha_weapons_on_mecha_servo_id"
    t.index ["mecha_weapon_data_id"], name: "index_mecha_weapons_on_mecha_weapon_data_id"
  end

  create_table "mechas", force: :cascade do |t|
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.boolean "disabled", default: false
    t.integer "ma_bonus"
    t.integer "mecha_servo_id"
    t.integer "mp_bonus"
    t.integer "mv_bonus"
    t.string "name"
    t.text "notes"
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_mechas_on_character_id"
    t.index ["mecha_servo_id"], name: "index_mechas_on_mecha_servo_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
end
