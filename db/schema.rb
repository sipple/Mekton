# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100815200042) do

  create_table "character_armor_data", :force => true do |t|
    t.string   "armor"
    t.integer  "stopping_power"
    t.integer  "cost"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_armors", :force => true do |t|
    t.integer  "character_armor_data_id"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  create_table "character_equipment_data", :force => true do |t|
    t.string   "equipment"
    t.float    "weight"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_equipments", :force => true do |t|
    t.integer  "character_equipment_data_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  create_table "character_profession_data", :force => true do |t|
    t.string   "profession"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_profession_skill_data", :force => true do |t|
    t.integer  "character_profession_data_id"
    t.integer  "character_skill_data_id"
    t.integer  "bonus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_profession_skills", :force => true do |t|
    t.integer  "character_profession_skill_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  create_table "character_professions", :force => true do |t|
    t.integer  "character_profession_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  create_table "character_skill_data", :force => true do |t|
    t.string   "skill"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "related_attribute"
  end

  create_table "character_skills", :force => true do |t|
    t.integer  "character_skill_data_id"
    t.integer  "level"
    t.integer  "ip_earned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  create_table "character_template_data", :force => true do |t|
    t.string   "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_template_skill_data", :force => true do |t|
    t.integer  "character_template_data_id"
    t.integer  "character_skill_data_id"
    t.integer  "bonus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_template_skills", :force => true do |t|
    t.integer  "character_template_skill_data_id"
    t.integer  "bonus"
    t.integer  "character_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_templates", :force => true do |t|
    t.integer  "character_template_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  create_table "character_weapon_data", :force => true do |t|
    t.string   "weapon"
    t.integer  "weapon_adjustment"
    t.string   "range"
    t.string   "damage"
    t.string   "shots"
    t.string   "burst_value"
    t.string   "concealment"
    t.float    "weight"
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_weapons", :force => true do |t|
    t.integer  "character_weapon_data_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_id"
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "money"
    t.integer  "ip"
    t.integer  "intelligence"
    t.integer  "cool"
    t.integer  "reflexes"
    t.integer  "attractiveness"
    t.integer  "empathy"
    t.integer  "luck"
    t.integer  "move_allowance"
    t.integer  "body_type"
    t.integer  "education"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tech_ability"
  end

  create_table "mecha_additives", :force => true do |t|
    t.string   "system"
    t.float    "cost"
    t.string   "effect"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_armor_data", :force => true do |t|
    t.string   "armor"
    t.integer  "stopping_power"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
  end

  create_table "mecha_attribute_data", :force => true do |t|
    t.string   "attribute"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mecha_modifiers", :force => true do |t|
    t.integer  "mecha_attribute_data_id"
    t.float    "modifier"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_movement_data", :force => true do |t|
    t.string   "movement_system"
    t.float    "multiple"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mecha_movements", :force => true do |t|
    t.integer  "mecha_movement_data_id"
    t.integer  "mecha_servo_id"
    t.integer  "speed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_multipliers", :force => true do |t|
    t.string   "system"
    t.float    "multiplier"
    t.string   "effect"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_sensor_data", :force => true do |t|
    t.string   "sensor"
    t.string   "range"
    t.string   "communication_range"
    t.integer  "kills"
    t.float    "cost"
    t.float    "space"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
  end

  create_table "mecha_sensors", :force => true do |t|
    t.integer  "mecha_sensor_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_servo_data", :force => true do |t|
    t.string   "servo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mecha_servo_level_data", :force => true do |t|
    t.integer  "mecha_servo_data_id"
    t.string   "level"
    t.integer  "kills"
    t.float    "space"
    t.integer  "cost"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mecha_servos", :force => true do |t|
    t.integer  "mecha_servo_data_id"
    t.integer  "mecha_servo_level_data_id"
    t.integer  "kills"
    t.float    "space"
    t.integer  "mecha_armor_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_shield_data", :force => true do |t|
    t.string   "shield"
    t.integer  "stopping_power"
    t.float    "mounted_space"
    t.float    "handheld_space"
    t.float    "weight"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "defense_adjustment"
  end

  create_table "mecha_shields", :force => true do |t|
    t.integer  "mecha_shield_data_id"
    t.integer  "mecha_servo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_subassemblies", :force => true do |t|
    t.integer  "mecha_subassembly_data_id"
    t.integer  "mecha_servo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mecha_subassembly_data", :force => true do |t|
    t.string   "subassembly"
    t.float    "space"
    t.integer  "kills"
    t.float    "weight"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mecha_weapon_data", :force => true do |t|
    t.string   "weapon"
    t.integer  "weapon_adjustment"
    t.string   "range"
    t.string   "damage"
    t.string   "shots"
    t.integer  "kills"
    t.float    "space"
    t.float    "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "weight"
    t.string   "burst_value"
  end

  create_table "mecha_weapons", :force => true do |t|
    t.integer  "mecha_weapon_data_id"
    t.integer  "mecha_servo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mecha_id"
  end

  create_table "mechas", :force => true do |t|
    t.string   "name"
    t.integer  "character_id"
    t.integer  "mecha_servo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
