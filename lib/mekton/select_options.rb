module Mekton
  class SelectOptions

    def get_options(model, id)

      hash = ActiveSupport::OrderedHash.new("")
      hash[""] = ""

      case model
        when "character_armors" then options = get_armor_options(id, hash)
        when "character_weapons" then options = get_weapon_options(id, hash)
        when "character_equipments" then options = get_equipment_options(id, hash)
        when "character_skills" then options = get_skill_options(id, hash)
        
      end

      options
    end

    private

    def get_armor_options(id, hash)
      character_armor = CharacterArmor.find(id)
      CharacterArmorData.all(:order => 'armor').each {|armor_data| hash[armor_data.id.to_s] = armor_data.armor}
      if character_armor.character_armor_data_id
        hash["selected"] = character_armor.character_armor_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_weapon_options(id, hash)
      character_weapon = CharacterWeapon.find(id)
      CharacterWeaponData.all(:order => 'weapon').each {|weapon_data| hash[weapon_data.id.to_s] = weapon_data.weapon}
      if character_weapon.character_weapon_data_id
        hash["selected"] = character_weapon.character_weapon_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_equipment_options(id, hash)
      character_equipment = CharacterEquipment.find(id)
      CharacterEquipmentData.all(:order => 'equipment').each {|equipment_data| hash[equipment_data.id.to_s] = equipment_data.equipment}
      if character_equipment.character_equipment_data_id
        hash["selected"] = character_equipment.character_equipment_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_skill_options(id, hash)
      character_skill = CharacterSkill.find(id)
      CharacterSkillData.all(:order => 'skill').each {|skill_data| hash[skill_data.id.to_s] = skill_data.skill}
      if character_skill.character_skill_data_id
        hash["selected"] = character_skill.character_skill_data_id
      else
        hash["selected"] = ""
      end

      hash      
    end

  end
end