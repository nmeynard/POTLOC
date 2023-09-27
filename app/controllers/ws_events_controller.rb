class WsEventsController < ApplicationController
  before_action :set_ws_event, only: %i[ show edit update destroy ]

  # GET /ws_events or /ws_events.json
  def index
    @ws_events = WsEvent.all
  end

  # GET /ws_events/1 or /ws_events/1.json
  def show
  end

  # GET /ws_events/new
  def new
    @ws_event = WsEvent.new
  end

  # GET /ws_events/1/edit
  def edit
  end

  # POST /ws_events or /ws_events.json
  def create
    @ws_event = WsEvent.new(ws_event_params)

    respond_to do |format|
      if @ws_event.save
        format.html { redirect_to ws_event_url(@ws_event), notice: "Ws event was successfully created." }
        format.json { render :show, status: :created, location: @ws_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ws_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ws_events/1 or /ws_events/1.json
  def update
    respond_to do |format|
      if @ws_event.update(ws_event_params)
        format.html { redirect_to ws_event_url(@ws_event), notice: "Ws event was successfully updated." }
        format.json { render :show, status: :ok, location: @ws_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ws_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ws_events/1 or /ws_events/1.json
  def destroy
    @ws_event.destroy

    respond_to do |format|
      format.html { redirect_to ws_events_url, notice: "Ws event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ws_event
      @ws_event = WsEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ws_event_params
      params.require(:ws_event).permit(:shoe_store_id, :shoe_model_id, :qty_left)
    end
end
