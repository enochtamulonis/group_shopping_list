module ApplicationHelper
  def list_item_border_color(completed)
    if completed
      "border-green-600"
    else
      "border-gray-200"
    end
  end

  def shopping_list_color(completed)
    if completed
      "bg-green-500"
    else
      "bg-gray-400"
    end
  end
end
