# frozen_string_literal: true

class CharacterArmorsController < ApplicationController
  before_action :set_character, only: [:create]

  # POST /characters/:character_id/character_armors
  def create
    authorize @character, :update?
    @armor = @character.character_armors.create!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append("character_armors_body",
          partial: "character_armors/character_armor_line",
          locals: { character_armor: @armor })
      end
      format.html { redirect_to @character, notice: "Armor added." }
    end
  end

  # PATCH/PUT /characters/:character_id/character_armors/:id
  def update
    @armor = CharacterArmor.find(params[:id])
    authorize @armor.character, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:character_armor_data_id)
      @armor.character_armor_data_id = params[:character_armor_data_id]
    end
    @armor.location = params[:location] if params.key?(:location)
    @armor.save!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("character_armor_#{@armor.id}",
          partial: "character_armors/character_armor_line",
          locals: { character_armor: @armor })
      end
      format.html { redirect_to @armor.character, notice: "Armor updated." }
    end
  end

  # DELETE /characters/:character_id/character_armors/:id
  def destroy
    @armor = CharacterArmor.find(params[:id])
    authorize @armor.character, :update?
    dom_id = "character_armor_#{@armor.id}"
    character = @armor.character
    @armor.destroy!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(dom_id)
      end
      format.html { redirect_to character, notice: "Armor removed." }
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
