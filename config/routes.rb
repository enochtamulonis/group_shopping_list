Rails.application.routes.draw do
  devise_for :users

  resources :shopping_lists do
    resources :shopping_list_items
  end

  resources :memberships, only: [:create]

  get 'components/user_dropdown_content'
  get 'components/join_a_list'
  get 'components/share_list'

  root "shopping_lists#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
