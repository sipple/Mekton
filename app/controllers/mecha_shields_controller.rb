class MechaShieldsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @mecha_shield = MechaShield.new(:mecha_id => params[:mecha_id])

    respond_to do |format|
      if @mecha_shield.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'mecha_shield_line', :locals => {:mecha_shield => @mecha_shield} }
        format.xml  { render :xml => @mecha_shield, :status => :created, :location => @mecha_shield }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mecha_shield.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mecha_shield = MechaShield.find(params[:id])
    @mecha_shield.send("#{params[:field]}=", params[:value])
    respond_to do |format|
      if @mecha_shield.save
        format.json { render :text => mecha_shield_json(@mecha_shield)}
      end
    end
  end

  def destroy

    @mecha_shield = MechaShield.find(params[:id])
    @mecha_shield.destroy

    respond_to do |format|
      format.html { redirect_to(mecha_shields_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def mecha_shield_json(mecha_shield)
    shield_data = mecha_shield.mecha_shield_data
    json_hash = Hash.new
    json_hash["mecha_shield_data_id"] = shield_data.shield
    json_hash["stopping_power"] = shield_data.stopping_power
    json_hash["space"] = shield_data.space
    json_hash["defense_adjustment"] = shield_data.defense_adjustment
    json_hash["cost"] = mecha_shield.cost
    json_hash["weight"] = mecha_shield.weight
    json_hash["location"] = mecha_shield.location
    json_hash["mecha"] = mecha_shield.mecha.mecha_json

    json_hash.to_json
  end
end