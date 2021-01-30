class MembershipsController < ApplicationController
  require 'pry'

  def create
    shopping_list = ShoppingList.find_by_random_key(params[:membership][:shopping_list_key])
    if shopping_list.creator == current_user
      redirect_to components_join_a_list_path, notice: "You cant join a list that you created"
    end
    membership = Membership.create(user: current_user, shopping_list: shopping_list)
    if membership
      redirect_to shopping_list
    else
      redirect_to components_join_a_list_path, notice: "there was a problem joining the list"
    end
  end
end
