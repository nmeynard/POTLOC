require "application_system_test_case"

class WsEventsTest < ApplicationSystemTestCase
  setup do
    @ws_event = ws_events(:one)
  end

  test "visiting the index" do
    visit ws_events_url
    assert_selector "h1", text: "Ws events"
  end

  test "should create ws event" do
    visit ws_events_url
    click_on "New ws event"

    fill_in "Qty left", with: @ws_event.qty_left
    fill_in "Shoe model", with: @ws_event.shoe_model_id
    fill_in "Shoe store", with: @ws_event.shoe_store_id
    click_on "Create Ws event"

    assert_text "Ws event was successfully created"
    click_on "Back"
  end

  test "should update Ws event" do
    visit ws_event_url(@ws_event)
    click_on "Edit this ws event", match: :first

    fill_in "Qty left", with: @ws_event.qty_left
    fill_in "Shoe model", with: @ws_event.shoe_model_id
    fill_in "Shoe store", with: @ws_event.shoe_store_id
    click_on "Update Ws event"

    assert_text "Ws event was successfully updated"
    click_on "Back"
  end

  test "should destroy Ws event" do
    visit ws_event_url(@ws_event)
    click_on "Destroy this ws event", match: :first

    assert_text "Ws event was successfully destroyed"
  end
end
