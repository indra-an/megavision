class Admins::AreaCoveragesController < Admins::BaseController
  before_action :load_resources, except: [:index, :show, :destroy]
  before_action :set_coverage, only: [:edit, :update, :destroy]

  def index
    @area_coverages = AreaCoverage.all
    @channel_cities = ChannelCity.all
  end

  def new
    @area_coverage = AreaCoverage.new
  end

  def edit
  end

  def create
    @area_coverage = AreaCoverage.new(area_coverage_params)

    if @area_coverage.save
      redirect_to admins_area_coverages_path, notice: 'Area coverage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @area_coverage.update(area_coverage_params)
      redirect_to admins_area_coverages_path, notice: 'Area coverage was successfully updated.'
    else
      render :edit
    end
  end

  def download_template
    AreaCoverage.download_template
    send_file Rails.public_path + "template_xls/download_template_coverage.xls", disposition: "inline"
  end

  def import
    @area_coverage = AreaCoverage.new
  end

  def import_area
      if params[:area_coverage].present? && params[:area_coverage][:file].present?
        status, err_message = AreaCoverage.import(params[:area_coverage][:file])
        if status
          flash[:notice] = "Import Area Coverage Successfully"
        else
          flash[:error] = err_message
        end
      else
        flash[:error] = "File not exists"
      end

      redirect_to admins_area_coverages_path
  end

  def destroy
    @area_coverage.destroy
    redirect_to admins_area_coverages_path, notice: 'Area coverage was successfully destroyed.'
  end

  private
    def load_resources
      @channel_cities = ChannelCity.select(:id, :city).collect { |tag| [tag.city, tag.id] }
      @area_codes = AreaCode.select(:id, :code).collect { |tag| [tag.code, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_coverage
      @area_coverage = AreaCoverage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_coverage_params
      params.require(:area_coverage).permit(:channel_city_id, :area, :area_code_id)
    end
end
