class MechaSubassemblyDataController < ApplicationController
  def index
    @subassemblies = MechaSubassemblyData.all(:order => "subassembly")
  end

  def show
    @subassembly = MechaSubassemblyData.find(params[:id])
  end

  def new
    @subassembly = MechaSubassemblyData.new
  end

  def edit
    @subassembly = MechaSubassemblyData.find(params[:id])
  end

  def create
    @subassembly = MechaSubassemblyData.new(params[:mecha_subassembly_data])

    if @subassembly.save
      redirect_to(mecha_subassembly_data_index_path)
    end

  end

  def update
    @subassembly = MechaSubassemblyData.find(params[:id])
    @subassembly.update_attributes(params[:mecha_subassembly_data])
    redirect_to(mecha_subassembly_data_index_path)


  end

  def destroy
    @subassembly = MechaSubassemblyData.find(params[:id])
    @subassembly.destroy
    redirect_to(mecha_subassembly_data_index_path)
  end

end
