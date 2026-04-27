# frozen_string_literal: true

class MechaMultiplierDataController < ApplicationController
  before_action :set_multiplier, only: [:show, :edit, :update, :destroy]

  # GET /mecha_multiplier_data
  def index
    @multipliers = MechaMultiplierData.active.order(multiplier: :asc)
  end

  # GET /mecha_multiplier_data/:id
  def show
  end

  # GET /mecha_multiplier_data/new
  def new
    @multiplier = MechaMultiplierData.new
  end

  # GET /mecha_multiplier_data/:id/edit
  def edit
  end

  # POST /mecha_multiplier_data
  def create
    @multiplier = MechaMultiplierData.new(mecha_multiplier_data_params)

    if @multiplier.save
      redirect_to mecha_multiplier_data_index_path, notice: "Multiplier data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_multiplier_data/:id
  def update
    if @multiplier.update(mecha_multiplier_data_params)
      redirect_to mecha_multiplier_data_index_path, notice: "Multiplier data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_multiplier_data/:id
  def destroy
    @multiplier.update!(disabled: true)
    redirect_to mecha_multiplier_data_index_path, notice: "Multiplier data was successfully archived."
  end

  private

  def set_multiplier
    @multiplier = MechaMultiplierData.find(params[:id])
  end

  def mecha_multiplier_data_params
    params.require(:mecha_multiplier_data).permit(
      :multiplier, :multiple, :cost
    )
  end
end
