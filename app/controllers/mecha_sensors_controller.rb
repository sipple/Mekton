# frozen_string_literal: true

class MechaSensorsController < ApplicationController
  before_action :set_mecha, only: [:create]

  # POST /mechas/:mecha_id/mecha_sensors
  def create
    authorize @mecha, :update?
    @sensor = @mecha.mecha_sensors.create!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("mecha_sensors_body",
            partial: "mecha_sensors/mecha_sensor_line",
            locals: { mecha_sensor: @sensor }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: @mecha })
        ]
      end
      format.html { redirect_to @mecha, notice: "Sensor added." }
    end
  end

  # PATCH/PUT /mechas/:mecha_id/mecha_sensors/:id
  def update
    @sensor = MechaSensor.find(params[:id])
    authorize @sensor.mecha, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:mecha_sensor_data_id)
      @sensor.mecha_sensor_data_id = params[:mecha_sensor_data_id]
    end
    @sensor.location = params[:location] if params.key?(:location)
    @sensor.save!

    mecha = @sensor.mecha
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("mecha_sensor_#{@sensor.id}",
            partial: "mecha_sensors/mecha_sensor_line",
            locals: { mecha_sensor: @sensor }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
      format.html { redirect_to mecha, notice: "Sensor updated." }
    end
  end

  # DELETE /mechas/:mecha_id/mecha_sensors/:id
  def destroy
    @sensor = MechaSensor.find(params[:id])
    authorize @sensor.mecha, :update?
    dom_id = "mecha_sensor_#{@sensor.id}"
    mecha = @sensor.mecha
    @sensor.destroy!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(dom_id),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
      format.html { redirect_to mecha, notice: "Sensor removed." }
    end
  end

  private

  def set_mecha
    @mecha = Mecha.find(params[:mecha_id])
  end
end
