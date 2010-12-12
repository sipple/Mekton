class MechaMovementsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @mecha_movement = MechaMovement.new(:mecha_id => params[:mecha_id])

    respond_to do |format|
      if @mecha_movement.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'mecha_movement_line', :locals => {:mecha_movement => @mecha_movement} }
        format.xml  { render :xml => @mecha_movement, :status => :created, :location => @mecha_movement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mecha_movement.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mecha_movement = MechaMovement.find(params[:id])
    @mecha_movement.send("#{params[:field]}=", params[:value])
    respond_to do |format|
      if @mecha_movement.save
        format.json { render :text => mecha_movement_json(@mecha_movement)}
      end
    end
  end

  def destroy

    @mecha_movement = MechaMovement.find(params[:id])
    @mecha_movement.destroy

    respond_to do |format|
      format.html { redirect_to(mecha_movements_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def mecha_movement_json(mecha_movement)
    movement_data = mecha_movement.mecha_movement_data
    json_hash = Hash.new
    json_hash["mecha_movement_data_id"] = movement_data.movement_system
    json_hash["location"] = mecha_movement.location
    json_hash["speed"] = mecha_movement.speed
    json_hash["cost"] = mecha_movement.cost
    json_hash["space"] = mecha_movement.space
    json_hash["mecha"] = mecha_movement.mecha.mecha_json

    json_hash.to_json
  end
end