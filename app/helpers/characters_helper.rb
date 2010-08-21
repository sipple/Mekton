module CharactersHelper
  def editable(id, value)
    "<div class=\"edit\" id=\"#{id}\">#{value}</div>"
  end

  def static(id, value)
    "<div id=\"#{id}\">#{value}</div>"
  end

end
