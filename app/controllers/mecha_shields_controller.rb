# frozen_string_literal: true

class MechaShieldsController < ApplicationController
  before_action :set_mecha, only: [:create]

  # POST /mechas/:mecha_id/mecha_shields
  def create
    authorize @mecha, :update?
    @shield = @mecha.mecha_shields.create!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("mecha_shields_body",
            partial: "mecha_shields/mecha_shield_line",
            locals: { mecha_shield: @shield }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: @mecha })
        ]
      end
      format.html { redirect_to @mecha, notice: "Shield added." }
    end
  end

  # PATCH/PUT /mechas/:mecha_id/mecha_shields/:id
  def update
    @shield = MechaShield.find(params[:id])
    authorize @shield.mecha, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:mecha_shield_data_id)
      @shield.mecha_shield_data_id = params[:mecha_shield_data_id]
    end
    @shield.location = params[:location] if params.key?(:location)
    @shield.mecha_servo_id = params[:mecha_servo_id] if params.key?(:mecha_servo_id)
    @shield.save!

    mecha = @shield.mecha
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("mecha_shield_#{@shield.id}",
            partial: "mecha_shields/mecha_shield_line",
            locals: { mecha_shield: @shield }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
      format.html { redirect_to mecha, notice: "Shield updated." }
    end
  end

  # DELETE /mechas/:mecha_id/mecha_shields/:id
  def destroy
    @shield = MechaShield.find(params[:id])
    authorize @shield.mecha, :update?
    dom_id = "mecha_shield_#{@shield.id}"
    mecha = @shield.mecha
    @shield.destroy!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(dom_id),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
      format.html { redirect_to mecha, notice: "Shield removed." }
    end
  end

  private

  def set_mecha
    @mecha = Mecha.find(params[:mecha_id])
  end
end
