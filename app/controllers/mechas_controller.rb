# frozen_string_literal: true

class MechasController < ApplicationController
  before_action :set_mecha, only: [:show, :edit, :update, :destroy]

  # GET /mechas
  def index
    @mechas = policy_scope(Mecha).active
  end

  # GET /mechas/:id
  def show
    authorize @mecha
  end

  # GET /mechas/new
  def new
    @mecha = Mecha.new
    authorize @mecha
  end

  # POST /mechas
  def create
    @mecha = current_user.mechas.build(mecha_params)
    authorize @mecha

    if @mecha.save
      redirect_to @mecha, notice: "Mecha was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /mechas/:id/edit
  def edit
    authorize @mecha
  end

  # PATCH/PUT /mechas/:id
  # Handles both full form submission and single-field inline edits via Turbo Stream
  def update
    authorize @mecha

    permitted = params.permit(
      :name, :notes, :character_id,
      :mv_bonus, :ma_bonus, :mp_bonus
    )

    @mecha.update!(permitted)

    respond_to do |format|
      format.turbo_stream do
        # After any stat edit, update all derived stat displays.
        # The mecha_stats partial includes weight, cost, mv, land_ma,
        # flight_ma, ground_effects, mecha_reflexes, and all combat skills,
        # so a single replace handles all cascading recalculations.
        render turbo_stream: turbo_stream.replace("mecha_stats",
          partial: "mechas/mecha_stats",
          locals: { mecha: @mecha })
      end
      format.html { redirect_to @mecha, notice: "Mecha was successfully updated." }
    end
  end

  # DELETE /mechas/:id
  # Soft-delete: sets disabled flag rather than destroying the record
  def destroy
    authorize @mecha
    @mecha.update!(disabled: true)
    redirect_to mechas_url, notice: "Mecha was successfully archived."
  end

  private

  def set_mecha
    @mecha = Mecha.find(params[:id])
  end

  # Strong params for full form submission (new/create/edit)
  def mecha_params
    params.require(:mecha).permit(
      :name, :notes, :character_id,
      :mv_bonus, :ma_bonus, :mp_bonus
    )
  end
end
