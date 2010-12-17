class CharacterWeaponDataController < ApplicationController
  def index
    @weapons = CharacterWeaponData.active(:order => "weapon")
  end

  def show
    @weapon = CharacterWeaponData.find(params[:id])
  end

  def new
    @weapon = CharacterWeaponData.new
  end

  def edit
    @weapon = CharacterWeaponData.find(params[:id])
  end

  def create
    @weapon = CharacterWeaponData.new(params[:character_weapon_data])

    if @weapon.save
      redirect_to(character_weapon_data_index_path)
    end

  end

  def update
    @weapon = CharacterWeaponData.find(params[:id])
    @weapon.update_attributes(params[:character_weapon_data])
    redirect_to(character_weapon_data_index_path)


  end

  def destroy
    @weapon = CharacterWeaponData.find(params[:id])
    @weapon.disabled = true
    if @weapon.save
      redirect_to(character_weapon_data_index_path)
    end
  end

end
