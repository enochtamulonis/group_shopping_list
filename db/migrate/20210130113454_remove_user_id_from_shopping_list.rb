class RemoveUserIdFromShoppingList < ActiveRecord::Migration[6.1]
  def change
    remove_column :shopping_lists, :user_id
  end
end
