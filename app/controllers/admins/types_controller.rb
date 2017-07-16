class Admins::TypesController < Admins::BaseController
  before_action :load_packages, except: [:index, :show, :destroy]
  before_action :set_channel_type, only: [:edit, :update, :destroy]

  # GET /types
  def index
    @channel_types = ChannelCitiesType.includes(:channel_type)
            .where( channel_city_id: params[:channel_city_id] )
  end

  # GET /types/1/edit
  def edit
  end

  # PATCH/PUT /types/1
  def update
    if channel_type_params['channel_package_ids'].present?
      @channel_type.channel_packages.each do |channel_package|
        unless channel_type_params['channel_package_ids'].include?channel_package.package.id.to_s
          channel_package.destroy
        end
      end
      channel_type_params['channel_package_ids'].each{|x| @channel_type.channel_packages.find_or_create_by(package_id: x) if x.present?}
      redirect_to admins_channel_city_types_path(params[:channel_city_id]), notice: 'Channel type was successfully updated.'
    else
      render :edit
    end
  end

  private
    def load_packages
      @packages = Package.select(:id, :name).collect { |tag| [tag.name, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_channel_type
      @channel_type = ChannelCitiesType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_type_params
      params.require(:channel_cities_type).permit(:channel_package_ids => [])
    end
end
