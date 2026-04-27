# frozen_string_literal: true

class MechaArmorDataController < ApplicationController
  before_action :set_armor, only: [:show, :edit, :update, :destroy]

  # GET /mecha_armor_data
  def index
    @armors = MechaArmorData.active
  end

  # GET /mecha_armor_data/:id
  def show
  end

  # GET /mecha_armor_data/new
  def new
    @armor = MechaArmorData.new
  end

  # GET /mecha_armor_data/:id/edit
  def edit
  end

  # POST /mecha_armor_data
  def create
    @armor = MechaArmorData.new(mecha_armor_data_params)

    if @armor.save
      redirect_to mecha_armor_data_index_path, notice: "Armor data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_armor_data/:id
  def update
    if @armor.update(mecha_armor_data_params)
      redirect_to mecha_armor_data_index_path, notice: "Armor data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_armor_data/:id
  def destroy
    @armor.update!(disabled: true)
    redirect_to mecha_armor_data_index_path, notice: "Armor data was successfully archived."
  end

  private

  def set_armor
    @armor = MechaArmorData.find(params[:id])
  end

  def mecha_armor_data_params
    params.require(:mecha_armor_data).permit(
      :armor, :stopping_power, :cost, :weight
    )
  end
end
