class AddRandomKeyToShoppingLists < ActiveRecord::Migration[6.1]
  def change
    add_column :shopping_lists, :random_key, :string, unique: true
  end
end
