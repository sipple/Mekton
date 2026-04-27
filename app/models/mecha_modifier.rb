class MechaModifier < ApplicationRecord
  belongs_to :mecha
  belongs_to :mecha_attribute_data, optional: true
end
