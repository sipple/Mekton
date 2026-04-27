class CharacterTemplate < ApplicationRecord
  belongs_to :character
  belongs_to :character_template_data
end
