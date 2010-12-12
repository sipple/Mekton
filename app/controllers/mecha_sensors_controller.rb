class MechaSensorsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @mecha_sensor = MechaSensor.new(:mecha_id => params[:mecha_id])

    respond_to do |format|
      if @mecha_sensor.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'mecha_sensor_line', :locals => {:mecha_sensor => @mecha_sensor} }
        format.xml  { render :xml => @mecha_sensor, :status => :created, :location => @mecha_sensor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mecha_sensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mecha_sensor = MechaSensor.find(params[:id])
    @mecha_sensor.send("#{params[:field]}=", params[:value])
    respond_to do |format|
      if @mecha_sensor.save
        format.json { render :text => mecha_sensor_json(@mecha_sensor)}
      end
    end
  end

  def destroy

    @mecha_sensor = MechaSensor.find(params[:id])
    @mecha_sensor.destroy

    respond_to do |format|
      format.html { redirect_to(mecha_sensors_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def mecha_sensor_json(mecha_sensor)
    sensor_data = mecha_sensor.mecha_sensor_data
    json_hash = Hash.new
    json_hash["mecha_sensor_data_id"] = sensor_data.sensor
    json_hash["range"] = sensor_data.range
    json_hash["communication_range"] = sensor_data.communication_range
    json_hash["kills"] = sensor_data.kills
    json_hash["space"] = sensor_data.space
    json_hash["cost"] = sensor_data.cost
    json_hash["weight"] = sensor_data.weight
    json_hash["location"] = mecha_sensor.location
    json_hash["mecha"] = mecha_sensor.mecha.mecha_json

    json_hash.to_json
  end
end