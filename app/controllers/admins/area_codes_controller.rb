class Admins::AreaCodesController < Admins::BaseController
  before_action :load_resources, except: [:index, :show, :destroy]
  before_action :set_area_code, only: [:show, :edit, :update, :destroy]

  # GET /area_codes
  def index
    @area_codes = AreaCode.all
  end

  # GET /area_codes/1
  def show
  end

  # GET /area_codes/new
  def new
    @area_code = AreaCode.new
  end

  # GET /area_codes/1/edit
  def edit
  end

  # POST /area_codes
  def create
    @area_code = AreaCode.new(area_code_params)

    if @area_code.save
      redirect_to admins_area_codes_path, notice: 'Area code was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /area_codes/1
  def update
    if @area_code.update(area_code_params)
      redirect_to admins_area_codes_path, notice: 'Area code was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /area_codes/1
  def destroy
    @area_code.destroy
    redirect_to admins_area_codes_path, notice: 'Area code was successfully destroyed.'
  end

  private
    def load_resources
      @channel_types = ChannelType.select(:id, :name).collect { |tag| [tag.name, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_area_code
      @area_code = AreaCode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_code_params
      params.require(:area_code).permit(:code, :channel_type_ids)
    end
end
