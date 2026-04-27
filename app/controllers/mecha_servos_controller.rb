# frozen_string_literal: true

class MechaServosController < ApplicationController
  before_action :set_mecha, only: [:create]

  # POST /mechas/:mecha_id/mecha_servos
  def create
    authorize @mecha, :update?
    @servo = @mecha.mecha_servos.create!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("mecha_servos_body",
            partial: "mecha_servos/mecha_servo_line",
            locals: { mecha_servo: @servo }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: @mecha })
        ]
      end
    end
  end

  # PATCH/PUT /mechas/:mecha_id/mecha_servos/:id
  def update
    @servo = MechaServo.find(params[:id])
    authorize @servo.mecha, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:mecha_servo_data_id)
      @servo.mecha_servo_data_id = params[:mecha_servo_data_id]
    end
    if params.key?(:mecha_servo_level_data_id)
      @servo.mecha_servo_level_data_id = params[:mecha_servo_level_data_id]
    end
    if params.key?(:mecha_armor_data_id)
      @servo.mecha_armor_data_id = params[:mecha_armor_data_id]
    end
    @servo.save!

    mecha = @servo.mecha
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("mecha_servo_#{@servo.id}",
            partial: "mecha_servos/mecha_servo_line",
            locals: { mecha_servo: @servo }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
    end
  end

  # DELETE /mechas/:mecha_id/mecha_servos/:id
  def destroy
    @servo = MechaServo.find(params[:id])
    authorize @servo.mecha, :update?
    dom_id = "mecha_servo_#{@servo.id}"
    mecha = @servo.mecha
    @servo.destroy!

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
