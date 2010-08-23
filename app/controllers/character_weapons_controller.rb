class CharacterWeaponsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    @character_weapon = CharacterWeapon.find(params[:id])
    @character_weapon.send("#{params[:field]}=", params[:value])

    respond_to do |format|
      if @character_weapon.save
        format.json { render :text => character_weapon_json(@character_weapon)}
      end
    end
  end

  def create
    @character_weapon = CharacterWeapon.new(:character_id => params[:character_id], :quantity => 1)

    respond_to do |format|
      if @character_weapon.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'character_weapon_line', :locals => {:character_weapon => @character_weapon} }
        format.xml  { render :xml => @character_weapon, :status => :created, :location => @character_weapon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character_weapon.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @character_weapon = CharacterWeapon.find(params[:id])
    @character_weapon.destroy

    respond_to do |format|
      format.html { redirect_to(character_weapons_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def character_weapon_json(character_weapon)
    weapon_data = character_weapon.character_weapon_data
    json_hash = Hash.new
    json_hash["character_weapon_data_id"] = weapon_data.weapon
    json_hash["weapon_adjustment"] = weapon_data.weapon_adjustment
    json_hash["range"] = weapon_data.range
    json_hash["damage"] = weapon_data.damage
    json_hash["shots"] = weapon_data.shots
    json_hash["burst_value"] = weapon_data.burst_value
    json_hash["concealment"] = weapon_data.concealment
    json_hash["weight"] = weapon_data.damage
    json_hash["quantity"] = character_weapon.quantity
    json_hash["cost"] = character_weapon.cost
    json_hash.to_json
  end

end
