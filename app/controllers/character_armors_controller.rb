class CharacterArmorsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    @character_armor = CharacterArmor.new(:character_id => params[:character_id])

    respond_to do |format|
      if @character_armor.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'character_armor_line', :locals => {:character_armor => @character_armor} }
        format.xml  { render :xml => @character_armor, :status => :created, :location => @character_armor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character_armor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @character_armor = CharacterArmor.find(params[:id])
    @character_armor.send("#{params[:field]}=", params[:value])

    respond_to do |format|
      if @character_armor.save
        format.json { render :text => character_armor_json(@character_armor)}
      end
    end
  end

  def destroy

    @character_armor = CharacterArmor.find(params[:id])
    @character_armor.destroy

    respond_to do |format|
      format.html { redirect_to(character_armors_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def character_armor_json(character_armor)
    armor_data = character_armor.character_armor_data
    json_hash = Hash.new
    json_hash["character_armor_data_id"] = armor_data.armor
    json_hash["location"] = character_armor.location
    json_hash["stopping_power"] = armor_data.stopping_power
    json_hash["cost"] = armor_data.cost
    json_hash["weight"] = armor_data.weight
    json_hash.to_json
  end

end
