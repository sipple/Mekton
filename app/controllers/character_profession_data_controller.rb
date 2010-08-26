class CharacterProfessionDataController < ApplicationController
  def index
    @professions = CharacterProfessionData.all
  end

  def show
    @profession = CharacterProfessionData.find(params[:id])
    @profession_skills = @profession.character_profession_skill_data
    @skill_list = CharacterSkillData.all
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
    @profession = CharacterProfessionData.find(params[:id])
    if params[:checked]
      @profession.character_profession_skill_data.create(:character_skill_data_id => params[:character_skill_data_id],
                                                         :bonus => 1)
    else
      @profession.character_profession_skill_data.find(params[:character_skill_data_id]).destroy
    end

  end

  def destroy
  end

end
