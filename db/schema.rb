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

ActiveRecord::Schema.define(:version => 20100810183346) do

  create_table "character_armors", :force => true do |t|
    t.integer  "character_armor_data_id"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_equipments", :force => true do |t|
    t.integer  "character_equipment_data_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_profession_skills", :force => true do |t|
    t.integer  "character_profession_skill_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_professions", :force => true do |t|
    t.integer  "character_profession_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_skills", :force => true do |t|
    t.integer  "character_skill_data_id"
    t.integer  "level"
    t.integer  "ip_earned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_templates", :force => true do |t|
    t.integer  "character_template_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_weapons", :force => true do |t|
    t.integer  "character_weapon_data_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

end
