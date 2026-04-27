# frozen_string_literal: true

class MechaShieldDataController < ApplicationController
  before_action :set_shield, only: [:show, :edit, :update, :destroy]

  # GET /mecha_shield_data
  def index
    @shields = MechaShieldData.active
  end

  # GET /mecha_shield_data/:id
  def show
  end

  # GET /mecha_shield_data/new
  def new
    @shield = MechaShieldData.new
  end

  # GET /mecha_shield_data/:id/edit
  def edit
  end

  # POST /mecha_shield_data
  def create
    @shield = MechaShieldData.new(mecha_shield_data_params)

    if @shield.save
      redirect_to mecha_shield_data_index_path, notice: "Shield data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_shield_data/:id
  def update
    if @shield.update(mecha_shield_data_params)
      redirect_to mecha_shield_data_index_path, notice: "Shield data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_shield_data/:id
  def destroy
    @shield.update!(disabled: true)
    redirect_to mecha_shield_data_index_path, notice: "Shield data was successfully archived."
  end

  private

  def set_shield
    @shield = MechaShieldData.find(params[:id])
  end

  def mecha_shield_data_params
    params.require(:mecha_shield_data).permit(
      :shield, :stopping_power, :defense_adjustment, :space, :cost, :weight
    )
  end
end
