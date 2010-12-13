class MechaMultipliersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @mecha_multiplier = MechaMultiplier.new(:mecha_id => params[:mecha_id])

    respond_to do |format|
      if @mecha_multiplier.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'mecha_multiplier_line', :locals => {:mecha_multiplier => @mecha_multiplier} }
        format.xml  { render :xml => @mecha_multiplier, :status => :created, :location => @mecha_multiplier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mecha_multiplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mecha_multiplier = MechaMultiplier.find(params[:id])
    @mecha_multiplier.send("#{params[:field]}=", params[:value])
    respond_to do |format|
      if @mecha_multiplier.save
        format.json { render :text => mecha_multiplier_json(@mecha_multiplier)}
      end
    end
  end

  def destroy

    @mecha_multiplier = MechaMultiplier.find(params[:id])
    @mecha_multiplier.destroy

    respond_to do |format|
      format.html { redirect_to(mecha_multipliers_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def mecha_multiplier_json(mecha_multiplier)
    multiplier_data = mecha_multiplier.mecha_multiplier_data
    json_hash = Hash.new
    json_hash["mecha_multiplier_data_id"] = multiplier_data.multiplier
    json_hash["quantity"] = mecha_multiplier.quantity
    json_hash["cost"] = mecha_multiplier.cost
    json_hash["mecha"] = mecha_multiplier.mecha.mecha_json

    json_hash.to_json
  end
end