# frozen_string_literal: true

class MechaSubassembliesController < ApplicationController
  before_action :set_mecha, only: [:create]

  # POST /mechas/:mecha_id/mecha_subassemblies
  def create
    authorize @mecha, :update?
    @subassembly = @mecha.mecha_subassemblies.create!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("mecha_subassemblies_body",
            partial: "mecha_subassemblies/mecha_subassembly_line",
            locals: { mecha_subassembly: @subassembly }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: @mecha })
        ]
      end
    end
  end

  # PATCH/PUT /mechas/:mecha_id/mecha_subassemblies/:id
  def update
    @subassembly = MechaSubassembly.find(params[:id])
    authorize @subassembly.mecha, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:mecha_subassembly_data_id)
      @subassembly.mecha_subassembly_data_id = params[:mecha_subassembly_data_id]
    end
    @subassembly.location = params[:location] if params.key?(:location)
    @subassembly.save!

    mecha = @subassembly.mecha
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("mecha_subassembly_#{@subassembly.id}",
            partial: "mecha_subassemblies/mecha_subassembly_line",
            locals: { mecha_subassembly: @subassembly }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
    end
  end

  # DELETE /mechas/:mecha_id/mecha_subassemblies/:id
  def destroy
    @subassembly = MechaSubassembly.find(params[:id])
    authorize @subassembly.mecha, :update?
    dom_id = "mecha_subassembly_#{@subassembly.id}"
    mecha = @subassembly.mecha
    @subassembly.destroy!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(dom_id),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
    end
  end

  private

  def set_mecha
    @mecha = Mecha.find(params[:mecha_id])
  end
end
