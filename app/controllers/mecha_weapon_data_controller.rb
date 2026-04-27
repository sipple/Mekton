# frozen_string_literal: true

class MechaWeaponDataController < ApplicationController
  before_action :set_weapon, only: [:show, :edit, :update, :destroy]

  # GET /mecha_weapon_data
  def index
    @weapons = MechaWeaponData.active
  end

  # GET /mecha_weapon_data/:id
  def show
  end

  # GET /mecha_weapon_data/new
  def new
    @weapon = MechaWeaponData.new
  end

  # GET /mecha_weapon_data/:id/edit
  def edit
  end

  # POST /mecha_weapon_data
  def create
    @weapon = MechaWeaponData.new(mecha_weapon_data_params)

    if @weapon.save
      redirect_to mecha_weapon_data_index_path, notice: "Weapon data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_weapon_data/:id
  def update
    if @weapon.update(mecha_weapon_data_params)
      redirect_to mecha_weapon_data_index_path, notice: "Weapon data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_weapon_data/:id
  def destroy
    @weapon.update!(disabled: true)
    redirect_to mecha_weapon_data_index_path, notice: "Weapon data was successfully archived."
  end

  private

  def set_weapon
    @weapon = MechaWeaponData.find(params[:id])
  end

  def mecha_weapon_data_params
    params.require(:mecha_weapon_data).permit(
      :weapon, :weapon_adjustment, :range, :damage, :shots,
      :kills, :space, :weight, :cost, :burst_value
    )
  end
end
