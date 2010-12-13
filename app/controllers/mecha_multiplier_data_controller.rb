class MechaMultiplierDataController < ApplicationController
  def index
    @multipliers = MechaMultiplierData.all(:order => "multiplier")
  end

  def show
    @multiplier = MechaMultiplierData.find(params[:id])
  end

  def new
    @multiplier = MechaMultiplierData.new
  end

  def edit
    @multiplier = MechaMultiplierData.find(params[:id])
  end

  def create
    @multiplier = MechaMultiplierData.new(params[:mecha_multiplier_data])

    if @multiplier.save
      redirect_to(mecha_multiplier_data_index_path)
    end

  end

  def update
    @multiplier = MechaMultiplierData.find(params[:id])
    @multiplier.update_attributes(params[:mecha_multiplier_data])
    redirect_to(mecha_multiplier_data_index_path)


  end

  def destroy
    @multiplier = MechaMultiplierData.find(params[:id])
    @multiplier.destroy
    redirect_to(mecha_multiplier_data_index_path)
  end

end
