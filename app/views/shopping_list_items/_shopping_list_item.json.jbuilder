json.extract! shopping_list_item, :id, :name, :amount, :collected, :shopping_list_id, :user_id, :created_at, :updated_at
json.url shopping_list_item_url(shopping_list_item, format: :json)
