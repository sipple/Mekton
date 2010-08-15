# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

require 'csv'

def csv(file)
  CSV::Reader.parse(File.open("#{RAILS_ROOT}/db/seed_data/#{file}", 'r'))
end

def seed_model(model, file, field_mapping_hash)
  model.delete_all
  csv(file).each do |row|
    model.create!(row_hash(field_mapping_hash, row))
  end
end

def row_hash(field_mapping_hash, row)
  hash = {}
  field_mapping_hash.each do |k,v|
     hash[k] = row[v]
  end
  hash
end


# Character Seeds
seed_model(CharacterArmorData, "character_armor_data.csv",
           {:armor => 0, :stopping_power => 1, :weight => 2, :cost => 3})

seed_model(CharacterEquipmentData, "character_armor_data.csv",
          {:equipment => 0, :weight => 1, :cost => 2})

seed_model(CharacterSkillData, "character_skill_data.csv", {
        :skill => 0, :related_attribute => 1})

seed_model(CharacterWeaponData, "character_weapon_data.csv", {
        :weapon => 0, :weapon_adjustment => 1, :range => 2, :damage => 3, :shots => 4, :burst_value => 5,
        :concealment => 6, :weight => 7, :cost => 8})

# Mecha Seeds
seed_model(MechaArmorData, "mecha_armor_data.csv", {
        :armor => 0, :cost => 1, :stopping_power => 2, :weight => 3})

seed_model(MechaMovementData, "mecha_movement_data.csv", {
        :movement_system => 0, :multiple => 1})

seed_model(MechaSensorData, "mecha_sensor_data.csv", {
        :sensor => 0, :cost => 1, :space => 2, :kills => 3, :weight => 4, :range => 5, :communication_range => 6})

