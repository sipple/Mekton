# frozen_string_literal: true

class MechaMultipliersController < ApplicationController
  before_action :set_mecha, only: [:create]

  # POST /mechas/:mecha_id/mecha_multipliers
  def create
    authorize @mecha, :update?
    @multiplier = @mecha.mecha_multipliers.create!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("mecha_multipliers_body",
            partial: "mecha_multipliers/mecha_multiplier_line",
            locals: { mecha_multiplier: @multiplier }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: @mecha })
        ]
      end
    end
  end

  # PATCH/PUT /mechas/:mecha_id/mecha_multipliers/:id
  def update
    @multiplier = MechaMultiplier.find(params[:id])
    authorize @multiplier.mecha, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:mecha_multiplier_data_id)
      @multiplier.mecha_multiplier_data_id = params[:mecha_multiplier_data_id]
    end
    @multiplier.quantity = params[:quantity] if params.key?(:quantity)
    @multiplier.save!

    mecha = @multiplier.mecha
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("mecha_multiplier_#{@multiplier.id}",
            partial: "mecha_multipliers/mecha_multiplier_line",
            locals: { mecha_multiplier: @multiplier }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
    end
  end

  # DELETE /mechas/:mecha_id/mecha_multipliers/:id
  def destroy
    @multiplier = MechaMultiplier.find(params[:id])
    authorize @multiplier.mecha, :update?
    dom_id = "mecha_multiplier_#{@multiplier.id}"
    mecha = @multiplier.mecha
    @multiplier.destroy!

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
