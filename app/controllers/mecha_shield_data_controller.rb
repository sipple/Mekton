class MechaShieldDataController < ApplicationController
  def index
    @shields = MechaShieldData.active
  end

  def show
    @shield = MechaShieldData.find(params[:id])
  end

  def new
    @shield = MechaShieldData.new
  end

  def edit
    @shield = MechaShieldData.find(params[:id])
  end

  def create
    @shield = MechaShieldData.new(params[:mecha_shield_data])

    if @shield.save
      redirect_to(mecha_shield_data_index_path)
    end

  end

  def update
    @shield = MechaShieldData.find(params[:id])
    @shield.update_attributes(params[:mecha_shield_data])
    redirect_to(mecha_shield_data_index_path)


  end

  def destroy
    @shield = MechaShieldData.find(params[:id])
    @shield.disabled = true

    if @shield.save
      redirect_to(mecha_shield_data_index_path)
    end
  end

end
