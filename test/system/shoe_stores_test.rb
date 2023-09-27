require "application_system_test_case"

class ShoeStoresTest < ApplicationSystemTestCase
  setup do
    @shoe_store = shoe_stores(:one)
  end

  test "visiting the index" do
    visit shoe_stores_url
    assert_selector "h1", text: "Shoe stores"
  end

  test "should create shoe store" do
    visit shoe_stores_url
    click_on "New shoe store"

    fill_in "Name", with: @shoe_store.name
    click_on "Create Shoe store"

    assert_text "Shoe store was successfully created"
    click_on "Back"
  end

  test "should update Shoe store" do
    visit shoe_store_url(@shoe_store)
    click_on "Edit this shoe store", match: :first

    fill_in "Name", with: @shoe_store.name
    click_on "Update Shoe store"

    assert_text "Shoe store was successfully updated"
    click_on "Back"
  end

  test "should destroy Shoe store" do
    visit shoe_store_url(@shoe_store)
    click_on "Destroy this shoe store", match: :first

    assert_text "Shoe store was successfully destroyed"
  end
end
