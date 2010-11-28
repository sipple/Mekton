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

  end

  # DELETE /mechas/1
  # DELETE /mechas/1.xml
  def destroy
    
  end

  private

  def full_mecha_json(mecha)
    mecha.to_json
  end

end