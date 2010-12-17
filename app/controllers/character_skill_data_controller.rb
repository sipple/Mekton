class CharacterSkillDataController < ApplicationController
  def index
    @skills = CharacterSkillData.active(:order => "skill")
  end

  def show
    @skill = CharacterSkillData.find(params[:id])
  end

  def new
    @skill = CharacterSkillData.new
  end

  def edit
    @skill = CharacterSkillData.find(params[:id])
  end

  def create
    @skill = CharacterSkillData.new(params[:character_skill_data])

    if @skill.save
      redirect_to(character_skill_data_index_path)
    end

  end

  def update
    @skill = CharacterSkillData.find(params[:id])
    @skill.update_attributes(params[:character_skill_data])
    redirect_to(character_skill_data_index_path)


  end

  def destroy
    @skill = CharacterSkillData.find(params[:id])
    @skill.disabled = true
    if @skill.save
      redirect_to(character_skill_data_index_path)
    end
  end

end
