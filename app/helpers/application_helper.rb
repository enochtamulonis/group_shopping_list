module ApplicationHelper
  def list_item_border_color(completed)
    if completed
      "border-green-600"
    else
      "border-gray-200"
    end
  end
end
