class Admins::ChannelTypesController < Admins::BaseController
  before_action :load_channel_cities, except: [:index, :show, :destroy]
  before_action :set_channel_type, only: [:edit, :update, :destroy]

  # GET /channel_types
  def index
    @channel_types = ChannelType.all
  end

  # GET /channel_types/new
  def new
    @channel_type = ChannelType.new
  end

  # GET /channel_types/1/edit
  def edit
  end

  # POST /channel_types
  def create
    @channel_type = ChannelType.new(channel_type_params)

    if @channel_type.save
      redirect_to admins_channel_types_path, notice: 'Channel type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /channel_types/1
  def update
    if @channel_type.update(channel_type_params)
      redirect_to admins_channel_types_path, notice: 'Channel type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /channel_types/1
  def destroy
    @channel_type.destroy
    redirect_to admins_channel_types_path, notice: 'Channel type was successfully destroyed.'
  end

  private
    def load_channel_cities
      @channel_cities = ChannelCity.select(:id, :city).collect { |tag| [tag.city, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_channel_type
      @channel_type = ChannelType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_type_params
      params.require(:channel_type).permit(:name, :channel_city_ids => [])
    end
end
