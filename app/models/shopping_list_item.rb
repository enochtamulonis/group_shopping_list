class ShoppingListItem < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :user

  validates :name, presence: true

  after_create_commit {broadcast_prepend_to "shopping_list_items"}
  after_update_commit {broadcast_replace_to "shopping_list_items"}
  after_destroy_commit {broadcast_remove_to "shopping_list_items"}

  after_update :set_collected_count

  private

  def set_collected_count
    items_collected = shopping_list.shopping_list_items.select { |item| item.collected == true }.count
    if items_collected == 0
      shopping_list.update(completed: false)
    elsif items_collected % shopping_list.shopping_list_items.count == 0
      shopping_list.update(completed: true)
    end
  end
end
