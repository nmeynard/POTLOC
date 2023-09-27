require "test_helper"

class WsEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ws_event = ws_events(:one)
  end

  test "should get index" do
    get ws_events_url
    assert_response :success
  end

  test "should get new" do
    get new_ws_event_url
    assert_response :success
  end

  test "should create ws_event" do
    assert_difference("WsEvent.count") do
      post ws_events_url, params: { ws_event: { qty_left: @ws_event.qty_left, shoe_model_id: @ws_event.shoe_model_id, shoe_store_id: @ws_event.shoe_store_id } }
    end

    assert_redirected_to ws_event_url(WsEvent.last)
  end

  test "should show ws_event" do
    get ws_event_url(@ws_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_ws_event_url(@ws_event)
    assert_response :success
  end

  test "should update ws_event" do
    patch ws_event_url(@ws_event), params: { ws_event: { qty_left: @ws_event.qty_left, shoe_model_id: @ws_event.shoe_model_id, shoe_store_id: @ws_event.shoe_store_id } }
    assert_redirected_to ws_event_url(@ws_event)
  end

  test "should destroy ws_event" do
    assert_difference("WsEvent.count", -1) do
      delete ws_event_url(@ws_event)
    end

    assert_redirected_to ws_events_url
  end
end
