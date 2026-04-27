# frozen_string_literal: true

class MechaServoDataController < ApplicationController
  before_action :set_servo_data, only: [:show, :edit, :update, :destroy]

  # GET /mecha_servo_data
  def index
    @servos = MechaServoData.active
  end

  # GET /mecha_servo_data/:id
  def show
  end

  # GET /mecha_servo_data/new
  def new
    @servo_data = MechaServoData.new
  end

  # GET /mecha_servo_data/:id/edit
  def edit
  end

  # POST /mecha_servo_data
  def create
    @servo_data = MechaServoData.new(mecha_servo_data_params)

    if @servo_data.save
      redirect_to mecha_servo_data_index_path, notice: "Servo data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_servo_data/:id
  def update
    if @servo_data.update(mecha_servo_data_params)
      redirect_to mecha_servo_data_index_path, notice: "Servo data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_servo_data/:id
  def destroy
    @servo_data.update!(disabled: true)
    redirect_to mecha_servo_data_index_path, notice: "Servo data was successfully archived."
  end

  private

  def set_servo_data
    @servo_data = MechaServoData.find(params[:id])
  end

  def mecha_servo_data_params
    params.require(:mecha_servo_data).permit(:servo)
  end
end
