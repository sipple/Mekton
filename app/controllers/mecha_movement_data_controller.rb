# frozen_string_literal: true

class MechaMovementDataController < ApplicationController
  before_action :set_movement, only: [:show, :edit, :update, :destroy]

  # GET /mecha_movement_data
  def index
    @movements = MechaMovementData.active
  end

  # GET /mecha_movement_data/:id
  def show
  end

  # GET /mecha_movement_data/new
  def new
    @movement = MechaMovementData.new
  end

  # GET /mecha_movement_data/:id/edit
  def edit
  end

  # POST /mecha_movement_data
  def create
    @movement = MechaMovementData.new(mecha_movement_data_params)

    if @movement.save
      redirect_to mecha_movement_data_index_path, notice: "Movement data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_movement_data/:id
  def update
    if @movement.update(mecha_movement_data_params)
      redirect_to mecha_movement_data_index_path, notice: "Movement data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_movement_data/:id
  def destroy
    @movement.update!(disabled: true)
    redirect_to mecha_movement_data_index_path, notice: "Movement data was successfully archived."
  end

  private

  def set_movement
    @movement = MechaMovementData.find(params[:id])
  end

  def mecha_movement_data_params
    params.require(:mecha_movement_data).permit(
      :movement_system, :multiple, :cost
    )
  end
end
