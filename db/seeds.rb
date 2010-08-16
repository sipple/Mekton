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

def set_skill_ids(template_file, output_file, skill_row_index)

  new_csv_file = File.open("#{RAILS_ROOT}/db/seed_data/#{output_file}", 'wb')

  CSV::Writer.generate(new_csv_file) do |new_csv|
    csv(template_file).each do |row|

      new_csv_row = []
      row.each_index do |index|

        if index == skill_row_index
          skill = CharacterSkillData.find(:first, :conditions => "skill = '#{row[index]}'")
          new_csv_row << skill.id
        else
          new_csv_row << row[index]
        end
      end
      new_csv << new_csv_row
    end
    new_csv_file.close
  end
end


def seed_model(model, file, field_mapping_hash)
  model.delete_all
  csv(file).each do |row|
    model.create!(row_hash(field_mapping_hash, row))
  end
end

def seed_children_models(parent_model, children_models, children_model_files, field_mapping_hashes, search_field)

  children_models.each do |child_model|

    field_mapping_hash = field_mapping_hashes[child_model]

    csv(children_model_files[child_model]).each do |row|
      parent_record = parent_model.find(:first, :conditions => "#{search_field} = '#{row[0]}'")
      foreign_key = ("#{parent_model.name.underscore}_id").to_sym

      record_creation_hash = row_hash(field_mapping_hash, row)
      record_creation_hash[foreign_key] = parent_record.id
      child_model.create!(record_creation_hash)
    end

  end
  
end

def seed_linked_model(parent_model, parent_file, children_models, children_model_files, field_mapping_hashes, search_field)
  delete_children_models(children_models)
  parent_model.delete_all

  seed_model(parent_model, parent_file, field_mapping_hashes[parent_model])

  seed_children_models(parent_model, children_models, children_model_files, field_mapping_hashes, search_field)
  
end

def row_hash(field_mapping_hash, row)
  hash = {}
  field_mapping_hash.each do |k,v|
     hash[k] = row[v]
  end
  hash
end

def delete_children_models(children_models)
  children_models.each do |model|
    model.delete_all
  end
end


# Character Seeds
seed_model(CharacterArmorData, "character_armor_data.csv",
           {:armor => 0, :stopping_power => 1, :weight => 2, :cost => 3})

  seed_model(CharacterEquipmentData, "character_equipment_data.csv",
            {:equipment => 0, :weight => 1, :cost => 2})

seed_model(CharacterSkillData, "character_skill_data.csv", {
        :skill => 0, :related_attribute => 1})

seed_model(CharacterWeaponData, "character_weapon_data.csv", {
        :weapon => 0, :weapon_adjustment => 1, :range => 2, :damage => 3, :shots => 4, :burst_value => 5,
        :concealment => 6, :weight => 7, :cost => 8})

# CharacterProfessioNData and CharacterTemplateData have to seed after seeding the needed skills to the database
set_skill_ids('character_profession_skill_data_template.csv', "character_profession_skill_data.csv", 1)
seed_linked_model(CharacterProfessionData, 'character_profession_data.csv', [CharacterProfessionSkillData], {
        CharacterProfessionSkillData => "character_profession_skill_data.csv"}, {CharacterProfessionSkillData => {
        :character_skill_data_id => 1, :bonus => 2}, CharacterProfessionData => {:profession => 0}}, "profession")

set_skill_ids('character_template_skill_data_template.csv', 'character_template_skill_data.csv', 1)
seed_linked_model(CharacterTemplateData, 'character_template_data.csv', [CharacterTemplateSkillData], {
        CharacterTemplateSkillData => 'character_template_skill_data.csv'}, {CharacterTemplateData => {
        :template => 0}, CharacterTemplateSkillData => {:character_skill_data_id => 1, :bonus => 2}}, "template")

# Mecha Seeds
seed_model(MechaArmorData, "mecha_armor_data.csv", {
        :armor => 0, :cost => 1, :stopping_power => 2, :weight => 3})

seed_model(MechaMovementData, "mecha_movement_data.csv", {
        :movement_system => 0, :multiple => 1})

seed_model(MechaSensorData, "mecha_sensor_data.csv", {
        :sensor => 0, :cost => 1, :space => 2, :kills => 3, :weight => 4, :range => 5, :communication_range => 6})

seed_linked_model(MechaServoData, "mecha_servo_data.csv", [MechaServoLevelData],
                  {MechaServoLevelData => "mecha_servo_level_data.csv"}, {MechaServoData => {
                :servo => 0}, MechaServoLevelData => {
                :level => 1, :cost => 2, :space => 3, :kills => 4, :weight => 5}}, 'servo')

seed_model(MechaShieldData, "mecha_shield_data.csv", {
        :shield => 0, :defense_adjustment => 1, :stopping_power => 2, :cost => 3, :mounted_space => 4,
        :handheld_space => 5, :weight => 6})

seed_model(MechaSubassemblyData, "mecha_subassembly_data.csv", {
        :subassembly => 0, :cost => 1, :space => 2})

seed_model(MechaWeaponData, "mecha_weapon_data.csv", {
        :weapon => 0, :range => 1, :weapon_adjustment => 2, :damage => 3, :kills => 4, :burst_value => 5,
        :shots => 6, :weight => 7, :space => 8, :cost => 9})







