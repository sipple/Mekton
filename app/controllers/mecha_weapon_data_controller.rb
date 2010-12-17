class MechaWeaponDataController < ApplicationController
  def index
    @weapons = MechaWeaponData.active(:order => "weapon")
  end

  def show
    @weapon = MechaWeaponData.find(params[:id])
  end

  def new
    @weapon = MechaWeaponData.new
  end

  def edit
    @weapon = MechaWeaponData.find(params[:id])
  end

  def create
    @weapon = MechaWeaponData.new(params[:mecha_weapon_data])

    if @weapon.save
      redirect_to(mecha_weapon_data_index_path)
    end

  end

  def update
    @weapon = MechaWeaponData.find(params[:id])
    @weapon.update_attributes(params[:mecha_weapon_data])
    redirect_to(mecha_weapon_data_index_path)


  end

  def destroy
    @weapon = MechaWeaponData.find(params[:id])
    @weapon.disabled = true
    if @weapon.save
      redirect_to(mecha_weapon_data_index_path)
    end
  end

end
