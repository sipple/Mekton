class MechaServoLevelDataController < ApplicationController
  def index
    @levels = MechaServoLevelData.active(:order => "level")
  end

  def show
    @level = MechaServoLevelData.find(params[:id])
  end

  def new
    @level = MechaServoLevelData.new
  end

  def edit
    @level = MechaServoLevelData.find(params[:id])
  end

  def create
    @level = MechaServoLevelData.new(params[:mecha_servo_level_data])

    if @level.save
      redirect_to(mecha_servo_level_data_index_path)
    end

  end

  def update
    @level = MechaServoLevelData.find(params[:id])
    @level.update_attributes(params[:mecha_servo_level_data])
    redirect_to(mecha_servo_level_data_index_path)


  end

  def destroy
    @level = MechaServoLevelData.find(params[:id])
    @level.disabled = true

    if @level.save
      redirect_to(mecha_servo_level_data_index_path)
    end

  end

end
