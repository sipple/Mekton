# frozen_string_literal: true

class CharacterSkillsController < ApplicationController
  before_action :set_character, only: [:create]

  # POST /characters/:character_id/character_skills
  def create
    authorize @character, :update?
    @skill = @character.character_skills.create!(level: 0, ip_earned: 0)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.append("character_skills_body",
            partial: "character_skills/character_skill_line",
            locals: { character_skill: @skill }),
          turbo_stream.replace("skill_points",
            partial: "characters/skill_points",
            locals: { character: @character })
        ]
      end
    end
  end

  # PATCH/PUT /characters/:character_id/character_skills/:id
  def update
    @skill = CharacterSkill.find(params[:id])
    authorize @skill.character, :update?

    # Explicit field whitelist — no send(), no mass assignment
    if params.key?(:character_skill_data_id)
      @skill.character_skill_data_id = params[:character_skill_data_id]
    end
    @skill.level = params[:level] if params.key?(:level)
    @skill.ip_earned = params[:ip_earned] if params.key?(:ip_earned)
    @skill.save!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("character_skill_#{@skill.id}",
            partial: "character_skills/character_skill_line",
            locals: { character_skill: @skill }),
          turbo_stream.replace("skill_points",
            partial: "characters/skill_points",
            locals: { character: @skill.character })
        ]
      end
    end
  end

  # DELETE /characters/:character_id/character_skills/:id
  def destroy
    @skill = CharacterSkill.find(params[:id])
    authorize @skill.character, :update?
    dom_id = "character_skill_#{@skill.id}"
    character = @skill.character
    @skill.destroy!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(dom_id),
          turbo_stream.replace("skill_points",
            partial: "characters/skill_points",
            locals: { character: character })
        ]
      end
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end
end
