class CharacterEquipmentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @character_equipment = CharacterEquipment.new(:character_id => params[:character_id], :quantity => 1)

    respond_to do |format|
      if @character_equipment.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'character_equipment_line', :locals => {:character_equipment => @character_equipment} }
        format.xml  { render :xml => @character_equipment, :status => :created, :location => @character_equipment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character_equipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @character_equipment = CharacterEquipment.find(params[:id])
    @character_equipment.send("#{params[:field]}=", params[:value])

    respond_to do |format|
      if @character_equipment.save
        format.json { render :text => character_equipment_json(@character_equipment)}
      end
    end
  end

  def destroy
    @character_equipment = CharacterEquipment.find(params[:id])
    @character_equipment.destroy

    respond_to do |format|
      format.html { redirect_to(character_equipments_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def character_equipment_json(character_equipment)
    equipment_data = character_equipment.character_equipment_data
    json_hash = Hash.new
    json_hash["character_equipment_data_id"] = equipment_data.equipment
    json_hash["weight"] = equipment_data.weight
    json_hash["quantity"] = character_equipment.quantity
    json_hash["cost"] = character_equipment.cost
    json_hash.to_json
  end
  
end
