class MechasController < ApplicationController
  # GET /mechas
  # GET /mechas.xml
  def index
    @mechas = Mecha.all
    respond_to do |format|
      format.html #index.html.erb
      format.xml {render :xml => @mechas}
    end
  end

  # GET /mechas/1
  # GET /mechas/1.xml
  def show
    @mecha = Mecha.find(params[:id])
    @mecha_pilot = Character.find(@mecha.character_id)

    respond_to do |format|
      format.html #show.html.erb
      format.json {render :text => full_mecha_json(@mecha)}
      format.xml {render :xml => @mecha}
    end

  end

  # GET /mechas/new
  # GET /mechas/new.xml
  def new
    @mecha = Mecha.new

    respond_to do |format|
      format.html #new.html.erb
      format.xml {render :xml => @mecha}
    end
  end

  # GET /mechas/1/edit
  def edit

  end

  # POST /mechas
  # POST /mechas.xml
  def create
    @mecha = Mecha.new(params[:mecha])

    respond_to do |format|
      if @mecha.save
        flash[:notice] = "Mecha was successfully created"
        format.html {redirect_to(@mecha)}
        format.xml {render :xml => @mecha, :status => :created, :location => @mecha}
      else
        flash[:error] = "Unable to create the mecha, something must be wrong"
        format.html {render :action => "new"}
        format.xml {render :xml => @mecha, :status => :unprocessable_entity}
      end
    end

  end

  # PUT /mechas/1
  # PUT /mechas/1.xml
  def update
    @mecha = Mecha.find(params[:id])
    @mecha.send("#{params[:field]}=", params[:value])
    respond_to do |format|
      if @mecha.save
        format.json {render :text => full_mecha_json(@mecha)}
      end
    end

  end

  # DELETE /mechas/1
  # DELETE /mechas/1.xml
  def destroy
    
  end

  def select_options

    # We're expecting a field name like 'mecha_servos-1-servo'
    # When we split on '-', the first value will be the model, and the second the id
    field_id_hash = params[:id].split('-')
    select_options = Mekton::SelectOptions.new

    if (field_id_hash[2].include?("_id"))
      model_match = field_id_hash[2].match('^(.*)_id')
      options = select_options.get_options(model_match.captures[0], field_id_hash[1])
    else
      options = select_options.get_options(field_id_hash[0], field_id_hash[1])
    end

    render :text => options.to_json
  end

  private

  def full_mecha_json(mecha)
    mecha.to_json(:methods => [],
                  :include => {:mecha_servos => {:include => [:mecha_servo_data, :mecha_servo_level_data, :mecha_armor_data]}},
                  :mecha_weapons => {:include => :mecha_weapon_data})
  end

end