class CharacterArmorData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(armor: :asc) }
end
