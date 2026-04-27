# frozen_string_literal: true

class CharacterEquipmentsController < ApplicationController
  before_action :set_character, only: [:create]

  # POST /characters/:character_id/character_equipments
  def create
    authorize @character, :update?
    @equipment = @character.character_equipments.create!(quantity: 1)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("character_equipments_body",
          partial: "character_equipments/character_equipment_line",
          locals: { character_equipment: @equipment })
      end
    end
  end

  # PATCH/PUT /characters/:character_id/character_equipments/:id
  def update
    @equipment = CharacterEquipment.find(params[:id])
    authorize @equipment.character, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:character_equipment_data_id)
      @equipment.character_equipment_data_id = params[:character_equipment_data_id]
    end
    @equipment.quantity = params[:quantity] if params.key?(:quantity)
    @equipment.save!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("character_equipment_#{@equipment.id}",
          partial: "character_equipments/character_equipment_line",
          locals: { character_equipment: @equipment })
      end
    end
  end

  # DELETE /characters/:character_id/character_equipments/:id
  def destroy
    @equipment = CharacterEquipment.find(params[:id])
    authorize @equipment.character, :update?
    dom_id = "character_equipment_#{@equipment.id}"
    @equipment.destroy!

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
