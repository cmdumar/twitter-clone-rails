module ApplicationHelper
  def nothingFound(arg)
    if arg.empty?
      content_tag(:p, "Nothing found!")
    end
  end
end
