# frozen_string_literal: true

class MechaMovementsController < ApplicationController
  before_action :set_mecha, only: [:create]

  # POST /mechas/:mecha_id/mecha_movements
  def create
    authorize @mecha, :update?
    @movement = @mecha.mecha_movements.create!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("mecha_movements_body",
            partial: "mecha_movements/mecha_movement_line",
            locals: { mecha_movement: @movement }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: @mecha })
        ]
      end
    end
  end

  # PATCH/PUT /mechas/:mecha_id/mecha_movements/:id
  def update
    @movement = MechaMovement.find(params[:id])
    authorize @movement.mecha, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:mecha_movement_data_id)
      @movement.mecha_movement_data_id = params[:mecha_movement_data_id]
    end
    @movement.location = params[:location] if params.key?(:location)
    @movement.speed = params[:speed] if params.key?(:speed)
    @movement.save!

    mecha = @movement.mecha
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("mecha_movement_#{@movement.id}",
            partial: "mecha_movements/mecha_movement_line",
            locals: { mecha_movement: @movement }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
    end
  end

  # DELETE /mechas/:mecha_id/mecha_movements/:id
  def destroy
    @movement = MechaMovement.find(params[:id])
    authorize @movement.mecha, :update?
    dom_id = "mecha_movement_#{@movement.id}"
    mecha = @movement.mecha
    @movement.destroy!

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
