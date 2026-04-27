# frozen_string_literal: true

class MechaSensorDataController < ApplicationController
  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  # GET /mecha_sensor_data
  def index
    @sensors = MechaSensorData.active
  end

  # GET /mecha_sensor_data/:id
  def show
  end

  # GET /mecha_sensor_data/new
  def new
    @sensor = MechaSensorData.new
  end

  # GET /mecha_sensor_data/:id/edit
  def edit
  end

  # POST /mecha_sensor_data
  def create
    @sensor = MechaSensorData.new(mecha_sensor_data_params)

    if @sensor.save
      redirect_to mecha_sensor_data_index_path, notice: "Sensor data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_sensor_data/:id
  def update
    if @sensor.update(mecha_sensor_data_params)
      redirect_to mecha_sensor_data_index_path, notice: "Sensor data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_sensor_data/:id
  def destroy
    @sensor.update!(disabled: true)
    redirect_to mecha_sensor_data_index_path, notice: "Sensor data was successfully archived."
  end

  private

  def set_sensor
    @sensor = MechaSensorData.find(params[:id])
  end

  def mecha_sensor_data_params
    params.require(:mecha_sensor_data).permit(
      :sensor, :range, :communication_range, :kills, :space, :cost, :weight
    )
  end
end
