class Character < ActiveRecord::Base
  has_many :character_armors
  has_many :character_equipments
  has_many :character_profession_skills
  has_many :character_professions
  has_many :character_skills
  has_many :character_template_skills
  has_many :character_weapons

  has_one :character_template

end
