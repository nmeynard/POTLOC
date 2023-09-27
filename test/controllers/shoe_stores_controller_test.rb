require "test_helper"

class ShoeStoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoe_store = shoe_stores(:one)
  end

  test "should get index" do
    get shoe_stores_url
    assert_response :success
  end

  test "should get new" do
    get new_shoe_store_url
    assert_response :success
  end

  test "should create shoe_store" do
    assert_difference("ShoeStore.count") do
      post shoe_stores_url, params: { shoe_store: { name: @shoe_store.name } }
    end

    assert_redirected_to shoe_store_url(ShoeStore.last)
  end

  test "should show shoe_store" do
    get shoe_store_url(@shoe_store)
    assert_response :success
  end

  test "should get edit" do
    get edit_shoe_store_url(@shoe_store)
    assert_response :success
  end

  test "should update shoe_store" do
    patch shoe_store_url(@shoe_store), params: { shoe_store: { name: @shoe_store.name } }
    assert_redirected_to shoe_store_url(@shoe_store)
  end

  test "should destroy shoe_store" do
    assert_difference("ShoeStore.count", -1) do
      delete shoe_store_url(@shoe_store)
    end

    assert_redirected_to shoe_stores_url
  end
end
