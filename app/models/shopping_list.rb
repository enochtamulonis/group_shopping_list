class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :shopping_list_items

  validates :title, presence: true

  after_update_commit { broadcast_replace_to "shopping_lists" }

end
