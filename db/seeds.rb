# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Mekton RPG — Seed data from static CSV reference tables.
# All SQL injection vulnerabilities from the original Rails 2.3.5 seeds have been fixed:
#   - String interpolation in conditions replaced with parameterized find_by! lookups
#   - RAILS_ROOT replaced with Rails.root.join
#   - CSV::Reader/CSV::Writer replaced with Ruby stdlib CSV

require "csv"

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

# Read a CSV file from db/seed_data/ as an array of rows (each row is an array of strings).
def csv(file)
  CSV.read(Rails.root.join("db", "seed_data", file))
end

# Replace skill names in a template CSV with their database IDs.
# Writes the result to a new CSV file, which is then consumed by seed_linked_model.
#
# template_file  - input CSV with skill names in the specified column
# output_file    - output CSV with skill names replaced by CharacterSkillData IDs
# skill_row_index - the column index containing the skill name to resolve
def set_skill_ids(template_file, output_file, skill_row_index)
  output_path = Rails.root.join("db", "seed_data", output_file)

  CSV.open(output_path, "w") do |output_csv|
    csv(template_file).each do |row|
      output_row = row.each_with_index.map do |value, index|
        if index == skill_row_index
          # Parameterized lookup — NO string interpolation (fixes SQL injection)
          CharacterSkillData.find_by!(skill: value).id.to_s
        else
          value
        end
      end
      output_csv << output_row
    end
  end
end

# Seed a flat model from a CSV file using a column index mapping.
def seed_model(model, file, field_mapping_hash)
  model.delete_all
  csv(file).each do |row|
    model.create!(row_hash(field_mapping_hash, row))
  end
end

# Seed child records that belong to an already-seeded parent model.
# Each row's first column identifies the parent record via search_field.
def seed_children_models(parent_model, children_models, children_model_files, field_mapping_hashes, search_field)
  children_models.each do |child_model|
    field_mapping_hash = field_mapping_hashes[child_model]
    foreign_key = :"#{parent_model.name.underscore}_id"

    csv(children_model_files[child_model]).each do |row|
      # Parameterized lookup — fixes SQL injection from original
      #   find(:first, :conditions => "#{search_field} = '#{row[0]}'")
      parent_record = parent_model.find_by!(search_field => row[0])

      attributes = row_hash(field_mapping_hash, row)
      attributes[foreign_key] = parent_record.id
      child_model.create!(attributes)
    end
  end
end

# Seed a parent model and its children in one transaction.
# Deletes existing children first, then parent records, then re-seeds both.
def seed_linked_model(parent_model, parent_file, children_models, children_model_files, field_mapping_hashes, search_field)
  delete_children_models(children_models)
  parent_model.delete_all

  seed_model(parent_model, parent_file, field_mapping_hashes[parent_model])
  seed_children_models(parent_model, children_models, children_model_files, field_mapping_hashes, search_field)
end

# Build a hash of attribute_name => csv_column_value for a given row.
def row_hash(field_mapping_hash, row)
  field_mapping_hash.to_h { |key, index| [key, row[index]] }
end

# Delete all records for each child model (used before re-seeding).
def delete_children_models(children_models)
  children_models.each(&:delete_all)
end

# ===========================================================================
# Character Seeds
# ===========================================================================
#
# Order matters: skill data must be seeded before profession/template data,
# because set_skill_ids resolves skill names into skill IDs.

seed_model(CharacterArmorData, "character_armor_data.csv",
           { armor: 0, stopping_power: 1, weight: 2, cost: 3 })

seed_model(CharacterEquipmentData, "character_equipment_data.csv",
           { equipment: 0, weight: 1, cost: 2 })

seed_model(CharacterSkillData, "character_skill_data.csv",
           { skill: 0, related_attribute: 1 })

seed_model(CharacterWeaponData, "character_weapon_data.csv",
           { weapon: 0, weapon_adjustment: 1, range: 2, damage: 3,
             shots: 4, burst_value: 5, concealment: 6, weight: 7, cost: 8 })

# CharacterProfessionData — skill names resolved to IDs via set_skill_ids
set_skill_ids("character_profession_skill_data_template.csv",
              "character_profession_skill_data.csv", 1)

seed_linked_model(
  CharacterProfessionData,
  "character_profession_data.csv",
  [CharacterProfessionSkillData],
  { CharacterProfessionSkillData => "character_profession_skill_data.csv" },
  {
    CharacterProfessionData => { profession: 0 },
    CharacterProfessionSkillData => { character_skill_data_id: 1, bonus: 2 }
  },
  :profession
)

# CharacterTemplateData — skill names resolved to IDs via set_skill_ids
set_skill_ids("character_template_skill_data_template.csv",
              "character_template_skill_data.csv", 1)

seed_linked_model(
  CharacterTemplateData,
  "character_template_data.csv",
  [CharacterTemplateSkillData],
  { CharacterTemplateSkillData => "character_template_skill_data.csv" },
  {
    CharacterTemplateData => { template: 0 },
    CharacterTemplateSkillData => { character_skill_data_id: 1, bonus: 2 }
  },
  :template
)

# ===========================================================================
# Mecha Seeds
# ===========================================================================

seed_model(MechaArmorData, "mecha_armor_data.csv",
           { armor: 0, cost: 1, stopping_power: 2, weight: 3 })

seed_model(MechaMovementData, "mecha_movement_data.csv",
           { movement_system: 0, multiple: 1 })

seed_model(MechaSensorData, "mecha_sensor_data.csv",
           { sensor: 0, cost: 1, space: 2, kills: 3, weight: 4,
             range: 5, communication_range: 6 })

seed_linked_model(
  MechaServoData,
  "mecha_servo_data.csv",
  [MechaServoLevelData],
  { MechaServoLevelData => "mecha_servo_level_data.csv" },
  {
    MechaServoData => { servo: 0 },
    MechaServoLevelData => { level: 1, cost: 2, space: 3, kills: 4, weight: 5 }
  },
  :servo
)

seed_model(MechaShieldData, "mecha_shield_data.csv",
           { shield: 0, defense_adjustment: 1, stopping_power: 2, cost: 3,
             mounted_space: 4, handheld_space: 5, weight: 6 })

seed_model(MechaSubassemblyData, "mecha_subassembly_data.csv",
           { subassembly: 0, cost: 1, space: 2 })

seed_model(MechaWeaponData, "mecha_weapon_data.csv",
           { weapon: 0, range: 1, weapon_adjustment: 2, damage: 3, kills: 4,
             burst_value: 5, shots: 6, weight: 7, space: 8, cost: 9 })
