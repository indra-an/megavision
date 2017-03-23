class Admins::ChannelCitiesController < Admins::BaseController
  before_action :load_channels, except: [:index, :show, :destroy]
  before_action :set_channel_city, only: [:edit, :update, :destroy]

  # GET /channel_cities
  def index
    @channel_cities = ChannelCity.all
  end

  # GET /channel_cities/new
  def new
    @channel_city = ChannelCity.new
  end

  # GET /channel_cities/1/edit
  def edit
  end

  # POST /channel_cities
  def create
    @channel_city = ChannelCity.new(channel_city_params)

    if @channel_city.save
      redirect_to admins_channel_cities_path, notice: 'Channel city was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /channel_cities/1
  def update
    if @channel_city.update(channel_city_params)
      redirect_to admins_channel_cities_path, notice: 'Channel city was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /channel_cities/1
  def destroy
    @channel_city.destroy
    redirect_to admins_channel_cities_path, notice: 'Channel city was successfully destroyed.'
  end

  private
    def load_channels
      @channels = Channel.select(:id, :name).collect { |tag| [tag.name, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_channel_city
      @channel_city = ChannelCity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_city_params
      params.require(:channel_city).permit(:city, :channel_ids => [])
    end
end
