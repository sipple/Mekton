class CharacterEquipmentDataController < ApplicationController
  def index
    @equipments = CharacterEquipmentData.active(:order => "equipment")
  end

  def show
    @equipment = CharacterEquipmentData.find(params[:id])
  end

  def new
    @equipment = CharacterEquipmentData.new
  end

  def edit
    @equipment = CharacterEquipmentData.find(params[:id])
  end

  def create
    @equipment = CharacterEquipmentData.new(params[:character_equipment_data])

    if @equipment.save
      redirect_to(character_equipment_data_index_path)
    end

  end

  def update
    @equipment = CharacterEquipmentData.find(params[:id])
    @equipment.update_attributes(params[:character_equipment_data])
    redirect_to(character_equipment_data_index_path)


  end

  def destroy
    @equipment = CharacterEquipmentData.find(params[:id])
    @equipment.disabled = true
    if @equipment.save
      redirect_to(character_equipment_data_index_path)
    end
  end

end
