# frozen_string_literal: true

class MechaServoLevelDataController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /mecha_servo_level_data
  def index
    @levels = MechaServoLevelData.active.order(level: :asc)
  end

  # GET /mecha_servo_level_data/:id
  def show
  end

  # GET /mecha_servo_level_data/new
  def new
    @level = MechaServoLevelData.new
  end

  # GET /mecha_servo_level_data/:id/edit
  def edit
  end

  # POST /mecha_servo_level_data
  def create
    @level = MechaServoLevelData.new(mecha_servo_level_data_params)

    if @level.save
      redirect_to mecha_servo_level_data_index_path, notice: "Servo level data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_servo_level_data/:id
  def update
    if @level.update(mecha_servo_level_data_params)
      redirect_to mecha_servo_level_data_index_path, notice: "Servo level data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_servo_level_data/:id
  def destroy
    @level.update!(disabled: true)
    redirect_to mecha_servo_level_data_index_path, notice: "Servo level data was successfully archived."
  end

  private

  def set_level
    @level = MechaServoLevelData.find(params[:id])
  end

  def mecha_servo_level_data_params
    params.require(:mecha_servo_level_data).permit(
      :mecha_servo_data_id, :level, :kills, :space, :cost, :weight
    )
  end
end
