module CharactersHelper
  def editable(id, value)
    "<div class=\"edit\" id=\"#{id}\">#{value}</div>"
  end

  def editable_row_select(id, value)
    "<div class=\"editable-row-select\" id=\"#{id}\">#{value}</div>"
  end

  def static(id, value)
    "<div id=\"#{id}\">#{value}</div>"
  end

end
