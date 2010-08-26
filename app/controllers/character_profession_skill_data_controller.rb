class CharacterProfessionSkillDataController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @profession = CharacterProfessionData.find(params[:character_profession_data_id])
    @profession_skill = @profession.character_profession_skill_data.create(:character_skill_data_id => params[:character_skill_data_id],
                                                    :bonus => 1)

    render :text => skill_json(@profession_skill)
    
  end

  def update
    @profession_skill = CharacterProfessionSkillData.find(:first,
                                                          :conditions => "character_skill_data_id = #{params[:id]}")

    @profession_skill.bonus = params[:bonus]
    @profession_skill.save

    render :text => skill_json(@profession_skill)

  end

  def destroy
    @profession_skill = CharacterProfessionSkillData.find(:first,
                                                          :conditions => "character_skill_data_id = #{params[:id]}")
    @profession_skill.destroy

    render :text => "success"
  end

  private

  def skill_json(profession_skill)

    json_hash = Hash.new
    json_hash["character_skill_data_id"] = profession_skill.character_skill_data_id
    json_hash["bonus"] = profession_skill.bonus
    json_hash.to_json    
    
  end

end