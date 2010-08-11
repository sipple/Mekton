class CharacterTemplate < ActiveRecord::Base
  belongs_to :character
  has_one :character_template_data
end
