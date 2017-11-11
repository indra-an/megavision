class Admins::AdminsController < Admins::BaseController
  before_action :set_admin, only: [:destroy]
  before_action :load_channel_cities, only: [:new]

  # GET /admins
  def index
    @admins = Admin.includes(:channel_cities)
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      if  admin_params['channel_city_ids'].present?
        admin_params['channel_city_ids'].each{|x| @admin.admins_channel_cities.find_or_create_by(channel_city_id: x) if x.present?}
      end
      redirect_to admins_admins_path, notice: 'Admin was successfully created.'
    else
      render :new
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
    redirect_to admins_admins_path, notice: 'Admin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation, :channel_city_ids => [])
    end

    def load_channel_cities
      @channel_cities = ChannelCity.select(:id, :city).collect { |tag| [tag.city, tag.id] }
    end
end
