module ApplicationHelper
  def is_active?(link_path)
    if current_page?(link_path)
      "focus-tab"
    else
      ""
    end
  end
end
