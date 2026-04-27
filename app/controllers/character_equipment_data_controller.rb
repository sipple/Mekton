class CharacterEquipmentDataController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  def index; @equipments = CharacterEquipmentData.active; end
  def show; end
  def new; @equipment = CharacterEquipmentData.new; end
  def edit; end

  def create
    @equipment = CharacterEquipmentData.new(equipment_params)
    if @equipment.save
      redirect_to character_equipment_data_index_path, notice: "Equipment data created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @equipment.update(equipment_params)
      redirect_to character_equipment_data_index_path, notice: "Equipment data updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @equipment.update!(disabled: true)
    redirect_to character_equipment_data_index_path, notice: "Equipment data disabled."
  end

  private

  def set_equipment
    @equipment = CharacterEquipmentData.find(params[:id])
  end

  def equipment_params
    params.require(:character_equipment_data).permit(:equipment, :weight, :cost, :disabled)
  end
end
