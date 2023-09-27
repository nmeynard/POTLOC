json.extract! ws_event, :id, :shoe_store_id, :shoe_model_id, :qty_left, :created_at, :updated_at
json.url ws_event_url(ws_event, format: :json)
