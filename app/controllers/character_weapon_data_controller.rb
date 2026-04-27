class CharacterWeaponDataController < ApplicationController
  before_action :set_weapon, only: [:show, :edit, :update, :destroy]

  def index; @weapons = CharacterWeaponData.active; end
  def show; end
  def new; @weapon = CharacterWeaponData.new; end
  def edit; end

  def create
    @weapon = CharacterWeaponData.new(weapon_params)
    if @weapon.save
      redirect_to character_weapon_data_index_path, notice: "Weapon data created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @weapon.update(weapon_params)
      redirect_to character_weapon_data_index_path, notice: "Weapon data updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @weapon.update!(disabled: true)
    redirect_to character_weapon_data_index_path, notice: "Weapon data disabled."
  end

  private

  def set_weapon
    @weapon = CharacterWeaponData.find(params[:id])
  end

  def weapon_params
    params.require(:character_weapon_data).permit(:weapon, :weapon_adjustment, :range, :damage, :shots, :burst_value, :concealment, :weight, :cost, :disabled)
  end
end
