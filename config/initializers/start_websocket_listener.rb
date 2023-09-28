def start_websocket_client
    Thread.new do
      WebsocketListener.listen
    rescue StandardError => e
      Rails.logger.error "WebSocket Thread Error: #{e.message}. Restarting..."
      retry
    end
  end
  
  # check if app is started as a server (rails s)
  if defined?(Rails::Server)
    websocket_thread = start_websocket_client
  
    # periodic check : is thread alive ? if not, restart
    Thread.new do
      loop do
        sleep 10 # Vérifier toutes les 10 secondes, ajustez selon vos besoins
        unless websocket_thread.alive?
          Rails.logger.warn "WebSocket Thread has died. Restarting..."
          Thread.kill(websocket_thread)
          ActiveRecord::Base.clear_active_connections!
          websocket_thread = start_websocket_client
        end
      end
    end
  end
  