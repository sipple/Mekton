class CharactersController < ApplicationController
  # GET /characters
  # GET /characters.xml
  def index
    @characters = Character.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.xml
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :text => full_character_json(@character)}
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.xml
  def new
    @character = Character.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
  end

  # POST /characters
  # POST /characters.xml
  def create
    @character = Character.new(params[:character])

    respond_to do |format|
      if @character.save
        flash[:notice] = 'Character was successfully created.'
        format.html { redirect_to(@character) }
        format.xml  { render :xml => @character, :status => :created, :location => @character }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.xml
  def update
    @character = Character.find(params[:id])

    @character.send("#{params[:field]}=", params[:value])
    

    respond_to do |format|
      if @character.save
        flash[:notice] = 'Character was successfully updated.'
        format.html { redirect_to(@character) }
        format.json {render :text => full_character_json(@character)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :text => full_character_json(@character)}
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.xml
  def destroy
    @character = Character.find(params[:id])
    @character.disabled = true

    if @character.save
      respond_to do |format|
        format.html { redirect_to(characters_url) }
        format.xml  { head :ok }
      end
    end
  end

  def select_options

    # We're expecting a field name like 'character_armors-1-armor'
    # When we split on '-', the first value will be the model, and the second the id
    field_id_hash = params[:id].split('-')
    select_options = Mekton::SelectOptions.new
    options = select_options.get_options(field_id_hash[0], field_id_hash[1])

    render :text => options.to_json
  end

  private

  def full_character_json(character)
    character.to_json(:methods => [:head, :torso, :limbs, :stun, :lift, :throw_distance, :skill_points,
                                  :melee_damage_mod, :ev, :stability, :run, :jump, :running_jump, :anime_leap],
                      :include => {:character_armors => {:include => :character_armor_data},
                                   :character_equipments => {:include => :character_equipment_data},
                                   :character_professions => {:include =>:character_profession_data},
                                   :character_skills => {
                                           :methods => [:total, :profession_and_template_bonus, :attribute_bonus],
                                           :include => :character_skill_data},
                                   :character_template => {:include => :character_template_data},
                                   :character_weapons => {:include => :character_weapon_data}})
  end

end
