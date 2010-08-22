module Mekton
  class SelectOptions

    def get_options(model, id)

      hash = ActiveSupport::OrderedHash.new("")
      hash[""] = ""

      case model
        when "character_armors" then options = get_armor_options(id, hash)
        
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

  end
end