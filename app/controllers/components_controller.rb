class ComponentsController < ApplicationController
  def share_list
    @shopping_list = ShoppingList.find_by_id(params[:id])
  end

  def join_a_list
    @membership = Membership.new 
  end
end
