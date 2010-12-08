class MechaServosController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @mecha_servo = MechaServo.new(:mecha_id => params[:mecha_id])

    respond_to do |format|
      if @mecha_servo.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'mecha_servo_line', :locals => {:mecha_servo => @mecha_servo} }
        format.xml  { render :xml => @mecha_servo, :status => :created, :location => @mecha_servo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mecha_servo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mecha_servo = MechaServo.find(params[:id])
    @mecha_servo.send("#{params[:field]}=", params[:value])

    respond_to do |format|
      if @mecha_servo.save
        format.json { render :text => mecha_servo_json(@mecha_servo)}
      end
    end
  end

  def destroy

    @mecha_servo = MechaServo.find(params[:id])
    @mecha_servo.destroy

    respond_to do |format|
      format.html { redirect_to(mecha_servos_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def mecha_servo_json(mecha_servo)
    servo_data = mecha_servo.mecha_servo_data
    servo_level_data = mecha_servo.mecha_servo_level_data
    armor_data = mecha_servo.mecha_armor_data
    json_hash = Hash.new
    json_hash["mecha_servo_data_id"] = servo_data.servo
    json_hash["mecha_servo_level_data_id"] = servo_level_data.level
    json_hash["space"] = servo_level_data.space
    json_hash["kills"] = servo_level_data.kills
    json_hash["cost"] = servo_level_data.cost
    json_hash["weight"] = servo_level_data.weight
    json_hash["mecha_armor-mecha_armor_data_id"] = armor_data.armor
    json_hash["mecha_armor-stopping_power"] = armor_data.stopping_power
    json_hash["mecha_armor-cost"] = armor_data.cost
    json_hash["mecha_armor-weight"] = armor_data.weight
    json_hash.to_json
  end

end
