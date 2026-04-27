class CharacterArmorDataController < ApplicationController
  before_action :set_armor, only: [:show, :edit, :update, :destroy]

  def index
    @armors = CharacterArmorData.active
  end

  def show; end
  def new; @armor = CharacterArmorData.new; end
  def edit; end

  def create
    @armor = CharacterArmorData.new(armor_params)
    if @armor.save
      redirect_to character_armor_data_index_path, notice: "Armor data created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @armor.update(armor_params)
      redirect_to character_armor_data_index_path, notice: "Armor data updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @armor.update!(disabled: true)
    redirect_to character_armor_data_index_path, notice: "Armor data disabled."
  end

  private

  def set_armor
    @armor = CharacterArmorData.find(params[:id])
  end

  def armor_params
    params.require(:character_armor_data).permit(:armor, :stopping_power, :cost, :weight, :disabled)
  end
end
