class MechaSubassemblyData < ActiveRecord::Base
  include Mekton::NamedScopes

  def weight
    super || 0
  end

end
