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
      CharacterArmorData.active(:order => 'armor').each {|armor_data| hash[armor_data.id.to_s] = armor_data.armor}
      if character_armor.character_armor_data_id
        hash["selected"] = character_armor.character_armor_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_character_weapons_options(id, hash)
      character_weapon = CharacterWeapon.find(id)
      CharacterWeaponData.active(:order => 'weapon').each {|weapon_data| hash[weapon_data.id.to_s] = weapon_data.weapon}
      if character_weapon.character_weapon_data_id
        hash["selected"] = character_weapon.character_weapon_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_character_equipments_options(id, hash)
      character_equipment = CharacterEquipment.find(id)
      CharacterEquipmentData.active(:order => 'equipment').each {|equipment_data| hash[equipment_data.id.to_s] = equipment_data.equipment}
      if character_equipment.character_equipment_data_id
        hash["selected"] = character_equipment.character_equipment_data_id
      else
        hash["selected"] = ""
      end

      hash
    end

    def get_character_skills_options(id, hash)
      character_skill = CharacterSkill.find(id)
      CharacterSkillData.active(:order => 'skill').each {|skill_data| hash[skill_data.id.to_s] = skill_data.skill}
      if character_skill.character_skill_data_id
        hash["selected"] = character_skill.character_skill_data_id
      else
        hash["selected"] = ""
      end

      hash      
    end

    def get_mecha_servo_data_options(id, hash)
      mecha_servo = MechaServo.find(id)
      MechaServoData.active(:order => 'servo').each {|servo_data| hash[servo_data.id.to_s] = servo_data.servo}
      if mecha_servo.mecha_servo_data_id
        hash["selected"] = mecha_servo.mecha_servo_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_servo_level_data_options(id, hash)
      mecha_servo = MechaServo.find(id)
      mecha_servo.mecha_servo_data.mecha_servo_level_data.active(:order => 'kills').
          each {|servo_level_data| hash[servo_level_data.id.to_s] = servo_level_data.level}

      if mecha_servo.mecha_servo_level_data_id
        hash["selected"] = mecha_servo.mecha_servo_level_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_armor_data_options(id, hash)
      mecha_servo = MechaServo.find(id)
      MechaArmorData.active(:order => 'stopping_power').each {|armor_data| hash[armor_data.id.to_s] = armor_data.armor}
      if mecha_servo.mecha_armor_data_id
        hash["selected"] = mecha_servo.mecha_armor_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_weapon_data_options(id, hash)
      mecha_weapon = MechaWeapon.find(id)
      MechaWeaponData.active.each {|weapon_data| hash[weapon_data.id.to_s] = weapon_data.weapon}
      if mecha_weapon.mecha_weapon_data_id
        hash["selected"] = mecha_weapon.mecha_weapon_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_sensor_data_options(id, hash)
      mecha_sensor = MechaSensor.find(id)
      MechaSensorData.active(:order => 'sensor').each {|sensor_data| hash[sensor_data.id.to_s] = sensor_data.sensor}
      if mecha_sensor.mecha_sensor_data_id
        hash["selected"] = mecha_sensor.mecha_sensor_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_subassembly_data_options(id, hash)
      mecha_subassembly = MechaSubassembly.find(id)
      MechaSubassemblyData.all(:order => 'subassembly').each {|subassembly_data| hash[subassembly_data.id.to_s] = subassembly_data.subassembly}
      if mecha_subassembly.mecha_subassembly_data_id
        hash["selected"] = mecha_subassembly.mecha_subassembly_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_shield_data_options(id, hash)
      mecha_shield = MechaShield.find(id)
      MechaShieldData.active(:order => 'stopping_power').each {|shield_data| hash[shield_data.id.to_s] = shield_data.shield}
      if mecha_shield.mecha_shield_data_id
        hash["selected"] = mecha_shield.mecha_shield_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_movement_data_options(id, hash)
      mecha_movement = MechaMovement.find(id)
      MechaMovementData.active(:order => 'multiple').each {|movement_data| hash[movement_data.id.to_s] = movement_data.movement_system}
      if mecha_movement.mecha_movement_data_id
        hash["selected"] = mecha_movement.mecha_movement_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_mecha_multiplier_data_options(id, hash)
      mecha_multiplier = MechaMultiplier.find(id)
      MechaMultiplierData.active(:order => 'multiplier').each {|multiplier_data| hash[multiplier_data.id.to_s] = multiplier_data.multiplier}
      if mecha_multiplier.mecha_multiplier_data_id
        hash["selected"] = mecha_multiplier.mecha_multiplier_data_id
      else
        hash["selected"] = ""
      end
      hash
    end

    def get_character_options(id, hash)
      hash.delete("")
      mecha = Mecha.find(id)
      Character.active.each {|character| hash[character.id.to_s] = character.name}
      hash["selected"] = mecha.character_id
      hash
    end

  end
end