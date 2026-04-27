class MechaSubassemblyData < ApplicationRecord
  scope :active, -> { where(disabled: false).order(subassembly: :asc) }

  def weight
    super || 0
  end
end
