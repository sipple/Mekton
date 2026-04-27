class CharacterEquipmentData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(equipment: :asc) }
end
