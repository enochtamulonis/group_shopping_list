class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  before_action :is_user_a_member?, only: [:show]
  # GET /shopping_lists or /shopping_lists.json
  def index
    users_shopping_lists = current_user.shopping_lists
    users_joined_lists = current_user.joined_lists
    @users_lists = users_shopping_lists + users_joined_lists
  end

  # GET /shopping_lists/1 or /shopping_lists/1.json
  def show
  end

  # GET /shopping_lists/new
  def new
    @shopping_list = ShoppingList.new
  end

  # GET /shopping_lists/1/edit
  def edit
  end

  # POST /shopping_lists or /shopping_lists.json
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.creator = current_user
    respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to @shopping_list, notice: "Shopping list was successfully created." }
        format.json { render :show, status: :created, location: @shopping_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_lists/1 or /shopping_lists/1.json
  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        format.html { redirect_to @shopping_list, notice: "Shopping list was successfully updated." }
        format.json { render :show, status: :ok, location: @shopping_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1 or /shopping_lists/1.json
  def destroy
    @shopping_list.destroy
    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: "Shopping list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_list_params
      params.require(:shopping_list).permit(:title, :completed)
    end

    def is_user_a_member?
      return true if @shopping_list.joined_members.find_by_id(current_user.id) || @shopping_list.creator == current_user
      if params[:key] == @shopping_list.random_key
        set_current_user_as_member
      else
        redirect_to root_path
      end
    end

    def set_current_user_as_member
      Membership.create(user: current_user, shopping_list: @shopping_list)
      redirect_to @shopping_list
    end
end
