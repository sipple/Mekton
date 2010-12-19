class MechaArmorDataController < ApplicationController
  def index
    @armors = MechaArmorData.active
  end

  def show
    @armor = MechaArmorData.find(params[:id])
  end

  def new
    @armor = MechaArmorData.new
  end

  def edit
    @armor = MechaArmorData.find(params[:id])
  end

  def create
    @armor = MechaArmorData.new(params[:mecha_armor_data])

    if @armor.save
      redirect_to(mecha_armor_data_index_path)
    end

  end

  def update
    @armor = MechaArmorData.find(params[:id])
    @armor.update_attributes(params[:mecha_armor_data])
    redirect_to(mecha_armor_data_index_path)


  end

  def destroy
    @armor = MechaArmorData.find(params[:id])
    @armor.disabled = true
    if @armor.save
      redirect_to(mecha_armor_data_index_path)
    end
  end

end
