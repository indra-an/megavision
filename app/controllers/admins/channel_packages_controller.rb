class Admins::ChannelPackagesController < Admins::BaseController
  before_action :load_resources, except: [:index, :show, :destroy]
  before_action :set_channel_package, only: [:edit, :update, :destroy]

  # GET /channel_packages
  def index
    @channel_packages = ChannelPackage.includes(:package)
            .where( channel_cities_type_id: params[:type_id] )
  end

  # GET /channel_packages/1/edit
  def edit
  end

  # PATCH/PUT /channel_packages/1
  def update
    @channel_package.update_column(:description, channel_package_params['description'])
    if channel_package_params['channel_group_ids'].present? || channel_package_params['price_ids'].present?
      if channel_package_params['channel_group_ids'].present?
        @channel_package.channel_package_channel_groups.each do |channel_group|
          unless channel_package_params['channel_group_ids'].include?channel_group.channel_group_id.to_s
            channel_group.destroy
          end
        end

        channel_package_params['channel_group_ids'].each do |x|
          @channel_package.channel_package_channel_groups.find_or_create_by(channel_group_id: x) if x.present?
        end
      end

      if channel_package_params['price_ids'].present?
        @channel_package.channel_package_prices.each do |price|
          unless channel_package_params['price_ids'].include?price.price_id.to_s
            price.destroy
          end
        end

        channel_package_params['price_ids'].each do |x|
          @channel_package.channel_package_prices.find_or_create_by(price_id: x) if x.present?
        end
      end

      redirect_to admins_channel_city_type_channel_packages_path(params[:channel_city_id], params[:type_id]), notice: 'Channel Package was successfully updated.'
    else
      render :edit
    end
  end

  private
    def load_resources
      @channel_groups = ChannelGroup.select(:id, :name).collect { |tag| [tag.name, tag.id] }
      @prices = Price.all.collect { |tag| [tag.tag_name, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_channel_package
      @channel_package = ChannelPackage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_package_params
      params.require(:channel_package).permit(:description, :channel_group_ids => [], :price_ids => [])
    end
end
