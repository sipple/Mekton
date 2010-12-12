class MechaSubassembliesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @mecha_subassembly = MechaSubassembly.new(:mecha_id => params[:mecha_id])

    respond_to do |format|
      if @mecha_subassembly.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'mecha_subassembly_line', :locals => {:mecha_subassembly => @mecha_subassembly} }
        format.xml  { render :xml => @mecha_sensor, :status => :created, :location => @mecha_subassembly }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mecha_sensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mecha_subassembly = MechaSubassembly.find(params[:id])
    @mecha_subassembly.send("#{params[:field]}=", params[:value])
    respond_to do |format|
      if @mecha_subassembly.save
        format.json { render :text => mecha_subassembly_json(@mecha_subassembly)}
      end
    end
  end

  def destroy

    @mecha_subassembly = MechaSubassembly.find(params[:id])
    @mecha_subassembly.destroy

    respond_to do |format|
      format.html { redirect_to(mecha_sensors_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def mecha_subassembly_json(mecha_subassembly)
    subassembly_data = mecha_subassembly.mecha_subassembly_data
    json_hash = Hash.new
    json_hash["mecha_subassembly_data_id"] = subassembly_data.subassembly
    json_hash["kills"] = subassembly_data.kills
    json_hash["space"] = subassembly_data.space
    json_hash["cost"] = subassembly_data.cost
    json_hash["weight"] = subassembly_data.weight
    json_hash["mecha"] = mecha_subassembly.mecha.mecha_json
    json_hash["location"] = mecha_subassembly.location

    json_hash.to_json
  end
end