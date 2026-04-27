# frozen_string_literal: true

class MechaWeaponsController < ApplicationController
  before_action :set_mecha, only: [:create]

  # POST /mechas/:mecha_id/mecha_weapons
  def create
    authorize @mecha, :update?
    @weapon = @mecha.mecha_weapons.create!(quantity: 1)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("mecha_weapons_body",
            partial: "mecha_weapons/mecha_weapon_line",
            locals: { mecha_weapon: @weapon }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: @mecha })
        ]
      end
      format.html { redirect_to @mecha, notice: "Weapon added." }
    end
  end

  # PATCH/PUT /mechas/:mecha_id/mecha_weapons/:id
  def update
    @weapon = MechaWeapon.find(params[:id])
    authorize @weapon.mecha, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:mecha_weapon_data_id)
      @weapon.mecha_weapon_data_id = params[:mecha_weapon_data_id]
    end
    @weapon.location = params[:location] if params.key?(:location)
    @weapon.quantity = params[:quantity] if params.key?(:quantity)
    @weapon.notes = params[:notes] if params.key?(:notes)
    @weapon.mecha_servo_id = params[:mecha_servo_id] if params.key?(:mecha_servo_id)
    @weapon.save!

    mecha = @weapon.mecha
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("mecha_weapon_#{@weapon.id}",
            partial: "mecha_weapons/mecha_weapon_line",
            locals: { mecha_weapon: @weapon }),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
      format.html { redirect_to mecha, notice: "Weapon updated." }
    end
  end

  # DELETE /mechas/:mecha_id/mecha_weapons/:id
  def destroy
    @weapon = MechaWeapon.find(params[:id])
    authorize @weapon.mecha, :update?
    dom_id = "mecha_weapon_#{@weapon.id}"
    mecha = @weapon.mecha
    @weapon.destroy!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(dom_id),
          turbo_stream.replace("mecha_stats",
            partial: "mechas/mecha_stats",
            locals: { mecha: mecha })
        ]
      end
      format.html { redirect_to mecha, notice: "Weapon removed." }
    end
  end

  private

  def set_mecha
    @mecha = Mecha.find(params[:mecha_id])
  end
end
