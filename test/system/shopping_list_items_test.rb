require "application_system_test_case"

class ShoppingListItemsTest < ApplicationSystemTestCase
  setup do
    @shopping_list_item = shopping_list_items(:one)
  end

  test "visiting the index" do
    visit shopping_list_items_url
    assert_selector "h1", text: "Shopping List Items"
  end

  test "creating a Shopping list item" do
    visit shopping_list_items_url
    click_on "New Shopping List Item"

    fill_in "Amount", with: @shopping_list_item.amount
    check "Collected" if @shopping_list_item.collected
    fill_in "Name", with: @shopping_list_item.name
    fill_in "Shopping list", with: @shopping_list_item.shopping_list_id
    fill_in "User", with: @shopping_list_item.user_id
    click_on "Create Shopping list item"

    assert_text "Shopping list item was successfully created"
    click_on "Back"
  end

  test "updating a Shopping list item" do
    visit shopping_list_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @shopping_list_item.amount
    check "Collected" if @shopping_list_item.collected
    fill_in "Name", with: @shopping_list_item.name
    fill_in "Shopping list", with: @shopping_list_item.shopping_list_id
    fill_in "User", with: @shopping_list_item.user_id
    click_on "Update Shopping list item"

    assert_text "Shopping list item was successfully updated"
    click_on "Back"
  end

  test "destroying a Shopping list item" do
    visit shopping_list_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shopping list item was successfully destroyed"
  end
end
