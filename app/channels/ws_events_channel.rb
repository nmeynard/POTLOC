class WsEventsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ws_events"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
