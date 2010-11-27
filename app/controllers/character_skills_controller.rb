class CharacterSkillsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @character_skill = CharacterSkill.new(:character_id => params[:character_id], :level => 0)

    respond_to do |format|
      if @character_skill.save
        flash[:notice] = 'Test was successfully created.'
        format.html { render :partial => 'character_skill_line', :locals => {:character_skill => @character_skill} }
        format.xml  { render :xml => @character_skill, :status => :created, :location => @character_skill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character_skill.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @character_skill = CharacterSkill.find(params[:id])
    @character_skill.send("#{params[:field]}=", params[:value])

    respond_to do |format|
      if @character_skill.save
        format.json { render :text => character_skill_json(@character_skill)}
      end
    end
  end

  def destroy
    @character_skill = CharacterSkill.find(params[:id])
    @character_skill.destroy

    respond_to do |format|
      format.html { redirect_to(character_skills_url) }
      format.json {render :text => 'Success'}
      format.xml  { head :ok }
    end
  end

  private

  def character_skill_json(character_skill)
    skill_data = character_skill.character_skill_data
    json_hash = Hash.new
    json_hash["character_skill_data_id"] = skill_data.skill
    json_hash["level"] = character_skill.level
    json_hash["ip_earned"] = character_skill.ip_earned
    json_hash["attribute_bonus"] = character_skill.attribute_bonus
    json_hash["total"] = character_skill.total
    json_hash.to_json
  end

end
