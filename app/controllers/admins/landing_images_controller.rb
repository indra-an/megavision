class Admins::LandingImagesController < Admins::BaseController
  before_action :set_landing_image, only: [:show, :edit, :update, :destroy, :make_draft, :make_published]

  # GET /landing_images
  def index
    @landing_images = LandingImage.all
  end

  # GET /landing_images/1
  def show
  end

  # GET /landing_images/new
  def new
    @landing_image = LandingImage.new
  end

  # GET /landing_images/1/edit
  def edit
  end

  # POST /landing_images
  def create
    @landing_image = LandingImage.new(landing_image_params)

    if @landing_image.save
      redirect_to admins_landing_images_path, notice: 'Landing image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /landing_images/1
  def update
    if @landing_image.update(landing_image_params)
      redirect_to admins_landing_images_path, notice: 'Landing image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /landing_images/1
  def destroy
    @landing_image.destroy
    redirect_to admins_landing_images_path, notice: 'Landing image was successfully destroyed.'
  end

  def make_draft
    @landing_image.draft! if @landing_image.published?
    redirect_to admins_landing_images_path, notice: 'Landing image was successfully drafted'
  end

  def make_published
    @landing_image.published! if @landing_image.draft?
    redirect_to admins_landing_images_path, notice: 'Landing image was successfully published'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing_image
      landing_image_id = params[:id] || params[:landing_image_id]
      @landing_image = LandingImage.find(landing_image_id)
    end

    # Only allow a trusted parameter "white list" through.
    def landing_image_params
      params.require(:landing_image).permit(:title, :subtitle, :background, :addon_image)
    end
end
