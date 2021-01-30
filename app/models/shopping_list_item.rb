class ShoppingListItem < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :user

  validates :name, presence: true

  after_create_commit {broadcast_prepend_to "shopping_list_items"}
  after_update_commit {broadcast_replace_to "shopping_list_items"}
end
