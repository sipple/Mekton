class MechaWeaponsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @mecha_weapon = MechaWeapon.new(:mecha_id => params[:mecha_id])

    respond_to do |format|
      if @mecha_weapon.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'mecha_weapon_line', :locals => {:mecha_weapon => @mecha_weapon} }
        format.xml  { render :xml => @mecha_weapon, :status => :created, :location => @mecha_weapon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mecha_weapon.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mecha_weapon = MechaWeapon.find(params[:id])
    @mecha_weapon.send("#{params[:field]}=", params[:value])
    respond_to do |format|
      if @mecha_weapon.save
        format.json { render :text => mecha_weapon_json(@mecha_weapon)}
      end
    end
  end

  def destroy

    @mecha_weapon = MechaWeapon.find(params[:id])
    @mecha_weapon.destroy

    respond_to do |format|
      format.html { redirect_to(mecha_weapons_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def mecha_weapon_json(mecha_weapon)
    weapon_data = mecha_weapon.mecha_weapon_data
    json_hash = Hash.new
    json_hash["mecha_weapon_data_id"] = weapon_data.weapon
    json_hash["weapon_adjustment"] = weapon_data.weapon_adjustment
    json_hash["range"] = weapon_data.range
    json_hash["damage"] = weapon_data.damage
    json_hash["shots"] = weapon_data.shots
    json_hash["kills"] = weapon_data.kills
    json_hash["space"] = mecha_weapon.space
    json_hash["cost"] = mecha_weapon.cost
    json_hash["weight"] = mecha_weapon.weight
    json_hash["burst_value"] = weapon_data.burst_value
    json_hash["quantity"] = mecha_weapon.quantity
    json_hash["notes"] = mecha_weapon.notes
    json_hash["location"] = mecha_weapon.location
    json_hash["mecha"] = mecha_weapon.mecha.mecha_json

    json_hash.to_json
  end
end