Rails.application.routes.draw do
  devise_for :users

  resources :shopping_lists do
    resources :shopping_list_items
  end

  get 'components/user_dropdown_content'

  root "shopping_lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
