# frozen_string_literal: true

class MechaSubassemblyDataController < ApplicationController
  before_action :set_subassembly, only: [:show, :edit, :update, :destroy]

  # GET /mecha_subassembly_data
  def index
    @subassemblies = MechaSubassemblyData.active.order(subassembly: :asc)
  end

  # GET /mecha_subassembly_data/:id
  def show
  end

  # GET /mecha_subassembly_data/new
  def new
    @subassembly = MechaSubassemblyData.new
  end

  # GET /mecha_subassembly_data/:id/edit
  def edit
  end

  # POST /mecha_subassembly_data
  def create
    @subassembly = MechaSubassemblyData.new(mecha_subassembly_data_params)

    if @subassembly.save
      redirect_to mecha_subassembly_data_index_path, notice: "Subassembly data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mecha_subassembly_data/:id
  def update
    if @subassembly.update(mecha_subassembly_data_params)
      redirect_to mecha_subassembly_data_index_path, notice: "Subassembly data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /mecha_subassembly_data/:id
  def destroy
    @subassembly.update!(disabled: true)
    redirect_to mecha_subassembly_data_index_path, notice: "Subassembly data was successfully archived."
  end

  private

  def set_subassembly
    @subassembly = MechaSubassemblyData.find(params[:id])
  end

  def mecha_subassembly_data_params
    params.require(:mecha_subassembly_data).permit(
      :subassembly, :kills, :space, :cost, :weight
    )
  end
end
