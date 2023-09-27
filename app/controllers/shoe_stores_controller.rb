class ShoeStoresController < ApplicationController
  before_action :set_shoe_store, only: %i[ show edit update destroy ]

  # GET /shoe_stores or /shoe_stores.json
  def index
    @shoe_stores = ShoeStore.all
  end

  # GET /shoe_stores/1 or /shoe_stores/1.json
  def show
  end

  # GET /shoe_stores/new
  def new
    @shoe_store = ShoeStore.new
  end

  # GET /shoe_stores/1/edit
  def edit
  end

  # POST /shoe_stores or /shoe_stores.json
  def create
    @shoe_store = ShoeStore.new(shoe_store_params)

    respond_to do |format|
      if @shoe_store.save
        format.html { redirect_to shoe_store_url(@shoe_store), notice: "Shoe store was successfully created." }
        format.json { render :show, status: :created, location: @shoe_store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shoe_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoe_stores/1 or /shoe_stores/1.json
  def update
    respond_to do |format|
      if @shoe_store.update(shoe_store_params)
        format.html { redirect_to shoe_store_url(@shoe_store), notice: "Shoe store was successfully updated." }
        format.json { render :show, status: :ok, location: @shoe_store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shoe_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoe_stores/1 or /shoe_stores/1.json
  def destroy
    @shoe_store.destroy

    respond_to do |format|
      format.html { redirect_to shoe_stores_url, notice: "Shoe store was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe_store
      @shoe_store = ShoeStore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shoe_store_params
      params.require(:shoe_store).permit(:name)
    end
end
