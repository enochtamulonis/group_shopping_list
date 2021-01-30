class AddUserIdToShoppingLists < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_lists, :user_id, :integer
  end
end
