class CharacterArmorDataController < ApplicationController
  def index
    @armors = CharacterArmorData.active(:order => "armor")
  end

  def show
    @armor = CharacterArmorData.find(params[:id])
  end

  def new
    @armor = CharacterArmorData.new
  end

  def edit
    @armor = CharacterArmorData.find(params[:id])
  end

  def create
    @armor = CharacterArmorData.new(params[:character_armor_data])

    if @armor.save
      redirect_to(character_armor_data_index_path)
    end

  end

  def update
    @armor = CharacterArmorData.find(params[:id])
    @armor.update_attributes(params[:character_armor_data])
    redirect_to(character_armor_data_index_path)


  end

  def destroy
    @armor = CharacterArmorData.find(params[:id])
    @armor.disabled = true
    if @armor.save
      redirect_to(character_armor_data_index_path)
    end
  end

end
