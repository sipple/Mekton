module CharactersHelper
  def editable(id, value)
    "<div class=\"edit\" id=\"#{id}\">#{value}</div>"
  end

  def editable_text_area(id, value)
    "<div class=\"editable-text-area\" id=\"#{id}\">#{value}</div>"
  end

  def editable_select(id, value)
    "<div class=\"editable-select\" id=\"#{id}\">#{value}</div>"
  end

  def editable_row_select(id, value)
    "<div class=\"editable-row-select\" id=\"#{id}\">#{value}</div>"
  end

  def editable_row_field(id, value)
    "<div class=\"editable-row-field\" id=\"#{id}\">#{value}</div>"
  end

  def static(id, value)
    "<div id=\"#{id}\">#{value}</div>"
  end

  def related_attributes_array
    ["Attractiveness", "Body Type", "Cool", "Education", "Empathy", "Intelligence", "Luck", "Move Allowance",
     "Psi Ability", "Reflexes", "Tech Ability"]
  end

end
