require 'websocket-client-simple'

class WebsocketListener
  RECONNECT_DELAY = 5 # wait delay between connection retry
  MAX_RECONNECT_ATTEMPTS = 20 # max retry
  WS_URL = 'ws://127.0.0.1:8080' # websocket url

  @ws = nil
  @reconnect_attempts = 0

  def self.reconnect
    if @reconnect_attempts < MAX_RECONNECT_ATTEMPTS
      @reconnect_attempts += 1
      sleep RECONNECT_DELAY
      p "Retry attempt ##{@reconnect_attempts}"
      listen
    else
      puts "Max reconnect attempts reached"
    end
  end

  def self.listen
    begin
      @ws = WebSocket::Client::Simple.connect WS_URL

      @ws.on :message do |msg|
        # parse msg
        evt = JSON.parse(msg.data)
        # store msg in database
        begin
          rails_evt = WsEvent.create!(
            shoe_store_id: ShoeStore.find_by(:name => evt['store']).id,
            shoe_model_id: ShoeModel.find_by(:name => evt['model']).id,
            qty_left: evt['inventory']
          )
        rescue => e
          p e
          #ActiveRecord::Base.clear_active_connections!
          retry
        end
      end

      @ws.on :close do |close|
        # if websocket close, try to reconnect
        p close.inspect
        reconnect
      end

      @ws.on :error do |error|
        # if websocket error, try to reconnect
        p error.inspect
        reconnect
      end

    rescue => e
      # if connection raise error, try to reconnect
      p e
      reconnect
    end
  end
end
