# frozen_string_literal: true

class CharacterWeaponsController < ApplicationController
  before_action :set_character, only: [:create]

  # POST /characters/:character_id/character_weapons
  def create
    authorize @character, :update?
    @weapon = @character.character_weapons.create!(quantity: 1)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("character_weapons_body",
          partial: "character_weapons/character_weapon_line",
          locals: { character_weapon: @weapon })
      end
    end
  end

  # PATCH/PUT /characters/:character_id/character_weapons/:id
  def update
    @weapon = CharacterWeapon.find(params[:id])
    authorize @weapon.character, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:character_weapon_data_id)
      @weapon.character_weapon_data_id = params[:character_weapon_data_id]
    end
    @weapon.quantity = params[:quantity] if params.key?(:quantity)
    @weapon.save!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("character_weapon_#{@weapon.id}",
          partial: "character_weapons/character_weapon_line",
          locals: { character_weapon: @weapon })
      end
    end
  end

  # DELETE /characters/:character_id/character_weapons/:id
  def destroy
    @weapon = CharacterWeapon.find(params[:id])
    authorize @weapon.character, :update?
    dom_id = "character_weapon_#{@weapon.id}"
    @weapon.destroy!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(dom_id)
      end
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
