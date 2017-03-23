class Admins::PricesController < Admins::BaseController
  before_action :set_price, only: [:edit, :update, :destroy]

  # GET /prices
  def index
    @prices = Price.all
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to admins_prices_path, notice: 'Price was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /prices/1
  def update
    if @price.update(price_params)
      redirect_to admins_prices_path, notice: 'Price was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prices/1
  def destroy
    @price.destroy
    redirect_to admins_prices_path, notice: 'Price was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def price_params
      params.require(:price).permit(:amount, :up_to_speed, :unit)
    end
end
