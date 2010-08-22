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

end
