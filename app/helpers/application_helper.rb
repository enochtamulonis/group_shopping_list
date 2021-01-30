module ApplicationHelper
  def shopping_list_color(completed)
    if completed
      "green-600"
    else
      "gray-200"
    end
  end
end
