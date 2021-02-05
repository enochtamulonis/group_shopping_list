class ShoppingListItemsController < ApplicationController
  before_action :set_shopping_list_item, only: %i[ show edit update destroy ]
  before_action :set_shopping_list
  # GET /shopping_list_items or /shopping_list_items.json
  def index
    @shopping_list_items = ShoppingListItem.all
  end

  # GET /shopping_list_items/1/edit
  def edit
  end

  # POST /shopping_list_items or /shopping_list_items.json
  def create
    @shopping_list_item = @shopping_list.shopping_list_items.new(shopping_list_item_params)
    @shopping_list_item.user = current_user
    respond_to do |format|
      if @shopping_list_item.save
        format.html { redirect_to @shopping_list_item.shopping_list }
      else
        format.html { redirect_to @shopping_list_item.shopping_list, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_list_items/1 or /shopping_list_items/1.json
  def update
    respond_to do |format|
      if @shopping_list_item.update(shopping_list_item_params)
        format.html { redirect_to @shopping_list_item.shopping_list }
        format.json { render :show, status: :ok, location: @shopping_list_item }
      else
        format.html { redirect_to @shopping_list_item.shopping_list, status: :unprocessable_entity }
        format.json { render json: @shopping_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_list_items/1 or /shopping_list_items/1.json
  def destroy
    @shopping_list_item.destroy
    respond_to do |format|
      format.html { redirect_to @shopping_list, notice: "Shopping list item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list_item
      @shopping_list_item = ShoppingListItem.find(params[:id])
    end

    def set_shopping_list
      @shopping_list = ShoppingList.find_by_id(params[:shopping_list_id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_list_item_params
      params.require(:shopping_list_item).permit(:name, :amount, :collected)
    end
end
