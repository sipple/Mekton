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

  end

  # GET /mechas/new
  # GET /mechas/new.xml
  def new

  end

  # GET /mechas/1/edit
  def edit

  end

  # POST /mechas
  # POST /mechas.xml
  def create

  end

  # PUT /mechas/1
  # PUT /mechas/1.xml
  def update

  end

  # DELETE /mechas/1
  # DELETE /mechas/1.xml
  def destroy
    
  end
end