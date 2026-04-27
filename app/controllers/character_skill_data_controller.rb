class CharacterSkillDataController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def index; @skills = CharacterSkillData.active; end
  def show; end
  def new; @skill = CharacterSkillData.new; end
  def edit; end

  def create
    @skill = CharacterSkillData.new(skill_params)
    if @skill.save
      redirect_to character_skill_data_index_path, notice: "Skill data created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @skill.update(skill_params)
      redirect_to character_skill_data_index_path, notice: "Skill data updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.update!(disabled: true)
    redirect_to character_skill_data_index_path, notice: "Skill data disabled."
  end

  private

  def set_skill
    @skill = CharacterSkillData.find(params[:id])
  end

  def skill_params
    params.require(:character_skill_data).permit(:skill, :related_attribute, :disabled)
  end
end
