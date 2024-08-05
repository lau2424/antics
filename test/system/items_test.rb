require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Category", with: @item.category
    fill_in "Century", with: @item.century
    fill_in "Content", with: @item.content
    fill_in "Depth", with: @item.depth
    fill_in "Height", with: @item.height
    fill_in "Length", with: @item.length
    fill_in "Matter", with: @item.matter
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Status", with: @item.status
    fill_in "Style", with: @item.style
    fill_in "User", with: @item.user_id
    fill_in "Width", with: @item.width
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Category", with: @item.category
    fill_in "Century", with: @item.century
    fill_in "Content", with: @item.content
    fill_in "Depth", with: @item.depth
    fill_in "Height", with: @item.height
    fill_in "Length", with: @item.length
    fill_in "Matter", with: @item.matter
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Status", with: @item.status
    fill_in "Style", with: @item.style
    fill_in "User", with: @item.user_id
    fill_in "Width", with: @item.width
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
