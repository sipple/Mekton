# frozen_string_literal: true

class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  def index
    @characters = policy_scope(Character).active
  end

  # GET /characters/:id
  def show
    authorize @character
  end

  # GET /characters/new
  def new
    @character = Character.new
    authorize @character
  end

  # POST /characters
  def create
    @character = current_user.characters.build(character_params)
    authorize @character

    if @character.save
      redirect_to @character, notice: "Character was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /characters/:id/edit
  def edit
    authorize @character
  end

  # PATCH/PUT /characters/:id
  # Handles both full form submission and single-field inline edits via Turbo Stream
  def update
    authorize @character

    permitted = params.permit(
      :name, :age, :money, :intelligence, :cool, :reflexes,
      :attractiveness, :empathy, :luck, :move_allowance, :body_type,
      :education, :tech_ability, :character_type, :psi_ability,
      :psi_points, :notes
    )

    @character.update!(permitted)

    respond_to do |format|
      format.turbo_stream do
        # After any stat edit, update the stats table and skill points display.
        # The character_stats partial includes all primary AND derived stats
        # (head, torso, limbs, stun, lift, throw_distance, ev, stability,
        # run, jump, running_jump, anime_leap, melee_damage_mod), so a single
        # replace handles all body_type / cool / move_allowance cascades.
        render turbo_stream: [
          turbo_stream.replace("character_stats",
            partial: "characters/character_stats",
            locals: { character: @character }),
          turbo_stream.replace("skill_points",
            partial: "characters/skill_points",
            locals: { character: @character })
        ]
      end
      format.html { redirect_to @character, notice: "Character was successfully updated." }
    end
  end

  # DELETE /characters/:id
  # Soft-delete: sets disabled flag rather than destroying the record
  def destroy
    authorize @character
    @character.update!(disabled: true)
    redirect_to characters_url, notice: "Character was successfully archived."
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  # Strong params for full form submission (new/create/edit)
  def character_params
    params.require(:character).permit(
      :name, :age, :money, :intelligence, :cool, :reflexes,
      :attractiveness, :empathy, :luck, :move_allowance, :body_type,
      :education, :tech_ability, :character_type, :psi_ability,
      :psi_points, :notes
    )
  end
end
