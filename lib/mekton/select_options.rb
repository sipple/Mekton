module Mekton
  class SelectOptions

    def get_options(model, id)

      hash = ActiveSupport::OrderedHash.new("")
      hash[""] = ""

      send("get_#{model}_options", id, hash)
    end

    private

    def get_character_armors_options(id, hash)
      character_armor = CharacterArmor.find(id)
      CharacterArmorData.all(:order => 'armor').each {|armor_data| hash[armor_data.id.to_s] = armor_data.armor}
      if character_armor.character_armor_data_id
        hash["selected"] = character_armor.character_armor_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_character_weapons_options(id, hash)
      character_weapon = CharacterWeapon.find(id)
      CharacterWeaponData.all(:order => 'weapon').each {|weapon_data| hash[weapon_data.id.to_s] = weapon_data.weapon}
      if character_weapon.character_weapon_data_id
        hash["selected"] = character_weapon.character_weapon_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_character_equipments_options(id, hash)
      character_equipment = CharacterEquipment.find(id)
      CharacterEquipmentData.all(:order => 'equipment').each {|equipment_data| hash[equipment_data.id.to_s] = equipment_data.equipment}
      if character_equipment.character_equipment_data_id
        hash["selected"] = character_equipment.character_equipment_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_character_skills_options(id, hash)
      character_skill = CharacterSkill.find(id)
      CharacterSkillData.all(:order => 'skill').each {|skill_data| hash[skill_data.id.to_s] = skill_data.skill}
      if character_skill.character_skill_data_id
        hash["selected"] = character_skill.character_skill_data_id
      else
        hash["selected"] = ""
      end

      hash      
    end

    def get_mecha_servos_options(id, hash)
      mecha_servo = MechaServo.find(id)
      MechaServoData.all(:order => 'servo').each {|servo_data| hash[servo_data.id.to_s] = servo_data.servo}
      if mecha_servo.mecha_servo_data_id
        hash["selected"] = mecha_servo.mecha_servo_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

  end
end